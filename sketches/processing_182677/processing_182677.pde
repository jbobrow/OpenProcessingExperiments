
/* 
Brian Studwell — Exercise IV: Poke, Rub and Tickle
For Design 479 with Tad Hirsch, Winter '15
*/




int xSpacing = 2;       // spacing of wave points
int w;                  // width of wave
float theta = 0.0;      // initialize angle for sine function
float amp = 75.0;       // height of wave
float period = 100;     // width of one full cycle
float dx;               // value for incrementing sine function
float[] yValues;        // an array of wave point y values


color[] palette = {#261822, #40152A, #731630, #CC1E2C, #FF5434};
color col = palette[int(random(palette.length))];
// color palette "Dragonfly Sun" found on Adobe Color CC 
// https://color.adobe.com/create/color-wheel/?copy=true&base=4&rule=Custom&selected=3&name=Copy%20of%20Dragonfly%20Sun&mode=hsv&rgbvalues=0.15,0.096,0.13380010800000217,0.25,0.08249999999999999,0.1634587800000014,0.45,0.08549999999999998,0.18877451400007306,0.8,0.1178744,0.1744812750415261,1,0.328414187124227,0.20296199999999998&swatchOrder=0,1,2,3,4

void setup(){
  size(600, 600);                       //  canvas size
  smooth();                             //  anti-aliasing 
  w = width+10;                         //  initialize curve width
  dx = (TWO_PI / period) * xSpacing;    //  initialize static curve increment
  yValues = new float[w/xSpacing+10];   //  populate wave point Y-values array
  background(palette[0]);               //  initialize background
}

void draw(){
  dx = (TWO_PI / period) * xSpacing;    //  initialize dynamic curve increment
  noFill();                             //  no fill
  strokeWeight(2);                      //  set stroke weight for wave points
  if (mousePressed == true){            //  act on mouse press
    stroke(palette[1]);                 //  set stroke to #FF5434
    amp = mouseY/2;                     //  initialize dynamic curve amplitude based on mouseY
    period = dist(width/2, height/2, mouseX, height/2);  // increment curve based on distance from vertical center to MouseX
  } else{                               //  when mouse is not pressed
    stroke(palette[2]);                 //  set wave point stroke to #731630
    amp = 0;                            //  set amplitude to 0, making flat rows
  }
  background(palette[4]);               //  refresh background every draw cycle to #261822  
  calcWave();                           //  calculate wave point positions
  renderWave();                         //  draw wave for this interval
}


void calcWave() {
  theta += 0.05;                        //  every interval, increment the angle used in the sine function. This number influences the speed with which wave points appear to move.
  
  float x = theta;                      //  set x to this interval theta
  for (int i = 0; i < yValues.length; i++) {  // for every yValue:
    yValues[i] = sin(x)*amp;            // set the Y value at i position in the yValues array to the sine of x, times amplitude
    x+=dx;                              // increment x according to dx (dx is static while idle, but dynamic while mouse is pressed causing tremendous variation in the curve's expression)
  }
}

void renderWave() {
  int rowHeight = 0;                    //  initialize a null offset for first row of wavepoints
  for(int row = 0; row < 5; row ++){    //  draw 5 rows of wave points
    for (int x = 0; x < yValues.length; x++) {  //  for as many values as are in the yValues array:
      ellipse(x*xSpacing, height/2-50+yValues[x]+rowHeight, 10, 10);   
      /* draw an ellipse whose x position is interval x times spacing, 
      whose y position is the value at position x in the yValues array away from horizontal center minus 50 plus rowHeight,
      whose diameter is 10.
      */
    }
    rowHeight = rowHeight + 50;         //  increment rowHeight by 50 pixels
  }
}


