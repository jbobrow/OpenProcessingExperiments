
float i=0;
void setup(){
  size(400,400);
  smooth();
}

void draw(){
  noCursor();
  fill(0,i);
  rect(0,0,width,height);
  strokeWeight(2);
  stroke(random(255),random(255), random(255));
  line(mouseX, mouseY, mouseX, mouseY+100);
  
  if(i<20){
    i=i+0.1;
  }
  else i=0;
  println(i);
}


