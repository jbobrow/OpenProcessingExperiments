
void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = (int) 5;   // select a random number of squares each frame
  
  
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1)  ) / (float)num;
  
  
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
         int gap = (int) random(10); // select a random gap between each square
         
         float col1=random(50, 150); // colores
         float col2=random(50, 150);
         float col3=random(50, 150);
         
        // print out the size of each square
        println("cellsize = " + cellsize);
        
        if (keyPressed == true && key=='r') { // ejecucion colorida
        col1= random(150, 255); 
        } 
        if (keyPressed == true && key=='g') { 
        col2= random(150, 255); 
        } 
        if (keyPressed == true && key=='b') { 
        col3= random(150, 255); 
        } 
        fill(col1, col2, col3, 180); // rectangle
        rect(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
}
