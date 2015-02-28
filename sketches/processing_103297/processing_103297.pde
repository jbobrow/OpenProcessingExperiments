
void setup()
    {
     size(800,800);
    }
int onOff = 1;    
    
void draw()
    {
       background(0);
       ellipse(mouseX,mouseY,300,300);
     if(onOff == 1 && mousePressed == true){
       fill(255,255,0);
     }
      
     if(onOff == 0 && mousePressed == true){
      fill(255,0,0);
     }
  


} 


void mouseReleased()
    {
     
     if (onOff == 1 ){
        onOff=0;
                }  
            else
              {
                   onOff = 1;
                   
              }  
    }
