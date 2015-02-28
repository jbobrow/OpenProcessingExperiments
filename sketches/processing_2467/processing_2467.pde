
/*

Random & Perlin Noise
20 May 2009
Daria lanz
darialanz@hotmail.com

*/

float rot = PI/4;
float rad = 200; //radius
float speed = 0.01;

void setup(){
  
  size(800,500);
  background(10);
  smooth();
  

  
};

void draw() {
 
  rad = random(10,200);
  
  translate(400,250);
  rotate( rot);
  stroke(0,0,255,25);
  fill(0,0,255,50);
  line(0,0,rad,0);
  ellipse(rad,0, 5,5);
  
  rot = rot + speed;
  
};

void keyPressed() {
  save("circle" + key + ".png");
};

