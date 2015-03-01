
//set the stage
void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(2);  
}

void draw() {

  background(255); // set the screen
  
  int gap = (int) random(5, 15); // select a random gap between each square
  int num = (int) 5;   // set 5 squares
  int cellsize = 100;
  color uno = color(204, 153, 0);
  color dos = color(153, 51, 0);
  
  // calculate shadow offset
  float offsetX = cellsize/random (10, 18);
  float offsetY = cellsize/random (12, 18);
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        // sombra
        fill(uno); 
        rect(gap * (i) + cellsize * i+1 + offsetX, gap * (j+random (3)) + cellsize * j + offsetY, cellsize, cellsize, 5);

        // rectangle
        fill(dos); 
        rect(gap * (i+1) + cellsize * i, gap * (j+random (2)) + cellsize * j, cellsize, cellsize, 5);
      }
    }
    
     // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("25sq.jpg");
  }

} //end of draw 
