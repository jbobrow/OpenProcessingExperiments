
void setup(){
  background(255,255,255);
  size(500,500);
  board(); //here this board will be a static image, the full sudoku board
}
color tinto = color(255,255,255);
void board(){//this draws the entire shebang with cell arrays and lines for 
 cellarray(25,25,25,tinto); //the sudoku board w/ grey alternates
 sudokulines(-75,0);//and the lines
}

void cell(int x, int y, int s, color tinto){ //creates a single box
  fill(tinto); //color of box
  rect(x,y,s,s); //box is essentially a square because of equal height and width
}

void triple (int x, int y, int s, color tinto){ //creates a row of three squares
  for (int i = 0; i < 3; i = i +1) {
    cell(x, y, s, tinto);
    x += s; //this allows the box to stack next to each other up until 3 cells
  }
}

void block(int x, int y, int s, color tinto) { //this makes three triples, or a 3x3 cell
for (int i = 0; i < 3; i++) {
  triple (x,y,s,tinto);
  y += s; //now the triple can stack down on each other, creating a 3x3
}
}

void row(int x, int y, int s, color tinto) { //now we'll have a row of 3x3 cells
for (int i = 0; i <3; i++) {
  block(x,y,s,tinto);
  x += (s*3); //i multiply by 3 because the starting point is moving ahead by 3 cells, not 1 cell as we did in previous functions
    if (tinto == color(180,180,180)) {
      tinto = color(255,255,255); //this is going to alternative the 3x3 by column
    } else {
      tinto = color(180,180,180);
    }
}
}

void cellarray(int x, int y, int s, color tinto) { //this one is going to bring the row down 3 times so it'll create a 3x3 block of 3x3 cells
  for (int i = 0; i <3; i++){
    row (x,y,s,tinto);
    y+=(s*3); //now, the starting cell point is going to go down by it's side times three
    if (tinto == color(180,180,180)) {
      tinto = color(255,255,255);
    }
    else {
      tinto = color (180,180,180);
    }
  }
}
void vertblock(float x, float y){
  rect(100.5+x,50+y,1.5,225);
}
void horizblock(float x, float y){
  rect(25+x, 100.5+y,225,1.5);
}
void sudokulines(float x, float y){
  fill(0,0,0);
  vertblock(0,-25);
  vertblock(75,-25);
  horizblock(0,0);
  horizblock(0,75);
}

void draw() {
  int sudokuboxX, sudokuboxY;
  int s;
  s = 25; //for simplicity, the size of the cells 25
  sudokuboxX = mouseX / s; //so whatever the x coordinate of my mouse will divide by 25, the cell size
  sudokuboxY = mouseY / s; //and the y coordinates of my mouse will be divided by cell size
  if (mousePressed) { //once i press the mouse
    fill(255,0,0); //will be colored red
    ellipse((s * sudokuboxX) + (s/2), (s*sudokuboxY) + (s/2), (s/4), (s/4));
  //ellipse details
  //1st parameter: size * sudokuboxX: the 's' will cancel out, leaving only Mousex position + x position 25/2
 // 2nd parameter: size * sudokuboxY: the 's' will cancel out, leaving only MouseY position + y position 25/2
   // **so this means for x and y coordinates to be both (25/2,25/2), the ellipse will appear precisely at the center of the cell no matter where the mousepress is on the cell
   // 3rd & 4th parameter are the width and height of ellipse, respectively
  }
  
}


