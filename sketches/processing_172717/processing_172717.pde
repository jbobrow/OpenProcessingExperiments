
void setup()
{
  size(850,850);
  background(random(255),random(255),random(255));
}
void draw()
{
  if(mousePressed)
  {
    fill(random(255),random(255),random(255),random(255));
    ellipse(mouseX,mouseY,20,20);
    ellipse(width-mouseX,mouseY+400,25,25);   
    for (int i = 0; i < 850; i = i+75) {
  line(850,i,0,i);
}
  }
}
 void keyPressed(){
   background(random(255),random(255),random(255));
 }
