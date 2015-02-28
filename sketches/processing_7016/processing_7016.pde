
Vehicle_System vsys;

int x=0;
void setup(){
  size(600,600);
  smooth();

  rectMode(CENTER);
  frameRate(40);
  ellipseMode(CENTER);
  vsys=new Vehicle_System(6);
  background(0);
}

void draw(){
  x=(x+1)%600;
  rotate(4*PI/(10+x));
  vsys.update();
}





