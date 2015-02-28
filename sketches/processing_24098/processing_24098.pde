
import ddf.minim.*;
import de.looksgood.ani.*;

float x=80;
float xa=80;
float xb=80;
float xc=80;
float xd=80;

float y=290;
float ya=290;
float yb=290;
float yc=290;
float yd=290;
PImage b;

Minim minim;
AudioSample kick;

void setup() {
  cursor(CROSS);
  size(400, 600);
   minim = new Minim(this);
  kick = minim.loadSample("unlock.wav", 2048);
   Ani.init(this);
  }

void draw() {
  background(0);
  b = loadImage("lock.jpg");
image(b, 0, 0);
   fill (118,6,2,150);
   stroke(0,0);
  rect(x,290,240,40);
  rect(xa,340,240,40);
  rect(xb,390,240,40);  
  rect(xc,440,240,40);
  rect(xd,490,240,40);

  
  rect(80,y,40,240);
  rect(130,ya,40,240);
  rect(180,yb,40,240);
  rect(230,yc,40,240);
  rect(280,yd,40,240);


  println( keyCode);                   // check what the keycode is.
}

void keyReleased()
{
  if ( keyCode == 85) { kick.trigger(); Ani.to(this, 1, "x", width);}
  if ( keyCode == 78) { kick.trigger(); Ani.to(this, 1, "xa", width);}
  if ( keyCode == 76) { kick.trigger(); Ani.to(this, 1, "xb", width);}
  if ( keyCode == 79) { kick.trigger(); Ani.to(this, 1, "xc", width);}
  if ( keyCode == 67) { kick.trigger(); Ani.to(this, 1, "xd", width);}
  
  if ( keyCode == 75) { kick.trigger(); Ani.to(this, 1, "y", height);}
  if ( keyCode == 84) { kick.trigger(); Ani.to(this, 1, "ya", height);}
  if ( keyCode == 72) { kick.trigger(); Ani.to(this, 1, "yb", height);}
  if ( keyCode == 73) { kick.trigger(); Ani.to(this, 1, "yc", height);}
  if ( keyCode == 83) { kick.trigger(); Ani.to(this, 1, "yd", height);}
  
  if ( keyCode == 32) {
kick.trigger(); 
Ani.to(this, 1, "x", 80);
Ani.to(this, 1, "xa", 80);
Ani.to(this, 1, "xb", 80);
Ani.to(this, 1, "xc", 80);
Ani.to(this, 1, "xd", 80);

Ani.to(this, 1, "y", 290);
Ani.to(this, 1, "ya", 290);
Ani.to(this, 1, "yb", 290);
Ani.to(this, 1, "yc", 290);
Ani.to(this, 1, "yd", 290);
}
  
}  // use keyCode.

void stop()
{
   kick.close();
  minim.stop();
  
  super.stop();
}


