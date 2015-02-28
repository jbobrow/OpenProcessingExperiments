
// Op_Art_Riley 'Travelling wave' version
//Revised 2014-04-06 for Processing version 2.0
//Original version for Processing 1.5, 2012-04-17

//by Phillip Kent
//phillip.kent@gmail.com, http://www.phillipkent.net

//Available at:
// http://www.openprocessing.org/sketch/59331
// http://www.openprocessing.org/user/18229

//Created for DesignScience:  http://design-science.org.uk
//This code appeared in Litmus Paper Issue 2 at the Cheltenham Science Festival 2012.
// http://issuu.com/cheltenhamfestivals/docs/litmus_day2/1
// http://design-science.org.uk/litmus-paper/
// http://design-science.org.uk/algorithmic-thinking-with-processing

int Nx = 40; //number of ellipses across
int Ny = 30; //number of ellipses down
int t = 0;

void setup() {
  size(800,600);
  ellipseMode(CENTER);
  stroke(255);
  smooth();
  frameRate(7);
}

void draw() {
  background(0);
  t++;
  //draw the shapes
  for (int j=0;j<height;j=j+width/Nx){
  for (int i=0;i<width;i=i+width/Ny){
  ellipse (i, j, 0.95*(width/Nx)*(1.2+cos((4*i*PI/width) - (t*2*PI/50) +PI))/2, 0.95*(height/Ny));
 } 
}
//  Use this code to output a still frame
//noLoop();
//save("op_art_riley_image_output.tif");
}


