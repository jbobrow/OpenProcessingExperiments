
void setup() {
  size(400, 400);
  rectMode(CORNER);
  noStroke();
  frameRate(.4);

}

void draw() {

  background(180); // clear the screen to grey
  
  

  
  int num = (int) 5;   // select a random number of squares each frame
  int gap = (int) 6; // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
 
  

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        
        if (random(20) > 15){
        fill (255, 0, 0);
      } else {
        fill(142, 54, 54, 200);
     }
       
        rect(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize);
      
    }
    }
}
    

