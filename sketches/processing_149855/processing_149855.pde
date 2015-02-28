
void setup()
{
  size( 1300, 700 );
  background(0);
  smooth();
  frameRate(15);
}
 
void draw()
{
  noStroke();
  fill(0,0);
  rect(0,0,1330,700);
  fill(random(100,255),255,random(100,255),150);
  triangle(pmouseX,pmouseY,mouseX,mouseY,pmouseX+random(-200,200),pmouseY+random(-200,200));
  
  if(keyPressed)
  {
    fill(0);
  rect(0,0,1330,700);
  fill(random(100,255),255,random(100,255),150);
  triangle(pmouseX,pmouseY,mouseX,mouseY,pmouseX+random(-200,200),pmouseY+random(-200,200));
  }
  if(mousePressed)
  {
   fill(0);
  rect(0,0,1330,700);
  }
}
