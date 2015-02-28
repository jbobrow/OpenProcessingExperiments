
PFont font;
PImage mus, hat;

void setup() {
  size(300, 300);
  frameRate(1);
  smooth();
  mus = loadImage ("mus.png");
  hat = loadImage ("hat.png");
  
}
 
void draw() {
  background(240, 195, 177);
  noStroke();
  strokeWeight (10);
  stroke (random (256), random (256), random (256));
  fill (240, 195, 177);
  ellipse (140, 150, 150, 150);
  int s = second();
  int m = minute();
  int h = hour();
  
  
  
  

  strokeWeight(1);
  
  //line(200, 100 , 90*cos(s * -TWO_PI / 60 - HALF_PI)+200, 90*sin(s * -TWO_PI / 60 - HALF_PI)+100 ); 
  //stroke (46, 59, 121);
 

  
  //eyes seconds
  fill (255);
  stroke(255);
  ellipse (200, 100, 100, 100);

  ellipse (100, 120, 75, 75);
  fill (0);
  ellipse (110, 120, 50, 50);
 
  fill (0,0, 0);
  ellipse (30*cos(s * -TWO_PI / 60 - HALF_PI)+200 , 30*sin(s * TWO_PI / 60 - HALF_PI) +100, 30, 30);  
  
  
  //hour
  stroke(0);
  strokeWeight(4);
  fill (255);
  image(mus, 70, 150 , 60*cos((h + m/60.0) % 12 * TWO_PI / 12 - HALF_PI) + 120, 60*sin((h + m/60.0) % 12 * TWO_PI / 12 - HALF_PI) +120); 
  //line(150, 150 , 60*cos((h + m/60.0) % 12 * TWO_PI / 12 - HALF_PI) + 120, 60*sin((h + m/60.0) % 12 * TWO_PI / 12 - HALF_PI) +120); 


//min
strokeWeight(4);
  //line(120, 150 , 80*cos((m + s/60.0) * TWO_PI / 60 - HALF_PI) + 120, 80*sin((m + s/60.0) * TWO_PI / 60 - HALF_PI) +120);

  line(120, 120 , 80*cos((m + s/60.0) * TWO_PI / 60 - HALF_PI) + 120, 80*sin((m + s/60.0) * TWO_PI / 60 - HALF_PI) +120);
 
  //image(hat, 120, 20 , 80*cos((m + s/60.0) * TWO_PI / 60 - HALF_PI) +10, 80*sin((m + s/60.0) * TWO_PI / 60 - HALF_PI)+20 ); 
  
}


