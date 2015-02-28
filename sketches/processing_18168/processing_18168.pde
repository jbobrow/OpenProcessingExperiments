
void setup(){

  color c0 = color(199,172,115);
  color c1 = color(46,106,148);
  
  size(540,300);
  
  noStroke();
  
  int numSteps = width;
  
  for(int i = 0 ; i < numSteps; i++)
  {
    float a = i / (numSteps - 1.0);
    
    colorMode(RGB);
    fill(lerpColor(c0,c1,a));
    rect(i,0,1,150);
    
    colorMode(HSB);
    fill(lerpColor(c0,c1,a));
    rect(i,150,1,150);
    colorMode(RGB);
  }
}

