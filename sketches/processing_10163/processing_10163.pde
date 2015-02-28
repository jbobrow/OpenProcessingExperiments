
Egg humpty;

void setup(){
  size(100,100);
  smooth();
  humpty = new Egg(50,100,PI/32,80);
}

void draw(){
  background(0);
  humpty.wobble();
  humpty.display();
}

class Egg{
  float x,y;
  float tilt;
  float angle;
  float scalar;
  
  Egg(int xpos, int ypos, float t, float s){
    x = xpos;
    y = ypos;
    t = tilt;
    scalar = s/100.0;
  }
  
  void wobble(){
    tilt = cos(angle)/8;
    angle += 0.1;
  }
  
  void display(){
    noStroke();
    fill(255);
    pushMatrix();
    translate(x,y);
    rotate(tilt);
    scale(scalar);
    beginShape();
    vertex(0,-100);
    bezierVertex(25,-100,40,-65,40,-40);
    bezierVertex(40,-15,25,0,0,0);
    bezierVertex(-25,0,-40,-15,-40,-40);
    bezierVertex(-40,-65,-25,-100,0,-100);
    endShape();
    popMatrix();
  }
}

