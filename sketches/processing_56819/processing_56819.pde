
int x = 500; // x-coordinate
int y = 600; // y-coordinate
int radius = 300; // bulb radius
int fs = 50; // floating seed radius
int triHeight = y+350; //base petal height
PFont fatcat;

void setup (){
  size (1100, 1100);
  smooth ();
  background (0);
  fatcat = loadFont ("FatCat-48.vlw");
  textFont (fatcat);
  
}

void draw(){
  background (0);
  strokeWeight (1);
  stroke (0);


//flower bulb base
ellipseMode (CENTER);
fill (255);
ellipse (x +50, y +100, radius, radius);
fill (175);
ellipse (x +50, y +200, radius - 200, radius -200);
fill (0);
ellipse (x +50, y +200, radius -250, radius-250);


//text
  float r = random (0, 74);
  float g = random (0, 64);
  float b = random (0, 255);
  fill (r, g, b); 
text ("grow up", 445, 1050);

//flower stalk + base
stroke (255);
line (x+50, y+250, x+50, y+400); //stalk
fill (255);
triangle (x, y+400, x + 50, y+400, x, triHeight); // left base petal
fill (255);
triangle (x +100, y + 400, x+100, triHeight, x+50, y+400);//right base petal


//upright base triangles
stroke (0);
fill (175);
triangle (x - 100, y+100, x, y+100, x-50, y);
fill (0);
triangle (x, y +100, x+100, y+100, x+50, y-50);
fill (175);
triangle (x+100, y+100, x+200, y+100, x+150, y);


//exterior petals
stroke (0);
//left
fill (100);
triangle (x-400, y, x-300, y-100, x-100, y+100);
fill (175);
triangle (x-300, y-250, x-100, y+100, x-350, y-150);
//right
fill (100);
triangle (x+200, y+100, x+500, y, x+400, y-100);
fill (175);
triangle (x+200, y+100, x+450, y-150, x+400, y-250);


//centre diamond
fill (255);
quad (x+50, y-400, x+100, y-350, x+50, y-50, x, y-350);


//quad petals
//left
fill (240);
quad (x-250, y-150, x-200, y-250, x-50, y, x-100, y+100);
//right
fill (240);
quad (x+300, y-250, x+350, y-150, x+200, y+100, x+150, y);


//inner triangles
fill (100);
triangle (x, y+100, x+50, y-50, x-200, y-250);
triangle (x +100, y+100, x+50, y-50, x+300, y-250);
fill(0);
triangle (x+50, y-50, x, y-350, x-100, y-170);
triangle (x+50, y-50, x+100, y-350, x+200, y-170);


//top triangles
fill (175);
triangle (x-100, y-170, x-100, y-300, x, y-350);
triangle (x+100, y-350, x+200, y-300, x+200, y-170);
fill (240);
triangle (x, y-350, x-100, y-300, x-100, y-400);
triangle (x+100, y-350, x+200, y-400, x+200, y-300);


//floating seeds
ellipse (x-400, y-200, fs, fs);
ellipse (x+500, y-200, fs, fs);
ellipse (x-150, y-450, fs, fs);
ellipse (x +250, y-450, fs, fs);

fill (175);
ellipse (x-300, y-350, fs+50, fs+50);
fill (0);
ellipse (x-300, y-350, fs, fs);

fill (175);
ellipse (x+50, y-500, fs+50, fs+50);
fill (0);
ellipse (x+50, y-500, fs, fs);
fill (240);
ellipse (x+50, y-500, fs-25, fs-25);

fill (175);
ellipse (x+400, y-350, fs+50, fs+50);
fill(0);
ellipse (x+400, y-350, fs, fs);



  int xwc=mouseX; // also 500
  int ywc=mouseY; // also 500
  
  
// watering can
  noStroke();
  fill (20, 64, 255);  
rect (xwc-350, ywc+300, 100, 100);
triangle (xwc-250, ywc+300, xwc-150, ywc+300, xwc-250, ywc+350);
noFill ();
strokeWeight (4);
stroke (20, 64, 255);
ellipseMode (CENTER);
ellipse (xwc-298, ywc+300, 100, 100);


//water
//mouse click
  if (mousePressed == true) {
   
for (int ax = mouseX; ax <= height; ax += 40) {
for (int by = mouseY; by <= width; by += 40) {
  fill (0, 175, 231, 100);
  noStroke();
  triangle (xwc-150, ywc +300, xwc+50, ywc+400, xwc-100, ywc+500);
}
}
}
}

