
// Elmer's Trip

/* @pjs preload="elmer.png"; */ 

PImage img;
float a;
float t=255;
float w=500,h=500;

void setup() { 
  size(500,500);
  background(0);
  img = loadImage("elmer.png");
  imageMode(CENTER);
}

void draw() {
   translate(250,250);
   //background(0);
   rotate(a);
   tint(255,t);
   if (t>5) { t-=0.5; };
   image(img,0,0,w,h);
   if (w<501) { w-=1; h-=1; }
   a-=0.01;
}

void keyPressed() {
  if (key == 'r') { background(0); a=0; t=255; w=h=500; }
}


