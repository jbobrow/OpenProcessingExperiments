
int paris = 0;
int berlin = 0;
int london = 200;

void setup(){
  size(600,350);
  background(0);
  stroke(113,98,232);
}

void draw(){
  
  smooth();
  fill(113,98,232,random(40));
  ellipse(paris,berlin,london,london);
  paris = paris + 50;
  ellipse(paris,100,london,london);
  ellipse(paris,200,london,london);
  ellipse(paris,300,london,london);
  ellipse(paris,400,london,london);
  }

  
  



