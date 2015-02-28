
float x = 100;
float y = 100;
float speedx = 0;
float speedy = 0;
float gravity = 0.4;
int pixelsize = 420;


void setup (){
  size (450,450);
  smooth ();
}

void draw (){
  
  
  background (20,30,240);
  
  x = x + speedx;
  y = y + speedy;
 speedy = speedy + gravity;
  
  
  if ((x > pixelsize-40 || x < 40)) {speedx = speedx*-0.80;}
  if ((y > pixelsize-40 || y < 40)) {speedy = speedy*-0.80;}
  if (mousePressed) {x=mouseX; y=mouseY; speedx=mouseX-pmouseX; speedy=mouseY-pmouseY;}
  
  noStroke ();
  fill (240,30,30,255);
  ellipse (x,y,100,100);
}
  
                                                                                
