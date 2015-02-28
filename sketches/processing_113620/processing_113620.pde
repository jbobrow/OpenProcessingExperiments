
void setup(){
size(600,600);
smooth();

}

void draw(){
  background(255);
  ellipse(mouseX,mouseY,10,10);
  rect(100,0,25,305);
  rect(200,0,25,405);
  rect(300,0,25,105);
  rect(400,0,25,505);
  rect(500,0,25,215);
  
  rect(100,405,25,300);
  rect(200,500,25,305);
  rect(300,200,25,605);
  rect(400,550,25,305);
  rect(500,300,25,405);
}


