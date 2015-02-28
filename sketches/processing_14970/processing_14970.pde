
//Linearizer by Paul Schneider, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
//Work: http://openprocessing.org/visuals/?visualID=9516
//License:http://creativecommons.org/licenses/by-sa/3.0/
//http://creativecommons.org/licenses/GPL/2.0/

PImage myimage;
void setup(){
size(400, 400);
myimage=loadImage ("flare.jpg");
myimage.resize(400,400);


}

void draw(){
  background(69,167,212);
  
  smooth();
  
  
       image(myimage,0,0);

  for(int i=1; i<800; i+=15) {
 stroke(250,237,98);
 
   
   line(mouseX,mouseY, width,i);
   line(mouseX,mouseY, width-i, height);
   line(mouseX,mouseY, 0, height-i);
   line(mouseX,mouseY,i,height);line(mouseX,mouseY,i,0);



   
}}
  
   void mouseClicked(){
   
     
   
   
}

