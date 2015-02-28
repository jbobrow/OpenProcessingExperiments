
int i = mouseY;
PImage b;
PImage a;
import processing.video.*;
Capture myCapture;



void setup () {
    size(500, 500);
  smooth ();
   b = loadImage("Window.gif");
   a = loadImage("WIndow2.gif");
   for (int i = 0; i < 40; i = i+1) { 

}
   
}
void captureEvent(Capture myCapture) {

  myCapture.read();
  
}

void draw (){
  background(0,13);
  fill (255,100);
  tint(255, 255, 255, 100);
  smooth ();
  rectMode(CENTER);
  imageMode(CENTER);
    //rect(280-mouseY/.5,height/2, mouseY*.8  ,mouseY*.8);
  image(b, 280-mouseY/.5, height/2, mouseY+100*2,mouseY+100);
   //rect(250+mouseY*2, height/2,mouseY*8,mouseY*8);
  image(a,250+mouseY*2, height/2,mouseY*2,mouseY*2);
  

} 



