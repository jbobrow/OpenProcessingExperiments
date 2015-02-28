
float merc;
float v;
float e;
float m;
float j;
float sat;
float dia;
float scalar;
int offset;
PImage earth;
 
void setup() {
  earth= loadImage("earth.jpg");
  size(600, 600);
  smooth();
  imageMode(CENTER);

}
 
 
 
void draw() {
 
  background(0);
  
  image(earth, width/2, height/2,600,600);
   
  scalar = 20;
  offset = 10;
  dia = 10;
 
  fill(255);
  float sv = random(20, 50); // random stars
  int svalue = int(sv);
  float sx = random(0, width);
  int starx = int(sx);
  float sy = random(0, height);
  int stary= int(sy);
  ellipse(sx, sy, svalue, svalue);
}


