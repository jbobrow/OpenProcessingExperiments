
/////////////////////////////////////////////////////////////
//
//    if you use this code leave this comment in 
//
//    PATTERN MAKER
//    Ben Jack - March 2012
//    
//    DSDN 142 course material
//
/////////////////////////////////////////////////////////////



//what happens if you change these? 
int xRepeat = 60;
int yRepeat = 60;
int x = 0;
int y = 0;
float diaColour = 210;


void setup() {
  size(360, 555);

  background(75);

  for (int i = 0; i < width/xRepeat; i++) {//loop 1 repeats pattern in the x direction.
    for (int j = 0; j < height/yRepeat; j++) {//loop 2 repeats the entire rows vertically.
      pushMatrix();//saves untransformed co-ordinates
      translate(xRepeat*i, yRepeat*j);// translates the entire coordinate system (is what causes the same thing to be drawn in different places).
      myPattern();
      popMatrix();//reverts to the saved co-ordinate system that we created using pushMatrix()
    }
  }
}


//ignore draw this time. use the "myPattern()" function instead
void draw() {
}


void myPattern() {
  
  smooth();
  diaColour = random(50, 120);
  
  stroke(diaColour, 255-diaColour, 50+diaColour, 175);
  strokeWeight(20);
  strokeCap(PROJECT);
  fill(diaColour, 255-diaColour, 50+diaColour, 175);
  line(x, y, 500-x, 500-y);
   
  x = x - 10;
  y = y - 4;
  
  
}

void mousePressed() {
  save(frameCount+".jpg");
}


