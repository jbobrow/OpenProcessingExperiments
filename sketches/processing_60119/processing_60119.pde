
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
int x = 25;
int y = 25;
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
 // fill(150);
  // stroke(150);
 // rect(0, 10, 100, 30);
  // fill(210);
  
  stroke(diaColour, 255-diaColour, 50+diaColour, 175);
  strokeWeight(2);
  strokeCap(PROJECT);
  fill(diaColour, 255-diaColour, 50+diaColour, 175);
  ellipse(30, 35, x, y);
  
 // strokeWeight(5);
 // line(0, 10, 10, 40);
  
  x = x + 0;
  y = y + 0;
  
  
}

void mousePressed() {
  save(frameCount+".jpg");
}


