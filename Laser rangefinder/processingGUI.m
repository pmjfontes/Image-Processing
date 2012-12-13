function [Ipros D w] = processingGUI(I,handles)

[h w d] = size(I);

ROIcol = rgb2gray(I((h/2):h,:,:));

thr = get(handles.thrSlider,'Value');

ROIcol = im2bw(ROIcol,thr);

Range = get(handles.rangeSlider,'Value');

for j=1:w
    D(j)=Range;
    for i=1:(h/2)
        if (ROIcol(i,j)==1)
            D(j) = handles.K / i;
            break;
        end
    end
end

Cross = ones(h,w,d);

Cross((h/2)-2:(h/2)+2,:,1) = 255; %Horizontal

Ipros = im2double(I).*Cross;

end

