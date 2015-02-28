
int num = 100;
 
Rwalk[] myrwalks = new Rwalk[num];
 color[] myColors = new color[3];
 
 
void setup() {
  size(400,400);
  background(255);
   
  for(int i=0;i<num;i++){
    myrwalks[i] = new Rwalk();
  }
  smooth();
}
 
 
 
 
void draw() {
 
  for(int i=0; i < num; i++) {
    myrwalks[i].draw();
  }
}
 
class Rwalk {
 
  float x = random(width*.1,width*.9);
  float y = random(height*.1,height*.9);
  color c = color (int(random(0,255)));
   color b = color (int(random(0,255)));
 
  Rwalk() {
  }
 
  void update() {
  }
 
  void draw() {
    //fill(c,b,0,50);
     stroke(c,50);
     fill(255,40);
    y = y + random(-1,1);
    x = x + random(-1,1);
    ellipse(x,y,20,20);
  }
}


