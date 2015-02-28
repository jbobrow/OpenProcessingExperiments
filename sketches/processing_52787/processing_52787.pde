
//Pac-Man Without Obstacles - Part 1
//Tracy Carlin
//Feb. 16, 2012
color pMFever = #FEFF0A; //yellow
float x = 400;
float y = 300;
void setup() {
  size(800, 600);
}

void draw() {
  background(255);
  makeball();
  if (keyPressed) {
    if ((key == 'w') && (y>25)) { //w moves Pac Man up (not too high)
      y = y-3;
    } 
    else if ((key == 'a') && (x>25)) { // a moves PacMan left (not too left)
      x = x-3;
    } 
    else if ((key == 's') && (y<height-25)) { //s moves Pacman down (not too low)
      y = y+3;
    } 
    else if ((key == 'd') && (x<=width-25)) { //d moves Pacman right (not too right)
      x = x+3;
    } //else if ((y<25) || (x<25) ||  (y<height-25) || (x<=width-25)) {
      
    //}
}
}
void makeball() {
  fill(pMFever);
  ellipse(x, y, 50, 50);
  fill(0);
  ellipse (x+10, y-12, 10, 10); //Pacman body
  line (x-2, y+2, x+25, y-5); //upper line of mouth
  line(x-2, y+2, x+10, y+22); //lower line of mouth
  smooth();
}


