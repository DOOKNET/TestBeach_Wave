%=============����ϵͳ����==============%
f1=50e4;        %���ò���Ƶ��
f2=30e4;
f3=10e4;
Fs=50e6;        %���ò���Ƶ��
L=1024;         %���ݳ���
N=14;           %����λ��
%=============���������ź�==============%
t=0:1/Fs:(1/Fs)*(L-1);
y1=sin(2*pi*f1*t);
y2=sin(2*pi*f2*t);
y3=sin(2*pi*f3*t);
y4=y1+y2+y3;
y_n=round(y4*(2^(N-3)-1));      %N��������;�����n���ź���ӣ������ã�N-n��
%=================��ͼ==================%
a=10;           %�ı�ϵ�����Ե�����ʾ����
stem(t,y_n);
axis([0 L/Fs/a -2^N 2^N]);      %��ʾ
%=============д���ⲿ�ļ�==============%
fid=fopen('E:/Workspace/Vivado_16.4/2017_11_8_TestBeach/TestBeach/sin_data.txt','w');    %������д��sin_data.txt�ļ��У����û�оʹ������ļ�  
for k=1:length(y_n)
    B_s=dec2bin(y_n(k)+((y_n(k))<0)*2^N,N);
    for j=1:N
        if B_s(j)=='1'
            tb=1;
        else
            tb=0;
        end
        fprintf(fid,'%d',tb);
    end
    fprintf(fid,'\r\n');
end

fprintf(fid,';');
fclose(fid);
    
