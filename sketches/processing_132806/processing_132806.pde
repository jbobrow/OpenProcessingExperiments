
/* Code adapted from P.2.2.5.01 from the book 
Generative Design by Hartmut Bohnacker, 
Benedikt Gross, Julia Laub, 
and Claudius Lazzeroni 
*/

//to save file as a .dxf:
//import processing.dxf.*;
//Maximum number of circles:
int maxCount = 200;
//Array for x, y, and radius values:
float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount];
//array for stroke width:
float[]sW = new float[maxCount];
//Minimun and maximum radius values:
float minRadius = 5;
float maxRadius = 100;
//Size:
int sizeX = 500;
int sizeY = 850;

int counter = 1;
//To make background a random color:
int bg1 = int(random(0, 255));
int bg2 = int(random(0, 255));
int bg3 = int(random(0, 255));

 
void setup(){
 background(bg1, bg2, bg3); 
  noFill();
 size(sizeX, sizeY, P3D);
//start recording frame for .dxf file:
//beginRaw(DXF, "finishedCircles.dxf");

}
 
void draw() {
  //find random radius value
 float newR = random(minRadius, maxRadius);
 //declare newX and newY as variables:
 float newX = 0;
 float newY = 0;
 float mX = mouseX;
 float mY = mouseY;
 //This makes the circles not go off the page by declaring x and y values only if 
 //the circle stays on the page:
 if (mX+newR>width){
   newX = mX-newR;
 }
 if (mY+newR>height){
   newY = mY-newR;
 }
 if((mX-newR)<0){
   newX = mX+newR;
 }
 if((mY-newR)<0){
   newY = mY+newR;
 }
 if((mX-newR)>=0&&mX+newR<=width){
   newX = mX;
 }
 if((mY-newR)>0&&mY+newR<height){
   newY = mY;
 }
 //Check the declared values to see if they intersect with other circles:
  boolean intersection = false;
  for (int i=0; i<counter; i++) {
    float d = dist(newX,newY, x[i],y[i]);
    if (d<(newR+r[i])) {
      
      intersection = true;
      break;
    }
    //if there is an intersection, run draw() again to get new values:
    if (intersection == true) {
      draw();}
  }
  //if there isn't an intersection, add the values as a circle.
   if (intersection == false) {
     x[counter] = newX;
     y[counter] = newY;
     r[counter] = newR;
 
       counter++;
   //Go through and draw each circle, and change the stroke weight depending on the counter number:
     for (int i=0; i<counter; i++) {
       sW[counter-1] = counter-1;
       if (sW[i]<30) {
        strokeWeight(sW[i]);
       }
        if ((80>sW[i])&&(sW[i]>13)) {
        strokeWeight(sW[i]/12);
       }
       if(sW[i]>80){
         strokeWeight(2.5);
       }
       ellipse(x[i], y[i], r[i]*2, r[i]*2);

     }   
  }
//When the number of circles reaches the maximum, save the image as a .dxf and end the program.
  if (counter == maxCount) {
   // endRaw();
    exit();
  }
}

