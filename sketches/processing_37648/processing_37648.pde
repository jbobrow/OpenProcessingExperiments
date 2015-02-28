
PImage r;

void setup () {

r= loadImage ("picnic3.jpg");
noLoop();

  size (800, 600);

}

void draw () {
  
  image (r, 0, 0);
  ant (200, 400, 0);
  ant (300, 450, 100);
  ant(450, 500, 0);
  ant (600, 500, 0);
  ant (700, 500, 160);

  
}

void ant (int x, int y, int redness) {
  
noStroke ();
smooth ();
noLoop ();
fill(redness, 0, 0);

//body
ellipse (x, y, 15, 11);
ellipse (x+13, y+5, 20, 10);
ellipse (x+30, y+5, 25, 12);


//antennae

stroke (0);
strokeWeight (1);
line (x-14, y-11, x-1, y-2);
line (x-2, y-5, x+2, y-16);

//left leg
line ( x+7, y+5, x, y+9);
line (x, y+9, x, y+14);

//right leg 1

line (x+7, y+8, x+15, y+14);
line (x+15, y+14, x+15, y+20);

//right leg 2

line (x+15, y+8, x+26, y+14);
line (x+26, y+14, x+26, y+20);

//right leg 3

line (x+28, y+8, x+38, y+14);
line (x+38, y+14, x+38, y+20);

}

