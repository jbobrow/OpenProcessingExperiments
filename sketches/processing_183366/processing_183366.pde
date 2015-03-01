
int screenSize = 400;
int units = 8;
int circleSize = int(screenSize/units);
int r = circleSize/2;
color c1 = color(255,0,0,55);
color c2 = color(0,0,255,55);
color c3 = color(0,255,255,155);



void setup()
{
  size(screenSize, screenSize);
  background(0);
  smooth();
  noFill();
  stroke(255);
  ellipseMode(CENTER);

}

void draw() {

    //fill (c1);
    drawCircleGrid(0,0, 0, true);
    //fill (c2);
    drawCircleGrid(-r,-r, 0, false);  
    //fill (c3);
    drawCircleGrid(-r,-r, 0, false);
     
    noLoop();
}

void drawCircleGrid(int xOffset, int yOffset, int circleInc, boolean baseGrid) {
    
    if (!baseGrid) units++;;

    for (int i=0;i< units; i++) {
       for (int j=0;j< units; j++) {
            pushMatrix();
            translate(xOffset + r+i*circleSize, yOffset+ r+j*circleSize);
            ellipse(0,0, circleSize+ circleInc, circleSize+circleInc);
            popMatrix();  

       }
    }
}  
