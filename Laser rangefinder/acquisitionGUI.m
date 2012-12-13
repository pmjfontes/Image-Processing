function acquisitionGUI(obj, event, handles)
%PROCESSING Summary of this function goes here
%   Detailed explanation goes here
    %trigger(vid);
    %I = getdata(vid);
    %subplot(2,1,1), imshow(I);
    I = getsnapshot(handles.video);
    
    
    
    if(strcmp(get(handles.calibrateButton,'String'),'Done'))
        [I] = calibrationGUI(I,handles);
    else
        [I d w] = processingGUI(I,handles);
        axes(handles.plotAxes);
        plot(1:w,d,'x');
        xlabel('View'); 
        ylabel('Distance ( cm )');
        ylim([1,get(handles.rangeSlider,'Value')]);
        xlim([1,w]);
    end
    
    axes(handles.cameraAxes);
    set(handles.cameraAxes,'ytick',[],'xtick',[])
    imshow(I);
    
    
    