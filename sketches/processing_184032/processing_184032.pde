
//declare variables
int x=0;

void setup(){
  //executed only once
  size(200,200);
  frameRate(60);
  
}

void draw(){
  //executed every frame
  
  rect(x,100,20,20);
  x=x+1;
  x = x%200;
  println(x);
  
}
  
