
Mosca[] moscas = new Mosca[10];

void setup(){
  size (300,300);
  background(255);
  smooth();
  for (int i = 0; i<moscas.length;i ++){
    moscas[i] = new Mosca();
  }
}

void draw(){
  background(255);
  for (int i = 0; i < moscas.length; i++){
    moscas[i].display();
    moscas[i].move();
  }
}

class Mosca {
  float x = random(width);
  float y = random(height);
  float targetX,targetY;
  float easing = 0.05;

    Mosca(){
    }
    void display (){ 
    fill(0);
    ellipse(x,y+3,6,9);
    fill (random(255));
    ellipse(x+3,y+2,4,4);
    ellipse(x-3,y+2,4,4);
  }
  void move (){
    targetX = mouseX;
    float dx = targetX - x;
    if(abs(dx) > 1) {
      x += dx * easing;
    }
    targetY = mouseY;
    float dy = targetY - y;
    if(abs(dy) > 1) {
      y += dy * easing;
    }
    x=x+random(-5,5);
    y=y+random(-5,5);
    x=constrain(x,0,width);
    y=constrain(y,0,height);
  }     
}

