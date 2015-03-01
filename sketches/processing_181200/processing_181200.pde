
int red=0;
int green=0;
int blue=0;

void setup() 
{
  size(600, 600);
  background (0,0,0);
 } 

void draw() 
{
 background(25);
 int llarg = 20;
 int radi = mouseY*255/3/height;
 
 
 //creu 
 strokeWeight(2);
 stroke(255,255,255);
 line (mouseX+llarg, mouseY+llarg, mouseX-llarg, mouseY-llarg);
 line (mouseX-llarg, mouseY+llarg, mouseX+llarg, mouseY-llarg);
 
 
 //boles
 
 //definir color
 if (mouseX<=width/6){
   red=255;
   green=mouseX*255/width*6;
   blue=0;
 }
 else { 
     if (mouseX<=width*2/6){
     red=(((width*2/6)-mouseX)*255)/(width/6);
     green=255;
     blue=0;
      }
     else
        if (mouseX<=width*3/6){
         red=0;
         green=255;
         blue=255-(((width*3/6)-mouseX)*255)/(width/6);
         }
         else
            if (mouseX<=width*4/6){
            red=0;
            green=(((width*4/6)-mouseX)*255)/(width/6);
            blue=255;
            }
            else
              if (mouseX<=width*5/6){
              red=255-(((width*5/6)-mouseX)*255)/(width/6);
              green=0;
              blue=255;
              }
              else
                if (mouseX<=width){
                red=255;
                green=0;
                blue=((width-mouseX)*255)/(width/6);
                 }
 }
  
 fill(red,green,blue);
 ellipse (mouseX,mouseY, radi, radi);
 ellipse (mouseX+llarg, mouseY-llarg, radi/2, radi/2);
 ellipse (mouseX-llarg, mouseY-llarg, radi/2, radi/2);
 
 
}
