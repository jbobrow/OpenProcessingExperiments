

PImage bob;
PImage bill;


 
void setup(){
  
  size(250,250);
  bill=loadImage("eyeball4png.png");
  bob = loadImage("eye3.png");
  background(255);
  frameRate(60);
 
}
 void draw () { 
if (mousePressed);
background(255);
image (bill, (((mouseX+0)*0.40)), (((mouseY+0)*0.20))); 
image (bill, (((mouseX+0)*0.40)), (((mouseY+CENTER)*0.20)));



 
 
image(bob,0,0) ;



 }

