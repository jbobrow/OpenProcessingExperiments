
float angle = 0.0;
//float offset = 60;
float scalar;
float angleDirection = 1;
float speed = 0.005;
//int x,y;


void setup() {
  size(500,450);
  fill(0);
  smooth();
}

void draw() {
  background(0);
  
  pushMatrix();
  noStroke();
  fill(255,48);
     translate(width/2, height/2);
     for(int i=0; i<15; i++) {
       scale(1.2);
       //stroke(34,197,54);
       rotate(angle);
       ellipse(4,2,20,20);
     }
  popMatrix();
  fill(255);
  pushMatrix();
    translate(width/2,height/2);
    rotate(angle);
    stroke(255,255,0);
    rect(-25,-25,50,50);
  popMatrix();
  
  pushMatrix();
     translate(width/2, height/2);
     for(int i=0; i<15; i++) {
       strokeWeight(i);
       stroke(15,75,255);
       rotate(angle);
       line(0,0,55,0);
     }
  popMatrix();  
  
  angle+=speed*1;
  
  
}               
