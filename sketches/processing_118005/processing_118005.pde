
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
  ellipse(mouseY-200,mouseX-200,30,30);
  ellipse(mouseY, mouseX,50,50);
  ellipse(mouseY+100, mouseX+100, 30,30);
  ellipse(mouseX-100,mouseY-100,50,50);
  ellipse(mouseX, mouseY, 50,50);
  if(i<15){
  i=i+0.2;
  }
  else i=0;
println(i);
}


