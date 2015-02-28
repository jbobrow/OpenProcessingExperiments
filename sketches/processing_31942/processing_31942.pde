
//import processing.pdf.*;

float paris = 0;
float berlin = 0;
float london = 200;

void setup(){
  size(600,600);
  background(0);
  stroke(113,98,232);
}

void draw(){
  
  smooth();
  fill(random(255),random(255),random(255),random(70));
  ellipse(paris,berlin,london,london);
  paris = random(600);
  berlin = random(600);
  ellipse(paris,berlin,london,london);
  ellipse(paris,berlin,london,london);
  ellipse(paris,berlin,london,london);
  ellipse(paris,berlin,london,london);
  ellipse(paris,berlin,london,london);
  ellipse(paris,berlin,london,london);
  
  london =random(50,250);
  
  }

  
  


