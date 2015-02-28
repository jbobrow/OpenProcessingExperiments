
//Mapping Example.
float x,y;
float xpos,ypos;
void setup()
{
  size(640,480);
  smooth();
}
 
void draw()
{
  background(200);
 
  noFill();
  stroke(1);
  rect(0,0, 100,100);
   
  noStroke();
  fill(255,0,0, 200); //red
  ellipse(mouseX, mouseY, 10,10); //change to nx,ny later
 
  xpos = map(mouseX, 0,100,  0,width);  //change to nx,ny
  ypos = map(mouseY, 0,100,  0,height);
 
  fill(0,255,0, 200); //green
  ellipse(xpos,ypos, 20,20);
}

