
void setup (){
size (400,400);
smooth();
background(0,0,0);
}
void draw()
{
  fill(mouseX,mouseY,mouseX,20);
  if (mousePressed == true) {
    fill(random(0,255),random(0,255),random(255,0));
    rect(mouseX,mouseY,10,90);}
    else {
      ellipse(mouseX,mouseY,80,20);}
 
}

  

