
import ddf.minim.*;
import de.looksgood.ani.*;
PImage b;

Minim minim;
AudioSample kick;

float x=-500;
float y=-500;

void setup() {
  cursor(CROSS);
  size(800, 480);
   minim = new Minim(this);
  kick = minim.loadSample("horn.wav", 2048);
  Ani.init(this);
  }

void draw() {
  background(0);
  b = loadImage("car.jpg");
image(b, 0, 0);
   fill (138,6,2,mouseY/2);
   stroke(0,0);
  rect(mouseX-2,mouseY-10,2,20);
  rect(mouseX-10,mouseY-2,20,2);
  
  rect((width/2-20),(height/2 -20), 20, 20);
  
   if ((mouseX > width/2 - 20 )&&(mouseX < width/2 + 20)&& (mouseY >height/2 - 20)&&(mouseY < height/2 + 20)) {
    kick.trigger(); Ani.to(this, .4, "x", height);Ani.to(this, .5, "y", height);
  }
 
fill (138,6,2);
  rect(100,x,10,500);
  rect(150,x,10,500);
  rect(200,y,10,500);
  rect(250,x,10,500);
  rect(300,x,10,500);
 rect(350,x,10,500);
  rect(400,y,10,500);
  rect(450,x,10,500);
   rect(500,x,10,500);
   rect(550,x,10,500);
  rect(600,y,10,500);
  rect(650,x,10,500);
  rect(700,x,10,500);
  rect(750,x,10,500);
  rect(800,y,10,500);

  println( keyCode);                   // check what the keycode is.
 }
 
 void stop()
{
   kick.close();
  minim.stop();
  
  super.stop();
}


