
Planet p1,p2,p3,p4,p5;


void setup() {
  size(640,480);
  smooth();
  noStroke();
 // background(250);
  
  p1 = new Planet(10,10,10,30,6,1,50); //x , y, diameter, radius, speed, phase, omega, time, color
  p2 = new Planet(10,10,10,40,8,2,100);
  p3 = new Planet(10,10,10,10,2,5,70);
  p4 = new Planet(10,10,10,60,3,0.7,255);
  p5 = new Planet(9,11,15,80,4,3,94);
}

void draw() {
  background(250);
  translate(mouseX,mouseY);
  if(mousePressed) {
    scale(2);
  }
  p1.move();
  p1.display();
  p2.move();
  p2.display();
  p3.move();
  p3.display();
  p4.move();
  p4.display();
  p5.move();
  p5.display();
}

class Planet {
  float x,y;
  float diameter;
  float radius;
  float speed;
  float phase;
  float omega, di=0.02;
  float time;
  color c;
  
  Planet(float X, float Y, float D, float R,float ph,float t, color C) {
    x = X;
    y = Y;
    diameter = D;
    radius = R;
    phase = ph;
    time = t;
    c = C;
   
  }
  
void move() {
  if(key == 'c') {
    x = R+radius*sin(omega*time+phase);
    y = R+radius*cos(omega*time+phase);
  }
  if(key == 'e') {
    x = R+radius*sin(omega*time+phase/2);
    y = R+radius*cos(omega*time+phase);
  }
  if(key == 'l') {
    x = R+radius*sin(omega*time*2+phase);
    y = R+radius*cos(omega*time+phase);
  }
    
  omega+=di;
}

void display() {
  fill(c,c*sin(omega*time+phase),c*cos(omega*time+phase));
  ellipse(x,y,diameter,diameter);
 }
}
  
  

  


