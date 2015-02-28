
int r= 0;
   float wide = 100;
   float high = 100;

void setup() {
  size(600,400);
  smooth();
  noCursor();
  
}




void draw()
{
   fill(198,217,240,100);
   rect(0,0, width,height);
   fill(150);

   if(mousePressed)
  {
   wide =  map(mouseX, 0, 640, 50, 300);
   high = map(mouseY, 0, 480, 50, 300);
  }
  drawPlane(mouseX, mouseY, wide, high);
}


void drawPlane(int xpos, int ypos, float wide, float high)
{
  strokeWeight(2);
     translate(xpos,ypos);
  
  //tail
  rectMode(CENTER);
  rect(0,high/10, wide/1.5, high/10); 
  rectMode(CORNER);
  
  //wings
  quad(-wide,-high +75, wide,-high +75, wide,-high +80, -wide,-high+80);
  quad(-wide,high -75, wide, high-75,wide, high-80,-wide,high-80);
   
   //fuselage
  ellipse(0, 0, high/2,high/2);
  ellipse(0, 0, 15,15);
  
  //vertical wires
  line(-wide +10,-high+80, -wide +10,high-80);
  line(wide -10,-high+80, wide -10,high-80);

  //cross wires
  line(-wide +10,-high+80, -30,high-80);
  line(wide -10, -high+80, 30,high-80);

  line(-wide +10,high-80, -30,-high+80);
  line(wide -10,high-80, 30,-high+80);


  //propellors
  pushMatrix();
  rectMode(CENTER);

  rotate(r);

  rect(0, 0, high/3,5);
  rectMode(CORNER);
  
  popMatrix();
  
  //wheels
  ellipse(-wide+80,high- 70, 6, 10);
  ellipse(wide-80,high-70, 6, 10);
   
    r++;
}










