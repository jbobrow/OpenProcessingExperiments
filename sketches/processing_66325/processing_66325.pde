
int a;
int b;

void setup(){
  background(240);
  size(400,400);
  noStroke();
  frameRate(5);
  smooth();
  a = 100;
  b = 100;

}

void draw(){
  background(55);
  fill(0,200,0);
  ellipse(width/2,a, 20, 20);
  a+=b;
  println(a);
  println(b);
  
if (a>400 || a<0) {
    b*=-1;
}

if (a>400 || a<0) { 
  fill(a, 10, 165);
  noStroke();
  rect(0, 0, width, height);
}

}


