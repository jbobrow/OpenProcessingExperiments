
float i= 0;
void setup(){
  size(500,500);
  smooth();
}

void draw(){
  noCursor();
  fill(0,i);
  rect(0,0,width, height);
  stroke(random(255),random(255),random(255));
  line(mouseX, mouseY, 500,500);
  line(mouseX, mouseY, 0,0);
  line(mouseX,mouseY,0,500);
  line(mouseX,mouseY,500,0);
  line(mouseY,mouseX,250,0);
  line(mouseY,mouseX,250,500);
  line(mouseY,mouseX,0,250);
  line(mouseY,mouseX,500,250);
  if(i<15){
  i=i+0.2;
  }
  else i=0;
println(i);
}


