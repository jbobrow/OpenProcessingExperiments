
float m;
float speed;
boolean pause = false;

void setup() {
  size(500, 500);
  stroke(0);
}


void draw() {
  
  
  //println(m);
  background(75, 178, 68);
  base();
  fill(255);
  mouserotate();
  turbines();
  

  if (mousePressed) speed=0;
}

void mouserotate() {
  m=m+speed;
  

  if (mouseX> 250) {
    speed=0.05;
  }

  if (mouseX<250) {
    speed=-0.05;
  }
  
  if (mouseX> 350) {
    speed= 0.15;
  }
  
  if (mouseX<150) {
    speed= -0.15;
  }
}

void turbines() {
  
  ellipseMode(CENTER);
  translate(width/2, 210);
  rotate(m);
  rotate(PI/0.9);
  ellipse(0, -48, 15, 100);                      //Turbine #1
  rotate(PI/5.0);  
  ellipse(45, -1.5, 100, 15);                    //Turbine #2
  rotate(PI/-2.7);  
  ellipse(-45, -0.5, 100, 15);                   //Turbine #3
  ellipse(0, 0, 15, 15);                         //round center
}

void base() {
rectMode(CENTER);
rect(249,215+100,9,200);
rect(249,315+100,50,20);
}












//http://processing.org/examples/rotate.html

