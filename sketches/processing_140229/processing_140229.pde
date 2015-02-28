
PShape s;
int x = 250;
int y = 450;
   void setup() {
     size(500, 500);
     textSize(35);
     textAlign(CENTER);
     
      }
 
   void draw() { 
     fill(20, 50, 120,15);
     rect(0, 0, width, height);
     fill(255, 1);
     text("use arrows and mouse", 250, 250);
    if (keyPressed && (key == CODED)) {  // If it’s a coded key
    if (keyCode == LEFT) {
      x--;
    } else if (keyCode == RIGHT) {
      x++;
    } else if (keyCode == UP) {
      y--;
    } else if (keyCode == DOWN) {
      y++;
} 
}

if (mousePressed) {
//robot below
noStroke();
fill(70);
rect(x-45, y-40, 20, 80);
ellipse(x-35, y-40, 20, 20);
ellipse(x-35, y+40, 20, 20);
rect(x+25, y-40, 20, 80);
ellipse(x+35, y-40, 20, 20);
ellipse(x+35, y+40, 20, 20);

fill(90);
rect(x-42.5, y-40, 15, 78);
ellipse(x-35, y-40, 15, 15);
ellipse(x-35, y+40, 15, 15);
rect(x+27.5, y-40, 15, 78);
ellipse(x+35, y-40, 15, 15);
ellipse(x+35, y+40, 15, 15);

fill(110);
rect(x-42.5, y-35, 15, 10);
rect(x-42.5, y+25, 15, 10);
rect(x+27.5, y-35, 15, 10);
rect(x+27.5, y+25, 15, 10);

fill(150);
ellipse(x, y, 80, 80);
fill(180);
ellipse(x, y, 70, 70);

//blue squares
fill(39, 169, 225);
rect(x-5, y-40, 10, 80);
rect(x-40, y-5, 80, 10);
ellipse(x, y, 42, 42);

fill(140);
ellipse(x, y, 40, 40);
fill(100);
ellipse(x, y, 35, 35);

fill(39, 169, 225);
ellipse(x, y, 17, 17);

fill(150);
ellipse(x, y, 15, 15);
ellipse(x+17.5, y, 10, 10); 
ellipse(x-17.5, y, 10, 10); 
ellipse(x, y+17.5, 10, 10); 
ellipse(x, y-17.5, 10, 10);
} else {
  noStroke();
fill(70);
rect(x-45, y-40, 20, 80);
ellipse(x-35, y-40, 20, 20);
ellipse(x-35, y+40, 20, 20);
rect(x+25, y-40, 20, 80);
ellipse(x+35, y-40, 20, 20);
ellipse(x+35, y+40, 20, 20);

fill(90);
rect(x-42.5, y-40, 15, 78);
ellipse(x-35, y-40, 15, 15);
ellipse(x-35, y+40, 15, 15);
rect(x+27.5, y-40, 15, 78);
ellipse(x+35, y-40, 15, 15);
ellipse(x+35, y+40, 15, 15);

fill(110);
rect(x-42.5, y-35, 15, 10);
rect(x-42.5, y+25, 15, 10);
rect(x+27.5, y-35, 15, 10);
rect(x+27.5, y+25, 15, 10);

fill(150);
ellipse(x, y, 80, 80);
fill(180);
ellipse(x, y, 70, 70);
//blue squares
//fill(39, 169, 225);
//rect(x-5, y-40, 10, 80);
//rect(x-40, y-5, 80, 10);
//ellipse(x, y, 42, 42);

fill(140);
ellipse(x, y, 40, 40);
fill(100);
ellipse(x, y, 35, 35);

//fill(39, 169, 225);
//ellipse(x, y, 17, 17);

fill(150);
ellipse(x, y, 15, 15);
ellipse(x+17.5, y, 10, 10); 
ellipse(x-17.5, y, 10, 10); 
ellipse(x, y+17.5, 10, 10); 
ellipse(x, y-17.5, 10, 10);
}
}




