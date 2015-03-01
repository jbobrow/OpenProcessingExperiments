
/*
 * Code by Danae Papazymouri
 * Creating squares whose place and colour changes every time
 */

void setup() {
  size(600,600);
  rectMode(CORNER);
  noStroke();
  
  randomSeed(hour()+minute()+second()+millis());
  random (5);
  float arb = random(-5,5);
}


void draw() {

  background(255); // clear the screen to grey
  
  float arb3 = random(-5,5);
  float arb4 = random(-3,3);  
 {
  int num = 5;   // select a random number of squares each frame
  int gap = (int) random(arb3, arb4); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = 100;
  float collumn = ( width - (num + 1) * arb4 ) / (float)num;
  // print out the size of each square
  println("collumn = " + collumn);
  
  

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        float arb = random(-0.25,0.25); 
        float arb1 = random(-5,5);
        float colour = random (0,6);
        if (colour<=4){
           fill(163, 218, 217, 210);
        }
        else{
          fill(173, 68, 36, 210);
        }
        
       
        // rectangle
        rect(arb1 * (i+ arb ) + collumn * i, arb1 * (j+arb) + collumn * j, cellsize, cellsize);
        noLoop();
        }
    }
   
 
 } 
if (keyPressed == true && key=='t') {
    saveFrame("yourName.jpg");
  }

} //end of draw 
        
          void mousePressed(){
            loop();
          }
          
          
          
            
            


