

int patternSeperationX = 60;
int patternSeperationY =60;


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
smooth();
strokeWeight(6.0);
strokeCap(ROUND);
line(20, 30, 80, 30);
strokeCap(SQUARE);
line(20, 50, 80, 50);
strokeCap(PROJECT);
line(20, 70, 80, 70);
fill(188,229,8,80);
ellipseMode(CENTER);
ellipse(35, 35, 50, 50);
ellipseMode(CORNER);
ellipse(35, 35, 50, 50);

line(0,0,0,60);
line(30,0,30,60);
}

