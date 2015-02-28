
int diameter = 100;

void setup(){
  size(400,400);
  
}

void draw(){
  background(38,120,90);
  diameter = mouseX+2;
  if(diameter >= 100){
    fill(0,255,0);
  }else fill(255);
  
  println(diameter);
  
  ellipse(mouseX,200,diameter,diameter);
  
}


