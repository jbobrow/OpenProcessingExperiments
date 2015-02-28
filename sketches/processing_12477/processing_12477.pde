
//Internet Room//
////Michael Khalil\\\\
///the boxes that travel across the screen represent the data packages sent and received from and to the Internet service provider.

  ///main parameters

float q,w;
float r = 30;
float theta = 5;
float t = 2;
float inc = 0.8;

////  INITIALISATION

void setup(){
  size(1000,500);
  background(255);
  smooth();
  frameRate(120);
 
}
 
  /////drawing

void draw(){
 
  float k = noise(t)*2;
  float x = r*tan(theta);
  float y = r*sin(theta);


  fill(0,100);

  rect(x+width/2,y+height/2,tan(theta),tan(theta));
  theta += 0.5;
  t+=inc/2;
}
void mousePressed() {
  if(mouseButton==LEFT)
    r = 0;
  if(mouseButton==RIGHT)
    t = 2;
  if(mouseButton==CENTER)
    q = 3;
}


