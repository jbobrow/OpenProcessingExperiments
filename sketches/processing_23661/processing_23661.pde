
//import processing.pdf.*;
  
boolean recording;
//PGraphicsPDF pdf;
 
PImage myPic;
 
void setup(){
  size(992,1100);
 // pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "pause-resume.pdf");
  myPic = loadImage("rothko8.jpg");
  noStroke();
  smooth();
}
 
 
// controls the size of the squares
int cell = 12;
// htis int helps control which pixels and colors are viewed
int a=1;
 
void draw(){
 
 
  background(1);
   
   
  for(int y=cell; y <= 1099; y+=cell){
   for(int x=0; x <= 991; x+=cell){
      
     // some of this code inspired bydotFilter
     //placement is determined the brightness
      
       float place = cell * (brightness(myPic.pixels[x + ( a* 300)]) / 255);
  color myFill = color(myPic.pixels[a + (y *300)]);
  fill(myFill);
    rect(x,place*40,cell,height);
      
    }
  }
 
}
    
// saves a tiff if "a" is pressed
void keyPressed() {
     
 
if(key == 'a'){
a+=1;
}
//else if((key=='s')||(key=='S')) {
//    saveFrame("#.pdf");
//  }
 
}


