
ArrayList<Fur> redfurs;

float range = 50;
float t =0.;
float t1 =0.;

void setup(){
  size(600,400);
  background(52,85,15);
  redfurs = new ArrayList();
}

void draw(){
  
  fill(142,28,24);
  
  for (int i = 0; i<redfurs.size(); i++){
    Fur redfur =redfurs.get(i);
    redfur.display();
    redfur.run();
  }
  
  t=t+0.01;
  if (mousePressed){
    redfurs.clear();
}
if (redfurs.isEmpty()){
  background(52,85,15);
}
}
void keyPressed() {
  if (key == ' ') { 
    redfurs.add(new Fur(255, random(600),random(400),random(10)));
  }
}    
class Fur{
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Fur(color tempC, float tempXpos, float tempYpos, float tempXspeed){
    c = tempC;
    xpos =tempXpos;
    ypos =tempYpos;
    xspeed = tempXspeed;
  }

void display() {
 stroke(68,165,130);
fill(255,random(255),random(255),50);
 curve(xpos, ypos,xpos+ypos,xpos+xspeed,ypos+xspeed,ypos-xpos,TWO_PI,HALF_PI); 

ellipseMode(CENTER);
int steps = 6;
for (int i = 0; i <= steps; i++) {
  float t = i / float(steps);
  float x = curvePoint(xpos, ypos, 73, 73, t);
  float y = curvePoint(ypos, xpos, 24, 61, t);
  ellipse(x, y, 10, 10);
  x = curvePoint(xpos+xspeed, ypos+xspeed, 73, 15, t);
  y = curvePoint(ypos+xspeed, xpos+xspeed, 61, 65, t);
  ellipse(x, y, 10, 10);
}
}
  
void run(){
  xpos = xpos+ xspeed;
  if (xpos> width){
    xpos =0;
  }
}
}

