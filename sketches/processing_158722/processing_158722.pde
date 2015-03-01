
float i = 0;
void setup() {
  size(700, 700);
  background(0,0,0);
  colorMode(HSB);
}
void draw() {
  //background(255);
i=i+0.05;
 
float posicionX = 200*sin(i);
float posicionY = 200*cos(i);
 stroke(random(255),random(255),255);
  ellipse(width/2+posicionX, height/2+posicionY, sin(i), 20);
  
fill(random(255),random(255),255);
  ellipse(width/2+posicionX, height/2+posicionY, 7, 7);
  
  float posicionX2 = 100*sin(i);
float posicionY2 = 100*cos(i);
 
  fill(0,0,0);
  ellipse(width/2+posicionX2, height/2+posicionY2, 3, 3);
  
  
  line(width/2, height/2, random(height),random(width));

  if(mousePressed){
  background(0,0,0);
  triangle(200,470,350,160,500,470);
 
}}

