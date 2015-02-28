

float x,y;


void setup()
{
  size(400,400);
  background(0);
  fill(255,0,0);
  x=100;
  y=100;
}

void draw ()
{
   // background(0);
   
  fill(0,1); 
  rect(0,0,width,height);
  //fill(255,0,0);
fill(random(255),random(255),random(255));
 rect(mouseX,mouseY,75,75); 
}

//void keyPressed()
{
  saveFrame("hw3###.jpg");
}


