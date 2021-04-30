% **********************************************************
%           Discrete - Time Convolution Sum.
%       Mehmet Ahad Yurtoglu
% 
%  
%------------------------------------------------------------------------------------------

function varargout = convolution(varargin)
% CONVOLUTION MATLAB code for convolution.fig
%      CONVOLUTION, by itself, creates a new CONVOLUTION or raises the existing
%      singleton*.
%
%      HN = CONVOLUTION returns the handle to a new CONVOLUTION or the handle to
%      the existing singleton*.
%
%      CONVOLUTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONVOLUTION.M with the given input arguments.
%
%      CONVOLUTION('Property','Value',...) creates a new CONVOLUTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before convolution_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to convolution_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help convolution

% Last Modified by GUIDE v2.5 30-April-2021 12:23:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @convolution_OpeningFcn, ...
                   'gui_OutputFcn',  @convolution_OutputFcn, ...
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


% --- Executes just before convolution is made visible.
function convolution_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to convolution (see VARARGIN)

% Choose default command line output for convolution
handles.output = hObject;
set ( gcf, 'Color', [0 0 0] )                                       % background color
% opening color
axes(handles.axes_x)
xlim([-1 1]); grid on;
set(gca,'xcolor','g')                                                                       
set(gca,'ycolor','g')
axes(handles.axes_h)
xlim([-1 1]); grid on;
set(gca,'xcolor','g')                                                                      
set(gca,'ycolor','g')
axes(handles.axes_y)
xlim([-1 1]); grid on;
set(gca,'xcolor','g')                                                                     
set(gca,'ycolor','g')
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes convolution wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = convolution_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function xn_Callback(hObject, eventdata, handles)
% hObject    handle to xn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xn as text
%        str2double(get(hObject,'String')) returns contents of xn as a double


% --- Executes during object creation, after setting all properties.
function xn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xn0_Callback(hObject, eventdata, handles)
% hObject    handle to xn0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xn0 as text
%        str2double(get(hObject,'String')) returns contents of xn0 as a double


% --- Executes during object creation, after setting all properties.
function xn0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xn0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% ---- PLOT BUTTON x[n]
function plotx_Callback(hObject, eventdata, handles)
% hObject    handle to plotx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x; global x0; global nx;                                                        
try
    x  = str2num(get(handles.xn,'String'));                                             % input sequence
    x0 = str2num(get(handles.xn0,'String'));                                            % input sequence n = 0 index
    nx = 1-x0:1:length(x)-x0;                                                            
                                          
    if x0>0 && x0<=length(x) && mod(10*x0,10) == 0                                      % index must be positive and integer                                      
        axes(handles.axes_x)                                                            
        stem(nx,x,'filled','g','LineWidth',2)                                           % discrete-time input signal graph
        x_lim = max(abs(nx(1)),abs(nx(end))) + 5;
        xlim([-x_lim x_lim]);
        set(gca,'xcolor','g')                                                           % changing axes color                     
        set(gca,'ycolor','g')
        grid on
    else
        errordlg('Index must be positive integer number (starts 1) and it cannot be more than length of x[n] array!','Error!'); 
    end
catch
     errordlg('The boxes cannot be left blank and they cannot be any letters, symbols etc. Please check! ','Error!');              % hata ayıklama
end



function hn_Callback(hObject, eventdata, handles)
% hObject    handle to hn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hn as text
%        str2double(get(hObject,'String')) returns contents of hn as a double


% --- Executes during object creation, after setting all properties.
function hn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hn0_Callback(hObject, eventdata, handles)
% hObject    handle to hn0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hn0 as text
%        str2double(get(hObject,'String')) returns contents of hn0 as a double


