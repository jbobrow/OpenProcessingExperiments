

/* Creative Coding
 * Week 2, 03 - n squares
 * by Milagros Largo
 * 
 *
 * In the next iteration of the square drawing sketch, this version selects a random number of squares
 * and a random gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops.
 *
 * A simple drop shadow is also drawn to give the illusion of depth.
 * I have change colours from shapes and backgraound.
 */
int numero =0;

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {
// if numero == 0 backgroundo color is grey, else is blue
if (numero == 0){
  background(180); // clear the screen to grey
  numero = 1;
 }
   else
     {
      background(#07005F);
      numero = 0;
     } 
  int num = (int) random(3, 12);   // select a random number of squares each frame
  int gap = (int) random(5, 50); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
  
   // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("myname.jpg");
  }
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        fill(140, 180); // shadow
        rect(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);

        fill(color(int(random(255)),int(random(255)),int(random(255))));// rectangle in random colors // rectangle
        rect(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
   
} //end of draw 



