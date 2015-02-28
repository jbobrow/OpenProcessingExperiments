
int patternSeperationX = 140;
int patternSeperationY = 140;
 
 
void setup(){
  size(500,500);
   
 
   
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        stroke(0);
  strokeWeight (5);
  smooth();
  fill (255,150,15);
  ellipse (120,120,150,150);
  smooth();
  fill (0);
  ellipse (100,100,20,30);
  smooth();
  fill (0);
  ellipse (140,100,20,5);
  smooth();
  noFill();
stroke(255, 102, 0);
smooth();
//line(30, 20, 80, 5);
//line(80, 75, 30, 75);
stroke(0, 0, 0);
smooth();
bezier(120, 100,  110, 130,  125, 130,  120,120);
smooth();
bezier(100, 160,  110, 140,  125, 140,  140,160);
smooth();
        popMatrix();
      }
  }
   
}
 
 
void draw()
{
  //This is here so the program keeps running and the screengrab will work
}
 


