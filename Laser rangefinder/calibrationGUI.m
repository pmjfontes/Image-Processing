function [Ipros] = calibrationGUI(I,handles)

[h w d] = size(I);

ROIcol = rgb2gray(I((h/2):h,(w/2),:));

ROIcol = im2bw(ROIcol,0.90);

imshow(ROIcol);

avg = 0;

for i=1:(h/2)
    if (ROIcol(i)==1)
        avg = i
        break;
    end
end

get(handles.distance,'String')

handles.K = get(handles.distance,'String') * avg;

set(handles.kLbl,'String',handles.K);

%% Cross marks the spot

Cross = ones(h,w,d);

Cross(:,(w/2)-2:(w/2)+2,:) = 0; %Vertical

Cross((h/2)+avg-2:(h/2)+avg+2,:,:) = 0; %Horizontal

Cross((h/2)-2:(h/2)+2,:,1) = 255; %Middle

Ipros = im2double(I).*Cross;

end

