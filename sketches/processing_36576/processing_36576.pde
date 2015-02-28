
//"hw3" CMU 48-757 F'11
//copywrite 2011 Zack Jacobson-Weaver
void setup()
{
  size(400,400);
  frameRate(60);  
  noCursor();
}

void draw()
{
  noStroke();
  fill(193,252,3);
  rect(0,0,width,height);
ellipseMode(CENTER);
fill(250,211,204);
ellipse( width/2, height/2, mouseX, mouseY);
  fill(231,252,3);
  ellipse( width, height, mouseX, mouseY); 
fill(231,252,3);
ellipse( 0, 0, mouseX, mouseY);
  strokeWeight(5);
  stroke(255,0,0);
  line(pmouseY, 200, pmouseX,pmouseX );
stroke(3,25,255);
line(pmouseY,200, pmouseY,pmouseY);
  stroke(246,255,3);
  line(pmouseY,pmouseY, pmouseX,pmouseX );  
}
  
 
  

  

