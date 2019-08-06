function [Image] = ArduinoserialImage()
clear all
clear 
S = serial('COM23','BaudRate',9600);
Image = zeros(24,32);
S.InputBufferSize = 6000;
fopen(S);
fprintf(S,'*IDN?');
out = fscanf(S);
out = string(out);
newStr=extractBetween(out,"begin","end");
newStr =strsplit(newStr,',');
for j=1:24
    for  i=1:32
       
        Image(j,i) =str2double(newStr(i+(j-1)*32));
        
    end
end
figure()
imshow(Image);
fclose(S);
delete(S);

end

