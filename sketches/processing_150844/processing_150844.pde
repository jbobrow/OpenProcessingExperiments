
/* Vera Molnar exercise. 
 * Version: Siomara J.
 */
 
 void setup(){
   size(600,600);
   rectMode(CORNER);
   randomSeed(hour() + minute() + second() + millis());
   noStroke();
   frameRate(1);
 }
 
 void draw(){
   background(188);
   
   int num = 5;
   int gap = 10;
   
   float cellsize = (width - (num+1) * gap)/(float)num;
   println("cellsize= " + cellsize);
   
   float  offsetX = cellsize;
   float offsetY = cellsize;
   
   for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        stroke(153);
        fill(random(255),random(255),random(255), random(200, 255)); // rectangle
        if(i == 0 && j != 4)
        {
          rect((gap * (i+1) * random(1, 2)) + (cellsize * i), (gap * (j+1) * random(1, 2)) + (cellsize * j), cellsize, cellsize);
        }
        else
        {
          rect((gap * (i+1) * random(0, 1)) + (cellsize * i), (gap * (j+1) * random(0, 1)) + (cellsize * j), cellsize, cellsize);
        }
      }
    }
 }