% --- Executes during object creation, after setting all properties.
function hn0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hn0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- PLOT BUTTON h[n]
function ploth_Callback(hObject, eventdata, handles)
% hObject    handle to ploth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h; global h0; global nh;                                                         
try
    h = str2num(get(handles.hn,'String'));                                              % impulse response sequence
    h0 = str2num(get(handles.hn0,'String'));                                            % impulse response sequence n = 0 index
    nh = 1-h0:1:length(h)-h0;                                                           
    if h0>0 && h0<=length(h) && mod(10*h0,10) == 0                                  
        axes(handles.axes_h)                                                            
        stem(nh,h,'filled','g','LineWidth',2)                                           % discrete-time impulse response graph
        x_lim = max(abs(nh(1)),abs(nh(end))) + 5;
        xlim([-x_lim x_lim]);
        set(gca,'xcolor','g')
        set(gca,'ycolor','g')
        grid on
    else
        errordlg('Index must be positive integer number (starts 1) and it cannot be more than length of h[n] array!','Error!'); 
    end
catch
    errordlg('The boxes cannot be left blank and they cannot be any letters, symbols etc. Please check! ','Error!');           % Hata ayıklama
end               

% --- CONVOLVE BUTTON
function conv_Callback(hObject, eventdata, handles)
% hObject    handle to conv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% -------------  CONVOLUTION -----------------------------------------  
global x; global h; global nx; global nh;
try
    h = flip(h);                                                    % h[-k]
    % insert length(x)-1 zeros end of the h and insert length(h)-1 zeros front of the x
    xc = length(x);         hc = length(h);         
    x = [zeros(1,hc-1) x];
    h = [h zeros(1,xc-1)];
    
    y = [];                                                         % output sequence
    % CONVOLUTION SUM
    while sum(h) ~= 0
        y0 = sum(x.*h);                                             
        y = [y y0];
        h = shifting(h);                                            % after every multiplication, shift 1 unit of h and add zero to the leftof the h
        % it will continue when all element of the h are zero 
    end
    start = nx(1)-abs(nh(1));                                       % starting point of y
    finish = length(y) + start - 1;                                 % ending point of y
    ny = start:1:finish;                                            % n axes of output y                                                
    set(handles.outputy,'String',num2str(y))                        
    axes(handles.axes_y)                                            
    stem(ny,y,'filled','g','LineWidth',2)                           % discrete-time output signal graph
    x_lim = max(abs(start),abs(finish)) + 5;
    xlim([-x_lim x_lim]); 
    set(gca,'xcolor','g')
    set(gca,'ycolor','g')
    grid on
catch
    errordlg('The datas are missing or wrong! Please check!','Error');                 
end

% --- CLEAR BUTTON
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x x0 h h0;
cla(handles.axes_x); cla(handles.axes_h); cla(handles.axes_y);                      % clear graphs
set(handles.xn,'String',''); set(handles.xn0,'String','');                          % clear boxes
set(handles.hn,'String',''); set(handles.hn0,'String','');
set(handles.outputy,'String','');
x = ''; x0 = x; h = x; h0 = x;                                                      % clear sequences 

function outputy_Callback(hObject, eventdata, handles)
% hObject    handle to outputy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outputy as text
%        str2double(get(hObject,'String')) returns contents of outputy as a double


% --- Executes during object creation, after setting all properties.
function outputy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outputy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- HELP BUTTON
function learn_Callback(hObject, eventdata, handles)
% hObject    handle to learn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m0 = '1) Enter the input signal values to x[n] box (Ex:1,3,5,7 or 1 3 5 7).';
m1 = 'Then, enter the n=0 index number of the array when n is equal to 0 (Index number starts 1!).';
m2 = 'For example, assume x[n] = 1 3 5 7 and x[0] = 3. 3 is second element of the x[n] array ,so we must enter 2 to the n=0 index box.';
m3 = '2) The steps applied for the input signal are also applied for the Impulse Response h [n]. The plot buttons plot these signals.';
m4 = 'Output y[n] is obtained by pressing the Convolve button after entering x[n] and h[n].';

A = questdlg(strcat(m0,m1,m2),'How to use?','Next->','');
if strcmp(A,'Next->'), questdlg(strcat(m3,m4),'How to use?','Lets start!',''); end
