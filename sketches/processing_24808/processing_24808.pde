
int patternSeperationX = 100;
int patternSeperationY = patternSeperationX;
 
 
void setup(){
  size(500,1000);
      
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
  rect(0,0,100,100);
  for (int x=5;x<51;x=x+5) {
    stroke(0,191,243);
    line(0,x,x,0);
    line(45+x,100,100,45+x);
    line(0,45+x,55-x,100);
    line(45+x,0,100,55-x);
    stroke(242,109,125);
    ellipseMode(CENTER);
    ellipse(50,50,75-x,75-x);
  }
}

