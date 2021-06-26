clc;
clear all;
close all
opts=detectImportOptions('DatasetWP.xlsx');
opts.SelectedVariableNames = (3:8);
tr=readmatrix('DatasetWP.xlsx',opts); %fungsi untuk membaca dataset excel
dt = tr(1:50,1:3);
dt2 = tr(1:50,6);
z = [dt dt2];
k = [0,0,1,0]; %menentukan data termasuk cost/benefit
w = [3,5,4,1]; %menentukan bobot kriteria

%proses yang pertama yaitu fiksasi bobot
[m n]=size (z); %menginisialisasi ukuran z untuk menentukan bobot 
wn=w./sum(w); %rumus untuk mencari bobot fix
 
%proses yang kedua, menghitung vektor(S) per baris
for j=1:n,
    if k(j)==0, wn(j)=-1*wn(j);
    end
end
for i=1:m,
    S(i)=prod(z(i,:).^wn);
end
 
V= S/sum(S); %proses terakhir, merangking data hasil
for i=1:m,
    if V(i)==max(V)
        disp("Hasilnya adalah = "+max(V)+" Nomor rumahnya - "+i);
    end
end;
