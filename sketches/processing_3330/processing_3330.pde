
int x, y, deg; 
int mode = 1;
int nbr =60;
Dot[] d = new Dot[nbr];
float maxRadius  = 200; 
float angle=0;
void setup(){
    background(233, 233, 220);
  size(440, 440);
  smooth();
  x = width/2 ;
  y = height/2;
 float deg = (360/nbr);
  for (int i=0; i<d.length; i++){
     angle += radians(deg);
   maxRadius += random(100);
    d[i] = new Dot(x + cos(angle)*maxRadius  , y+ sin(angle)*maxRadius , random(-20, 20), i);
  } 
} 
void mouseReleased(){
  background(233, 233, 220);
  float deg = (360/nbr);
  for (int i=0; i<d.length; i++){
     angle += radians(deg);
     maxRadius =200+random(20);
    d[i] = new Dot(x + cos(angle)*maxRadius  , y+ sin(angle)*maxRadius, random(-20, 20), i);
  }
}
void draw(){
  beginShape();
   for (int i=0; i<d.length; i++){
     d[i].maison();
     stroke(20);
     noFill();
   vertex(d[i].x , d[i].y);
   }
   endShape(CLOSE);
}
class Dot{
  float x, y;
  float vx, vy;
  float ar = random(-20, 20);
  int id;
  Dot(float xpos, float ypos, float angledeRotation, int moi){
    x  = xpos;
    y  = ypos;
    ar  = angledeRotation;
    id = moi ;
  }
  void maison(){
     ar+=random(0.2);
     x += cos(ar)*(random(1))+((width/2 - x) * 0.025); 
     y += sin(ar)*(random(1))+((height/2 - y) * 0.025); 
  }
}


