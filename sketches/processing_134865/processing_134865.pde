
void setup(){
  size(400,400);
  background(255);  
  smooth();
}

void draw(){
  fill(mouseX,mouseY,mouseX);
  ellipse(mouseX,mouseY,100,40);//body
  ellipse(mouseX-50,mouseY-20,10,50);//tail
  ellipse(mouseX+40,mouseY-20,40,40);//head
  stroke(20);
  line(mouseX-25,mouseY,mouseX-25,mouseY+40);//back leg
   line(mouseX+25,mouseY,mouseX+25,mouseY+40);//front leg
   fill(25);
  ellipse(mouseX+40,mouseY-20,20,50);//ear
  ellipse(mouseX+60,mouseY-20,10,10);//nose
}


