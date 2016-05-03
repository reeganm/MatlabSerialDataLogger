%matlab serial port data logger

%get port value
port = input('Serial port? : ','s');
%make a file name
filename = input('unique file name : ','s');

%make serial object
s = serial(port);
s.Baudrate = 115200;

%open port and file
try
    fopen(s);
    fileID = fopen(filename,'w');
    while true
        string = fgetl(s);
        fprintf(fileID,string);
    end
    
catch
    %something goes wrong close serial port
    fclose(s);
    delete(s);
    fclose(fileID);
end