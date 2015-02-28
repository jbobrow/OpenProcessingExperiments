
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
  noFill();
  //ellipse(paris,berlin,london,london);
  paris = paris + 100;
  //ellipse(paris,100,london,london);
  //ellipse(paris,200,london,london);
  //ellipse(paris,300,london,london);
  //ellipse(paris,400,london,london);
  line(paris,berlin,1300,1300);
  line(1300,paris,berlin,berlin);
  }

  
  


