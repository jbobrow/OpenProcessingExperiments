
float radius = 50.0;
int X, Y;
int nX, nY;
float sweight=1;
float curSWeight = 1+sweight;
int delay = 16;  
float globlen =100.0;
boolean firstTime=true;
// Setup the Processing Canvas
void setup() {
  size(1024,780 );
  smooth();
  strokeWeight(curSWeight);
  background(0);
  frameRate( 15);
  X = width / 2;
  Y = height / 2;
  nX = X;
  nY = Y;
}  

// Main draw loop
void draw() {  
  if(mousePressed == true)
  {
    if(mouseButton == LEFT)
    {

      if(firstTime==false)
      {
        globlen *= 1.1;
      }
      else
      {
        curSWeight = sweight;
        strokeWeight(curSWeight);
        globlen=1;
        firstTime=false;
      }
      pushMatrix();
      stroke(50+random(205),50+random(205),20+random(235));
      translate(mouseX,mouseY);
      rotate(radians(sin(frameCount)*360));  
      float len = 20+ random(globlen);
      //line(0,0,0,len);
      drawBranches(0,0,len);
      popMatrix();
    }
    else
    {
      background(0);
    }
  }


  if(frameCount%8==0)
  {
    fill(0,0,0,10);
    rect(0,0,width,height);
  }
  if(frameCount%120==0 && false )
  {
    fill(0,0,0,30);
    rect(0,0,width,height);
  }
}  
void drawBranches(int X,int Y,float len)
{
  stroke(100+sin(frameCount)*random(205),50+sin(frameCount*2*PI/3)*random(170),100+sin(frameCount*PI)*random(235));
  if(len>3)
  {
    len *= 0.66;
    curSWeight =1+curSWeight*0.3;
    strokeWeight(curSWeight);
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(radians(random(90)));
    line(0, 0, 0, -len);  // Draw the branch
    fill(random(175),random(30),random(100));
    noStroke();
    ellipse(0,0,1.5*curSWeight,1.5*curSWeight);
    fill(#ffffff);
    ellipse(0,0,1.5,1.5);
    translate(0, -len); // Move to the end of the branch
    drawBranches(0,0,len);
    popMatrix();    
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    stroke(100+sin(frameCount)*random(205),50+sin(frameCount*2*PI/3)*random(170),20+sin(frameCount*PI)*random(235));
    rotate(radians(-1*random(90)));
    line(0, 0, 0, -len);  // Draw the branch
    translate(0, -len); // Move to the end of the branch
    fill(random(175),random(30),random(100));
    //    fill(#ffffff);
    noStroke();

    ellipse(0,0,1.5*curSWeight,1.5*curSWeight);
    fill(#ffffff);
    ellipse(0,0,1.5,1.5);
    drawBranches(0,0,len);
    popMatrix();
  }
}


void mouseReleased()
{
  firstTime=true;
}


