
/* Version 5, iteration 3. 
This program takes X[] and Y[] values from a pair of arrays, translates to those coordinates and places a circle at the 0,0 value. 
From there, it rotates according to the respective angle[] value and draws a line growth[] units long. Each iteration, it increases the growth[] distance by a set amount.
Once the growth[] value is equal to or greater than the distance[] value, it will stop growing the line, translate to the end of the line and draw a rectangle.
The program then recurses and repeats this pattern for as many times as there are node values. 

Things that will be added, from highest priority to lowest. 
 * 2D array storing keywords for each data node. Draw a line between nodes sharing the same keywords. Also, convert the angle, distance and growth arrays to 2D arrays. Randomize. 
 * tuioProcessing and tuioZones support. This will allow the nodes to be generated through touch, and manipulated through touch, respectively.
 * Parse the XML data. Separate returned entries into 5 categories. Count the number of fingers detected and assign a category numerically. Reset at 5 fingers.
 
Saturday, May 09, 2009.  */


int fingers = 3;      //How many fingers are placed on the surface.
int nodes = 4;        //How many nodes per category.
int[]nodex = new int[fingers];             //X and Y values of the fingers and nodes. The 0 value is the finger, and 1+ values are nodes. 
int[] nodey = new int[fingers];
float[] angles = new float[nodes];        //Angle of the growth. 
float[] distance = new float[nodes];          //Distance of the growth.
float[] growth = new float[nodes];            //Temporary value. The length of the branch at any given time. This is compared to the distance value to determine if the branch has grown fully. 


void setup(){
  size(800,600);
  smooth();
  stroke(0);
  fill(255);
  loop();
  frameRate(30);
  nodex[0] = 300;              //Insert dummy data for testing purposes. 
  nodey[0] = 400;
  nodex[1] = 500;
  nodey[1] = 300;
  nodex[2] = 200;
  nodey[2] = 500;
  for(int i=0;i<growth.length;i++){
    growth[i] = 0;
  }
  distance[0] = 100;
  distance[1] = 75;
  distance[2] = 125;
  distance[3] = 50;
  angles[0] = 3.14;
  angles[1] = 2.79;
  angles[2] = 3.49;
  angles[3] = 3;
}


void draw(){
  background(255);
  for(int i=0;i<nodex.length;i++){       //Create a circle for each finger detected. 
    pushMatrix();
    translate(nodex[i],nodey[i]);  //Translate to the finger point.
    ellipse(0,0,64,64);
    line(0,0,0,-growth[0]);           //Draw the first branch growing straight up. This is to help distinguish the branches so that they don't interwine too early. 
      if (growth[0] < distance[0]) { growth[0] = growth[0] + 1; }          //If the branch IS NOT equal to the distance, increase it's length. 
      else if (growth[0] >= distance[0]) {                                 //If the branch IS equal to the distance, correct for the rotation, then draw a rectangle. 
        translate(0,-growth[0]);
        rect(-40,-16,80,32);
        rotate(angles[1]);
          branch(1);                                      //Begin recursion.
      }
      popMatrix();                 //Use of pushMatrix and popMatrix in each iteration of the for loop prevents more than 32 iterations or fingers. 
    }  
}


void branch(int x) {
  line(0,0,0,growth[x]);           //Draw the branch.
    if (growth[x] <= distance[x]) { growth[x] = growth[x] + 1; }          //If the branch IS NOT equal to the distance, increase it's length. 
    else if (growth[x] > distance[x]) {                                   //If the branch IS equal to the distance, correct for the rotation, then draw a rectangle. 
      translate(0,growth[x]);
      rotate(-angles[x]);
      rect(-40,-16,80,32);
    if(x < nodes-1) {     //Exit mechanism. Do not allow the subroutine to repeat itself more than 3 times. 
      rotate(angles[x+1]);           //Compensate for the increasing rotat
      x = x + 1;
      branch(x);
    }
  }

}



