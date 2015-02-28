
//Polly Lesaguis, CP1, mods 4/5, User Input

int a = 5;
int b = 5;
void setup()
{
  size(500,500);
  background(0);
}
void draw()
{
  noFill();
  random(5,5);
  stroke(mouseX,mouseY,45);
  ellipse(mouseX,mouseY,random(25),5);
  ellipse(500-mouseX,mouseY,random(25),5);
 
  {
    if(keyPressed==true)
    {
      stroke(50);
      rect(random(500),random(500),30,30);
    }
  }
}
 void mouseDragged()
 { 
  fill(41,30,30);
  stroke(mouseX,5,mouseY);
  rect(mouseX,mouseY,10,10);
  rect(500-mouseX,mouseY,10,10); 
 }
