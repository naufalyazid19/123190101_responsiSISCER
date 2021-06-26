function varargout = responsi_123190101(varargin)
% RESPONSI_123190101 MATLAB code for responsi_123190101.fig
%      RESPONSI_123190101, by itself, creates a new RESPONSI_123190101 or raises the existing
%      singleton*.
%
%      H = RESPONSI_123190101 returns the handle to a new RESPONSI_123190101 or the handle to
%      the existing singleton*.
%
%      RESPONSI_123190101('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESPONSI_123190101.M with the given input arguments.
%
%      RESPONSI_123190101('Property','Value',...) creates a new RESPONSI_123190101 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before responsi_123190101_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to responsi_123190101_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help responsi_123190101

% Last Modified by GUIDE v2.5 26-Jun-2021 09:31:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @responsi_123190101_OpeningFcn, ...
                   'gui_OutputFcn',  @responsi_123190101_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before responsi_123190101 is made visible.
function responsi_123190101_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to responsi_123190101 (see VARARGIN)

% Choose default command line output for responsi_123190101
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes responsi_123190101 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = responsi_123190101_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
tabel = readmatrix('DatasetSAW.xlsx');
nomerrumah = tabel(:,1);
data = tabel(:,3:8);
data2 = [nomerrumah data];
set(handles.uitable3,'data',data2);
disp(data);%fungsi untuk membaca dataset excel

k = [0,1,1,1,1,1];%menentukan data termasuk cost/benefit

w=[0.30,0.20,0.23,0.10,0.07,0.10];%bobot kriteria

[m n]=size (data);
R=zeros (m,n);%membuat matriks R, dimana matriks tersebut adalah matriks kosong
Y=zeros (m,n);%membuat matriks Y, dimana matriks tersebut adalah titik kosong

for j=1:n
    if k(j)==1 %deklarasi pernyataan kriteria dengan atribut keuntungan
         R(:,j)=data(:,j)./max(data(:,j));
    else %deklarasi pernyataan kriteria dengan atribut kerugian
        R(:,j)=min(data(:,j))./data(:,j);
    end
end

%proses yang kedua, merangking data hasil
for i=1:m
    V(i,:)= sum(w.*R(i,:));
end
V=[V nomerrumah]; %fungsi untuk menambahkan kolom nomor rumah

hasil = sortrows(V, 1,'descend');%merangking data dari dataset berdasarkan kolom pertama dari terbesar ke terkecil
ranking = hasil(1:20,:);%fungsi untuk mengambil 20 data pertama dari dataset untuk ditampilkan sebagai hasil 

set(handles.rekomendasirumah,'data',ranking);%fungsi menampilkan data yang telah dirangking ke tabel rekomendasi rumah

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
