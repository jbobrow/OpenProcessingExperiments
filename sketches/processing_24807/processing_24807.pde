
int patternSeperationX = 100;
int patternSeperationY = patternSeperationX;
 
 
void setup(){
  size(500,1000);
  background(255);
  for(int i = 0; i < width/patternSeperationX+1; i++){
      for(int j = 0; j < height/patternSeperationY+1; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
   
}
 
void yourFunction(){
   
  smooth();
  stroke(0,191,243);
  triangle(0,0,50,0,0,50);
  triangle(50,0,100,0,100,50);
  triangle(100,50,100,100,50,100);
  triangle(0,50,50,100,0,100);
  line(0,50,100,50);
  line(50,0,50,100);
  line(0,0,100,100);
  line(100,0,0,100);

  for (int x=5;x<50;x=x+5) {
    stroke(242,109,125);
    line(0,x,50-x,0);
    line(0,50+x,x,100);
    line(50+x,0,100,x);
    line(50+x,100,100,100-x);
  }
}
