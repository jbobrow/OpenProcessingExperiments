
PImage riot;
PImage riotfull;

float easing = 0.1;
float x;
float y;
float r;
float s;
 
float xe;
 
void setup()
{
  background(255);
  size(640, 480);
  smooth();
  colorMode(HSB, 360, 100, 100, 255);
  //noLoop();
  imageMode(CENTER);
  riot = loadImage("Riotwhite.png");
  riotfull = loadImage("Riotfull.png");
  
 
}
 
  void draw() {
     
  background(0);

   
  //easing
  xe = xe + (mouseX - xe) * easing;
   
   
 //opacity transition
 if (mouseX < 580) { tint(176, 27, 88, 120);
  } else {
     
   float o = map(xe, 580, width, 150, 240);
   tint(176, 27, 88, o);
  }
   
  pushMatrix();
  x = map(xe, 0, width, 80, 400);
  y = map(xe, 0, width, 100, 250);
  r = map(xe, 0, width, 0, radians(10));
  s = map(xe, 0, width, 1.0, 0.2);
  translate(x, y);
  scale(s);
  rotate(r);
  image(riot, 0, 0);
  popMatrix();
  
  image(riotfull, 371, 252, 340, 120);

}


