
//declare variable
int x = 8;

void setup(){
  //exevuted only once
  size(200,200);
  frameRate(60);
}

void draw(){
  background(244,226,255);
  fill(23,29,176);
  rect(x,100,20,20);
  x = x + 1;
  x = x%200;
  println(x);
}
