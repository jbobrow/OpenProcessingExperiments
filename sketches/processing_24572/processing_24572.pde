
import processing.opengl.*;

int num = 10;
float speed = 0.01;
ArrayList punkte;
int count = 0;
int subcount = 0;
float cx, cy;

void setup() {
  smooth();
  size(800,400);
  //size(window.innerWidth, window.innerHeight, OPENGL);
  stroke(0, 12);
  noFill();
  strokeWeight(1);
  background(255);
  punkte = new ArrayList();
}

void draw(){
  
  //size(window.innerWidth, window.innerHeight);
  background(255);
  
  if(mousePressed){
    punkte.add(new Punkt());
    count++;
    subcount++;
  }
  
  for(int i = 0; i < count; i++){
    Punkt punkt = (Punkt) punkte.get(i);
    punkt.zeichnen();
  }

}

class Punkt{
  float x;
  float y;
  int position;
  int subpos;
  float fact;
  float angle;
  float pcos;
  
  Punkt(){
    x = mouseX;
    y = mouseY;
    position = count;
    subpos = subcount;
    fact = 3;
    angle = radians(0);
  }
  
  void zeichnen(){
    
    angle += radians(2);
    
    if(angle >= radians(180)){
      angle=radians(0);
    }
    
    pcos = cos(angle);
    
    if(cos(angle)<0){
      pcos = cos(angle)*(-1);
    }
    
    fact = 3*(pcos+1);


    for (int i = 1; i < num; i++) {
      int control = subpos-i;
      if (control < 0){
        break;
      }
      Punkt prevPunkt = (Punkt) punkte.get(position-i);
      beginShape();
      vertex(x, y);
      cx = prevPunkt.x+(x-prevPunkt.x)/2 + (-1)*(y-prevPunkt.y)/fact;
      cy = prevPunkt.y+(y-prevPunkt.y)/2 + (x-prevPunkt.x)/fact;
      bezierVertex(cx, cy, cx, cy, prevPunkt.x, prevPunkt.y);
      endShape();
      }
      
    for (int i = 1; i < num; i++) {
      int control = subpos-i;
      if (control < 0){
        break;
      }
      Punkt prevPunkt = (Punkt) punkte.get(position-i);
      beginShape();
      vertex(x, y);
      cx = prevPunkt.x+(x-prevPunkt.x)/2 + (y-prevPunkt.y)/fact;
      cy = prevPunkt.y+(y-prevPunkt.y)/2 + (-1)*(x-prevPunkt.x)/fact;
      bezierVertex(cx, cy, cx, cy, prevPunkt.x, prevPunkt.y);
      endShape();
      }

  } 

  }
  
  void mouseReleased() {
  subcount = 0;
  }
  
 void keyPressed() {
    if(key==' '){     
      for(int i = 0; i < count; i++){
        punkte.remove(0);
      }
      count = 0;
      subcount = 0;
    }
 }

