choix=0;
possibility=2;

while choix~=possibility,
      choix=menu('Signature verification system','Recognition','Exit');


%==============================================================================================================================================
 if choix==1
                
        selection=0;
        while selection==0
            [namefile,pathname]=uigetfile({'*.bmp;*.tif;*.tiff;*.jpg;*.fig;*.jpeg;*.gif;*.png','IMAGE Files (*.bmp,*.tif,*.tiff,*.jpg,*.jpeg,*.gif,*.png)'},'Chose GrayScale Image');
            
      %%%%%%%%%%%%%%%% image selected and recognizing
             
            if (namefile~=0)
                [img,map]=imread(strcat(pathname,namefile));
                selection=1;
            
                 if isa(img,'uint16')
                 img=uint8(img);
                 end
            
                 if isa(img,'uint32')
                 img=uint8(img);
                 end
            
               
                load('C:\Users\Tejas195\Desktop\loadingdata\choix2.mat');
                [answer]=Recognition(img,net);
                [output,index]=max(answer);
                if(output>=0.5)
                    message=strcat('Signature belongs to-->',' ',names(index,:));
        msgbox(message,'Recognised','help');
                     
                else 
                    message=('Signature is forged');
                    msgbox(message);
                end
                                             %map index to name
            
      %%%%%%%%%%%%%%%no file selected or file isn't gray
            else
                disp('Select a grayscale image');
                break;
             end
               
        end    
               
            
            
     end
  %================================================================================================================================================================      
        if choix==2
        break;
        end

end