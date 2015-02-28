
int x = 1;
int y = 1;
 
void setup() {
size(600,600);

}

void draw() {
background(0);

fill(255);
smooth();
noStroke(); 
rect(x+75,y+50,100,20); //top rect
rect(x+50,y+70,150,30); // row 2 rect
rect(x+30,y+100,190,60); //row 3 rect
rect(x+90,y+160,30,20); //rect 1 left
rect(x+60,y+180,30,20); //rect 2 left
rect(x+30,y+200,30,20); //rect 3 left
rect(x+130,y+160,30,20); //rect 1 right
rect(x+160,y+180,30,20); //rect 2 right
rect(x+190,y+200,30,20); //rect 3 right
 
fill(random(255),random(255),random(255)); //white color
rect(x+75,y+100,30,30); //square eyeball left
rect(x+135,y+100,30,30); //square eyeball right
  
  
 
  if ((keyPressed) && (key == CODED)) {
    if (keyCode == LEFT) {
      fill(random(255),random(255),random(255));
      x--;
    }
    if (keyCode == RIGHT) {
      x++;
    }
    if (keyCode == UP) {
      y--;
    }
    if (keyCode == DOWN) {
      y++;
    }
  }
  if ((keyCode == DOWN) && (keyCode == LEFT)) {
    y++;
    x--;
  }
  if (x == 0) {
    x = width;
  }
  if (x == width + 1) {
    x = 0;
  }
  if (y == height) {
    y = 0;
  }
  if (y == -1) {
    y = height;
  }
 
}
