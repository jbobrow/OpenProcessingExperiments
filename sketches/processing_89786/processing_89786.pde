
void setup()
{
 size(200,200);
}
void draw()
{

 if (mouseX>20 && mouseX<60 && mouseY>160 && mouseY<180)
   background(255);
 else
 {
  background(0);
 }
 
  fill(200,160,0);
  rect(80,30,40,40);
  rect(80,80,40,60);
  fill(0,70,120);
  noStroke();
  ellipse(90,40,10,10);
  ellipse(110,40,10,10);
  triangle(100,50,90,60,110,60);
  fill(200,10,40);
  ellipse(100,100,10,10);
  ellipse(100,120,10,10);
  fill(255);
  stroke(0);
  rect(20,160,40,20);

}
