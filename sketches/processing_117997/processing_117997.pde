
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
  line(mouseX, mouseY, 450,450);
  line(mouseX, mouseY, 50,50);
  line(mouseY,mouseX,50,450);
  line(mouseY,mouseX,450,50);
  if(i<20){
  i=i+0.2;
  }
  else i=0;
println(i);
}


