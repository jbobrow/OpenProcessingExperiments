
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/150970*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/*
 * Creative Coding
 * Week 2, 05 - Moving Patterns 1
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch builds on the previous sketches, drawing shapes based on the
 * current framerate. The movement of individual shapes combine to create a
 * gestalt field of motion. Use the arrow keys on your keyboard to change the
 * frame rate. 
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;
int num,margin;
  float gutter ,cellsize; //distance between each cell
  ArrayList <Circles>circlesList;
  
void setup() {
  size(600, 600);
  noStroke();
  noFill();
  frame_rate_value = 30;
  frameRate(frame_rate_value);
  initialize();
}
void initialize(){
  circlesList=new ArrayList<Circles>();
  int num = 20;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);
  int circleNumber = 0; // counter
  for (int i=0; i<num/2; i++) { // NEW NEW NEW 'num/2' I'm only drawing half the width as I'm repeating it with symmetry
    for (int j=0; j<num/2; j++) { // NEW NEW NEW 'num/2' I'm only drawing half the width as I'm repeating it with symmetry
      circleNumber =i*num+j;// (i * (num/2)) + j; // different way to calculate the circle number from w2_04
      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      circlesList.add(new Circles(tx, ty, cellsize*4, circleNumber));
    }
  }
}

void draw() {

  background(0);
  for (int i=0; i<circlesList.size(); i++) { // NEW NEW NEW 'num/2' I'm only drawing half the width as I'm repeating it with symmetry
          circlesList.get(i).movingCircle();
  }
  
} //end of draw 
/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyReleased() {

  // right arrow -- increase frame_rate_value
  if (keyCode == RIGHT && frame_rate_value < 60) {
    frame_rate_value++;
  }

  // left arrow -- decrease frame_rate_value
  if ( keyCode == LEFT && frame_rate_value > 1) {
    frame_rate_value--;
  }

  // set the frameRate and print current value on the screen
  //frameRate(frame_rate_value);
  println("Current frame Rate is: " + frame_rate_value);
}

class Circles{
  float x,y,size,circleNum;
  Circles(float x,float y,float size, int circleNum) {
    this.x=x;
    this.y=y;
    this.size=size;
    this.circleNum=circleNum;
  }
  void movingCircle() {

  float finalAngle;
  finalAngle = frameCount + circleNum;
  float dst=sqrt(dist(width/2,height/2,mouseX,mouseY)/200);
  //float dst=1;
  float si=(size / 2) * sin(PI*dst/ frame_rate_value * finalAngle);
  float co=(size / 2) * cos(PI*dst / frame_rate_value * finalAngle);

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x +si;
  float tempY = y + co;
  float tempX2 = x + co;
  float tempY2 = y + si;

  // NEW NEW NEW - I replaced the line() and rect() commands with ellipses and mirrored
  //               the top left portion to the top right, bottom right and bottom left   
  float sx = sin( map( tempX, 0, width, 0, PI) );
  float sy = sin( map( tempY, 0, height, 0, PI*dst));
  float xy = sx * sy;
  float diameterX = xy * 50; 
  int transparency = 128;
  display(#f2db72, transparency,tempX,tempY,diameterX,diameterX);
  display(#faaf5a, transparency,tempX2,tempY2,diameterX,diameterX);
  display(#c282b0, transparency,tempY,tempX,diameterX,diameterX);
  display(#e8a2d8, transparency,tempY2,tempX2,diameterX,diameterX);
}

void display(int ellipseColor,float ellipseAlpha,float elX,float elY,float radius1,float radius2){
  fill(ellipseColor, ellipseAlpha); 
  ellipse(elX, elY, radius1, radius2);
  ellipse(width-elX, elY, radius1, radius2);
  ellipse(elX, height-elY, radius1, radius2);
  ellipse(width-elX, height-elY, radius1, radius2);
} 
}

