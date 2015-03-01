
/*
 *
 * Paul Smith
 * After Indae Hwang and Jon McCormack
 * 
 */

void setup() {
  size(750, 750);
  background(144,180,255);
  rectMode(CENTER);
  noStroke();
}


void draw() {
  background(144,180,255);
  noStroke();

  int num = 25;
  int margin = 80;
  float colourOff = 0;

  float gutter = 0; //distance between each cell
  float cellsize = ( width - (3 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;
      
      float tx = tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      float tangle = 0;
      
      if ( j % 2 == 0 ) {
           tx = margin + cellsize * (num -i ) + gutter * (num-i);
      } else {
           tx = margin + cellsize * i + gutter * i;
      }
      

      tangle = circleNumber * TWO_PI * millis() *.0000015;
      colourOff = circleNumber * TWO_PI * millis() * .0000003;
      float xvar = circleNumber * TWO_PI * millis() * .00000045;
      float xvarb = circleNumber * TWO_PI * millis() * .00000015;
      float yvar = circleNumber * TWO_PI * millis() * .00000090;
      float yvarb = circleNumber * TWO_PI * millis() * .00000060;
      float balvar = circleNumber * TWO_PI * millis() *  .0000005; 
      float balvarb = circleNumber * TWO_PI * millis() * .00000075; 

      
      if (circleNumber % 2 ==0) {
        ballerinas(tx, ty, cellsize, tangle, colourOff, xvar, yvar, balvarb);
      } else {
        dancers(tx, ty, cellsize, tangle, colourOff, xvarb, yvarb, balvar);
      }
    }
  }
}//end of draw 


void dancers(float x, float y, float size, float angle, float chcol, float xvar, float yvar, float bvar) {

  // calculate endpoint of the line
  int colvar = (int) degrees(sin(chcol)); 
  xvar = degrees(cos(xvar));
  yvar = degrees(sin(yvar));
  bvar = degrees(cos(bvar));
  
  
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  strokeWeight(.75);
  
 stroke(60+colvar,55, 180+colvar, 80+bvar);
  line(x, y, xvar+tempX,yvar+tempY); 
 
}

void ballerinas(float x, float y, float size, float angle, float chcol, float xvar, float yvar, float bvar) {
  angle = 360 - angle;
  int colvar = (int) degrees(sin(chcol)); 
  xvar = degrees(sin(xvar));
  yvar = degrees(cos(yvar));
  bvar = degrees(sin(bvar));
 
  
  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  strokeWeight(random(.6));
  
 stroke(42+xvar,100+yvar, 190, 100+bvar);
   line(x, y, xvar+tempX,yvar+tempY);

}


