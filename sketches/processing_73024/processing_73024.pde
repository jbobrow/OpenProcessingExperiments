

//naming the class first, and then all the class data
//REMEMBER to name the tab right!!
class pattern { 
  color c;
  float xpos;
  float ypos;
  float xsize;
  float xrotate;
  
  
  //listing all the constructors, altså the "value" of the class data

  pattern(int patternC, float temporaryXpos, float temporaryYpos, float temporaryXsize, float tempXrotate) { 
    c = patternC;
    xpos = temporaryXpos;
    ypos = temporaryYpos;
    xsize = temporaryXsize;
    xrotate = tempXrotate;
  }

//now writing the method - what I need to do with my pattern
  void shapePattern() {
    fill(c);
    noStroke();
    ellipse(xpos,ypos,xsize,150);
    
  }
  void RotatePattern() {
    
    translate(width/2,height/2);
    rotate(sin(xrotate));
    xrotate = xrotate+1; 
  }
 
}


