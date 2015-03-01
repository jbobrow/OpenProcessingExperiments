
/* Creative Coding
 * Week 2 exercise- 25 squares
 * by Zeeshan D.
 * Copyright(c) 2014 Zeeshan Dawood
 *futurelearn class exercise week2
 */
 
 

 
 void setup() {
   size(600,600);
   rectMode(CORNER);
   noStroke();
   frameRate(1); // set the frame rate to 1 draw() call per second
   randomSeed(hour()+minute()+second()+millis());
 }
   void draw(){
     int randomColor = (int) random(0, 255);
    background(255); 
     
     int num = (4) ; // select a random number of squares each frame
     int gap = (int) random(2,85); // select a random gap between each square
     
     
     // calculate the size of each square for the given number of squares and gap between them
     float cellsize = ( width - (num + 1) * gap) / (float)num;
     
    
     println("cellsize =" + cellsize);
      if (keyPressed == true && key == 'r') {
    background(255);}
     // calculate shadow offset
     float offsetX = cellsize/16.0;
     float offsetY = cellsize/16.0;
     
     
      for( int i=0; i<num; i++) { 
          for(int j=0; j<num; j++) { 
            int flag=(int) random(11);
            int randomX=(int) random(35);
            int randomY=(int) random(35);
            
            if (flag%5==0){
            
            fill(140,180);//shadow
            float shiftX = (float) random (-100,100);
            float shiftY = (float) random(-100,100);
            rect(gap * (i+1) + cellsize * i + offsetX + randomX, gap * (j+1) + cellsize * j + offsetY + randomY, cellsize, cellsize);
            }
             else{
            
            
           fill( random(255), random(255), random(255), random(255)); // rectangle
            rect(gap * (i + 1) + (cellsize * i)+randomX, gap * (j+1) + (cellsize *j) +randomY, cellsize, cellsize);            
             }
          }
          
          // save your drawing when you press keyboard 's'
 // if (keyPressed == true && key=='s') {
    
  }
  
     //if(keyPressed == true && key == 's'){
      // saveFrame("25square####.jpg");
     //}
       // erase your drawing when you press keyboard 'r'
 
  }
      
        



