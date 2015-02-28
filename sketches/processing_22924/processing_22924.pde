
int patternSeperationX = 30;
int patternSeperationY =30;


void setup(){
  size(500,500);
  smooth();
  background(255, 255, 255);
  
  
  fill(255,20);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
  
}


void draw()
{

}


void yourFunction()
{
  strokeWeight(8);
  stroke(23,random(23));
  fill(188,229,8,110);
  ellipseMode(CENTER);
ellipse(22.5, 22.5, 45, 45);
ellipseMode(CORNER);
ellipse(45, 45, 50, 50);
line(0,0,45,45);
line(0,45,45,0);
line(22.5,0,22.5,45);
line(0,22.5,45,22.5);

}
   

