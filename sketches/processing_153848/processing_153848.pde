
/*
*Creative Coding
*Week2, Vera Molnar's "squers" variation
*Darko Ilic
*
*/


void setup() {
  
size(500, 500);
rectMode(CORNER);
noStroke();
noFill();
randomSeed(day() + hour() + second()+ millis());     
frameRate(5);  //set the frame rate to 1 draw() calls per second

}

void draw() {
  
  background(224);                
     
  int num = 10; //select  a random number of square in each raw, in each frame
  int gap = 1;  //select a random gap between each square
  float r = 0;
  
  float cellsize = ( width - (num+1)*gap ) / (float)num;   // calculate the size of each square for the given number of squares and gap between them  
  
  for(int i=0; i<num; i++) {
     for (int j=0; j<num; j++) {      
       r = random(1);
       gap = (int) random(-1,5);
        
       if(r < 0.8) 
       {
         stroke(148,193,98);
         fill(230,230,0,150);
       } else 
       {
         fill(255,255,150,220);         
       }     
       rect(gap* (i+1) + cellsize*i, gap*(j+1) + cellsize * j, cellsize, cellsize,5,5,5,5);
       
       //print out the size of each square
       println("cellsize = " + cellsize);
       println("gap = " + gap);
         
     } //end of j     
   } // end of i  
} //end of draw





