
//sets up things that only occur once
void setup() {
  //sets size of sketch
  size(720, 540);
  //sets background in RGB
  background(25, 178, 146);
  //ends curly bracket for void setup
}

//sets up things that draw continuously 
void draw() {
  //sets fill color in RGB
  fill(118, 90, 55);
  //sets stroke to none
  noStroke();
  //makes a for loop starting with i = 30, when i is less than or equal to 210, updating i to add 60 each loop
  for (int i = 30; i <= 210; i = i+60) {
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(30, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(90, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(150, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(210, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(270, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(330, i, 50, 50);
    //ends curly bracket for the for loop
  }
  //makes a for loop starting with i = 330, when i is less than or equal to 210 and less than 540, updating i to add 60 each loop
  for (int i = 330; i >210 & i<540; i = i+60) {
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(390, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(450, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(510, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(570, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(630, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(690, i, 50, 50);
    //ends curly bracket for the for loop
  }
  //ends curly bracket for void draw
}



