
int diameter=20;

void setup(){
  size(200,200);
}

void draw(){
  background(129);
  diameter=diameter+1;
  if(diameter>=100){
    fill(255,0,0);
  }else fill(130,25,5);
  println(diameter);
  ellipse(100,100,diameter,diameter);
}


