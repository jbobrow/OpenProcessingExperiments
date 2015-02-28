
void setup() {
size(500,500);
  background(255);

}

void draw() {
  stroke(.1);

  fill(21,34,255,20);
if ((mouseX < 250) &&(mouseY < 250)){
  ellipse(125,125,mouseX,mouseY);{
      noStroke();

      
}

}
  stroke(.1);

fill(99,34,11,20);
if ((mouseX > 250) &&(mouseY < 250)){
  rect(250,0,mouseX,mouseY);{
    noStroke();
    fill(255);
  ellipse(mouseX,mouseY,10,10);{
}
}
}
if ((mouseX > 250) &&(mouseY > 250)){
  noStroke();
  ellipse(mouseX,mouseY,100,20);{

       fill(255,8,90,150);
       stroke(0);
  ellipse(mouseX,mouseY,150,10);{
}
}
}
if ((mouseX < 250) &&(mouseY > 250)){
  fill(30,338,9,150);
  ellipse(mouseX,mouseY,200,200);{
      noStroke();

       fill(255,30,8,80);
  ellipse(mouseX,mouseY,100,100);{
}
}
}
}



