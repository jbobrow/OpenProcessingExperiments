
//import processing.pdf.*;

int paris = 0;
int berlin = 0;
float london = 200;

void setup(){
  size(600,600);
  background(0);
  stroke(113,98,232);
}

void draw(){
  
  smooth();
  fill(random(255),random(255),random(255),random(1,70));
  ellipse(paris,berlin,london,london);
  paris = paris + 50;
  ellipse(paris,100,london,london);
  ellipse(paris,200,london,london);
  ellipse(paris,300,london,london);
  ellipse(paris,400,london,london);
  ellipse(paris,500,london,london);
  ellipse(paris,600,london,london);
  
  london =random(50,250);
  
  }

  
  


