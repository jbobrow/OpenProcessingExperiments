
int counter;
void setup () {
  smooth ();
  frameRate (10);
  background (0);
  size (1000,750);
}

void draw () {
  noFill ();
stroke (255,random(0,255));

//use a mouse press to run the program

if (mousePressed) {

//use two for loops to fill the pattern
for (int x = 15; x<width; x +=50) {

for (int y = 25; y<height; y+=50) {




stroke (random(0,200),0,20,random(10,200));
ellipse (x+random(1,205), y-random(10,100),x,y); 
triangle (x+random(1,205), y-random(10,100),x,y,x,y); 
line (x,y, x+random(1,250), y-random(1,200));
line (x+random(1,205), y-random(10,100),x,y);  

}
}

}

}


