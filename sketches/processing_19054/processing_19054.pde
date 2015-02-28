
//Mapping and Scaling
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

  float cx = constrain(mouseX,0,100);
  float cy = constrain(mouseY,0,100);
  
  noStroke();
  fill(255,0,0, 200); //red
  ellipse(cx, cy, 10,10); //change to nx,ny later

  xpos = map(cx, 0,100,  0,width);  //change to nx,ny
  ypos = map(cy, 0,100,  0,height);

  fill(0,255,0, 200); //green
  ellipse(xpos,ypos, 20,20);
}

/*
//Another example. Uncomment to see:
//Using Map to fill the background based on mouseX
void setup()
{
  size(500,100);
}
void draw()
{
  float fillval = map(mouseX, 0,width, 0,255);
  background(fillval);
}
*/


