
//  Title: Radial Color
//  Description: Creates a radial/azimuthal beating pattern of colors in polar coordinates
//  Date Started: 21 Jan 2012
//  Last Modified: 24 Jan 2012
//  http://asymptoticdesign.wordpress.com/
//  This work is licensed under a Creative Commons 3.0 License.
//  (Attribution - NonCommerical - ShareAlike)
//  http://creativecommons.org/licenses/by-nc-sa/3.0/
//  
//  In summary, you are free to copy, distribute, edit, and remix the work.
//  Under the conditions that you attribute the work to me, it is for
//  noncommercial purposes, and if you build upon this work or otherwise alter
//  it, you may only distribute the resulting work under this license.
//
//  Of course, the conditions may be waived with permission from the author.

//-----------------Globals
int size = 1;                         //size of pixels used in image
int freq0 = 75;                       //frequency of color oscillation (radial)
int freq1 = 76;                       //frequency of color oscillation (radial)
int freq2 = 25;		              //frequency of color oscillation (azimuthal)
int freq3 = 23;		              //frequency of color oscillation (azimuthal)
float[] phases = {0.5, 0.5, 0.5, 0};  //sequence of phase differences -- this provides the animation!
float[] deltas = {0.2, 0.1, 0.3, 0.1};//how quickly the phases change -- this controls how fast the image changes.
float[] deltaTemp = {0,0,0,0};        //a temporary array to store deltas in when the animation stops.
float colR = 255;                     //color red
float colG = 0;                       //color green
float colB = 0;                       //color blue
float centerX = 0;                    //center of radial coordinates in x
float centerY = 0;                    //center of radial coordinates in y
float r = 0;                          //radius from centerX,centerY
float theta = 0;                      //theta from the abscissa
int mouseCounter = 0;

//-----------------Setup
void setup(){
  //setup variables
  size(300,300);
  centerX = 0.5*width;
  centerY = 0.25*height;
  background(255);
  smooth();
  //parameters for drawing pixels
  noStroke();
  rectMode(CORNERS);
  //iterate over the width (x-axis)
  for(int i = 0;i < width; i = i + size){
    //iterate over the height (y-axis)
    for (int j = 0; j < height; j = j + size){
      //determine (radius,theta) for every (x,y) point
      r = sqrt((i-centerX)*(i-centerX) + (j-centerY)*(j-centerY));
      theta = atan2(j - centerY,i - centerX);
      //set the color to be a beat frequency of the radial and azimuthal position
      colG = abs(255*sin((TWO_PI * r) / (2*freq0) + phases[0])*sin((TWO_PI * r)/(2*freq1) + phases[1])*sin(freq2*theta + phases[2])*sin(freq3*theta) + phases[3]);
      fill(colR,colG,colB);  
      //draw the pixel
      rect(i,j,size+i,size+j);
    }
  }
  //save the image if you'd like.  because this is in setup(), it'll only save the initial frame.
  //saveFrame("thumbnail.png");
}


//-----------------Main Loop
void draw(){
  for (int i = 0; i < 4; i++){
     if (phases[i] == TWO_PI) {
       phases[i] = 0;
     }
     else {
       phases[i]-=deltas[i];
     }
  }
  for(int i = 0;i < width; i = i + size){
    //iterate over the height (y-axis)
    for (int j = 0; j < height; j = j + size){
      //determine (radius,theta) for every (x,y) point
      r = sqrt((i-centerX)*(i-centerX) + (j-centerY)*(j-centerY));
      theta = atan2(j - centerY,i - centerX);
      //set the color to be a beat frequency of the radial and azimuthal position
      colG = abs(255*sin((TWO_PI * r) / (2*freq0) + phases[0])*sin((TWO_PI * r)/(2*freq1) + phases[1])*sin(freq2*theta+phases[2])*sin(freq3*theta+phases[3]));
      fill(colR,colG,colB);  
      //draw the pixel
      rect(i,j,size+i,size+j);
    }
   }
}
//-----------------Interactions
//Clicking the mouse stops the animation; a second click restores it.
void mousePressed() {
  if (mouseCounter == 0) {
    mouseCounter = 1;
    for(int i = 0; i < 4; i++){
      deltaTemp[i] = deltas[i];
      deltas[i] = 0;
    }
  }
  else {
    mouseCounter = 0;
    for(int i = 0; i < 4; i++){
      deltas[i] = deltaTemp[i];
    }
  }
}

//-----------------Defined Functions 

//-----------------Defined Classes

