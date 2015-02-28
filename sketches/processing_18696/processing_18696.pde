
float a = -10;

void setup(){
  size(250,250);
  smooth();
  background(0);
  noStroke();
  frameRate(20);
}

void draw(){
  fill(0,9);
  rect(-10,-10,265,265);
  
  stroke(220-a,180,240);
  line(a+20,20+a,a-40,25-a);
  a += 3;
  
  if(a>270){
    a = -60;
  }
}

