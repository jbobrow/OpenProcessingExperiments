
/*Avant-garde "Matthew G-Cube"
by Daniel Jovanov, 23 Jan 2013

Form Matthew G. into a GameCube logo
*/

//PImage dude;
void setup() {
  size(800,800);
  //dude = loadImage("Matthew_G(800X800).jpg");
  //image(dude, 0, 0, 30, 30);  
} // setup()
/*
// Want to make some sort of grid that is good for making a
// GameCube logo-style sketch

//22 Jan
void gridBlunt() {
  stroke(120,0,255); // purple, not magenta
  // left to right
  // horizontal
  for (int i = 0; i < 800; i += 200) {
    line(i,0,i+800,800);
  }
  // vertical
  for (int i = 200; i < 800; i += 200) {
    line(0,i,800,i+800);
  }
  
  // right to left
  // horizontal
  for (int i = 800; i > 0; i -= 200) {
    line(i,0,i-800,800);
  }
  //vertical
  for (int i = 200; i < 800; i += 200) {
    line(800,i,0,i+800);
  }
} // gridBlunt()

// Afterward, I need to refine this grid to help me add more detail.
void gridFine() {
  // left to right
  // horizontal
  for (int i = 100; i < 800; i += 200) {
    line(i,0,i+800,800);
  }
  // vertical
  for (int i = 100; i < 800; i += 200) {
    line(0,i,800,i+800);
  }
  
  // right to left
  // horizontal
  for (int i = 700; i > 0; i -= 200) {
    line(i,0,i-800,800);
  }
  //vertical
  for (int i = 100; i < 800; i += 200) {
    line(800,i,0,i+800);
  }
} // gridFine()
*/
// Need to combine coloring and drawing quads in one step.
// So I recycle a function I made from the first project!
void drawQuad(int r, int g, int b, int x1, int y1, int x2, int y2,
              int x3, int y3, int x4, int y4) {
  noStroke();
  fill(r,g,b);
  quad(x1,y1,x2,y2,x3,y3,x4,y4);
} // drawQuad()
// Need to combine coloring and drawing triangles in one step.
void drawTriangle(int r, int g, int b, int x1, int y1, int x2,
                  int y2, int x3, int y3) {
  noStroke();
  fill(r,g,b);
  triangle(x1,y1,x2,y2,x3,y3);
} // drawTriangle()

// Let's get crazy...
void draw() {
  background(255);
  // framework
  //image(dude, 0, 0);
  //gridBlunt();
  //gridFine();
  
  // first, add a neck that is drawn "behind" other quads
  drawQuad(180,120,0,200,600,200,800,600,800,600,600);
  
  // forming the outline of head
  //stroke(0,0,0);
  // top
  line(400,0,100,300);
  line(100,300,100,500); // vertical line
  // jaw
  line(100,500,400,800);
  line(400,800,700,500);
  //wrapping up
  line(700,500,700,300); // vertical line
  line(700,300,400,0);
  
  // inner framework of head
  line(400,200,200,400);
  // sides to jaw
  line(200,400,200,600);
  line(600,400,600,600);
  // "hair"
  line(600,400,500,500);
  line(500,500,400,400);
  line(400,400,500,300);
  // wrapping up
  line(500,300,400,200);
  
  
  
  // Coloring
  drawQuad(0,0,0,400,0,350,50,400,100,450,50);
  // It would be wise for me to use a for loops to do the coloring
  // for me. Even so, Thomas Edison said that genius is 1% inspir-
  // ation and 99% perspiration...
  
  // Since I cannot add multiple variables in one for loop like in
  // C++, I have to bring those other variables outside the 
  // for loop.
  int j = 50; // used for y-coordinates
  int k = 24; // used for the color red
  int l = 51; // used for the color blue
  for (int i = 350; i > 100; i -= 50) { // top to left of head
    drawQuad(k,0,l,i,j,i-50,j+50,i,j+100,i+50,j+50); // from black to purple
    j += 50;
    k += 24;
    l += 51;
  } // SIX NEW COLORS
  // TOTAL COLORS: 6
  
  j = 100; // start from below the topmost black square
  l = 51; // revert to original color value
  for (int i = 400; i > 150; i -= 50) { // below the above's colored line
    drawQuad(l,0,l,i,j,i-50,j+50,i,j+100,i+50,j+50); // from dark purple to pink
    j += 50;
    l += 51;
  } // FIVE NEW COLORS
    // TOTAL COLORS: 11
  
  // left "sideburn"
  drawQuad(120,60,138,150,350,100,400,150,450,200,400);  
  drawTriangle(120,30,192,100,300,150,350,100,400);
  drawQuad(120,82,142,150,450,100,500,150,550,200,500);
  drawTriangle(120,72,140,100,400,150,450,100,500);
  drawTriangle(120,120,120,200,500,200,600,150,550);
  drawTriangle(120,72,140,200,400,150,450,200,500);
  // SIX NEW COLORS
  // TOTAL COLORS: 17
  
  j = 50; // starting at top y-coordinate again
  k = 25;
  l = 25; // starting at low blue color again
  for (int i = 450; i < 700; i += 50) { // top to right of head
    drawQuad(k,0,l,i,j,i-50,j+50,i,j+100,i+50,j+50); // from very dark purple to blue
    j += 50;
    //k += 25;
    l += 25;
  } // FIVE NEW COLORS
    // TOTAL COLORS: 22
    
  j = 150; // new starting y-coordinate
  k = 38; // new Red value
  l = 25; // starting at low blue color again
  for (int i = 450; i < 700; i += 50) { // just below the above loop
    drawQuad(k,0,l,i,j,i-50,j+50,i,j+100,i+50,j+50); // from slightly less dark purple to indigo
    j += 50;
    //k += 25;
    l += 25;
  } // FIVE NEW COLORS
    // TOTAL COLORS: 27
    
  // right "sideburn"
  drawTriangle(30,0,150,700,300,650,350,700,400);
  drawTriangle(32,0,130,700,400,650,450,700,500);
  drawTriangle(90,60,120,600,400,650,450,600,500);
  drawQuad(105,90,120,650,450,600,500,650,550,700,500);
  drawTriangle(120,120,120,600,500,650,550,600,600);
  // FOUR NEW COLORS
  // TOTAL COLORS: 30 -- minimum met! Don't neeed to count anymore.
  
  
  
  // Color the "face" yellow
  // top
  drawQuad(255,255,0,400,200,350,250,400,300,450,250);
  drawQuad(255,255,0,400,300,350,350,400,400,450,350); 
  // sides of top
  drawQuad(255,255,0,450,250,400,300,450,350,500,300);
  drawQuad(255,180,0,500,300,450,350,500,400,550,350); // orange
  drawQuad(255,180,0,550,350,500,400,550,450,600,400); // orange
  
  drawQuad(255,255,0,350,250,300,300,350,350,400,300);
  drawQuad(0,255,120,300,300,250,350,300,400,350,350); // green
  drawQuad(0,255,120,250,350,200,400,250,450,300,400); // green
  // sides below above
  drawQuad(255,180,0,450,350,400,400,450,450,500,400); // orange
  drawQuad(255,180,0,500,400,450,450,500,500,550,450); // orange
  //drawQuad(255,255,0,550,450,500,500,550,550,600,500);
  
  drawQuad(0,255,120,350,350,300,400,350,450,400,400); // green
  drawQuad(0,255,120,300,400,250,450,300,500,350,450); // green
  drawQuad(255,255,0,250,450,200,500,250,550,300,500);
  
  drawQuad(255,255,0,400,400,350,450,400,500,450,450);
  //drawQuad(255,255,0,350,450,300,500,350,550,400,500);
  drawQuad(255,255,0,300,500,250,550,300,600,350,550);
  
  //drawQuad(255,255,0,450,350,400,400,450,450,500,400);
  //drawQuad(255,255,0,500,400,450,450,500,500,550,450);
  drawQuad(255,255,0,550,450,500,500,550,550,600,500);
  
  //drawQuad(255,255,0,450,450,400,500,450,550,500,500);
  drawQuad(255,255,0,500,500,450,550,500,600,550,550);
  drawQuad(255,255,0,250,550,200,600,250,650,300,600);
  drawQuad(255,255,0,550,550,500,600,550,650,600,600);
  
  drawQuad(255,255,0,400,500,350,550,400,600,450,550);
  //drawQuad(255,255,0,450,550,400,600,450,650,500,600);
  //drawQuad(255,255,0,500,600,450,650,500,700,550,650);
  //drawQuad(255,255,0,350,550,300,600,350,650,400,600);
  //drawQuad(255,255,0,300,600,250,650,300,700,350,650);
  // grand finale...
  //drawQuad(255,255,0,400,600,350,650,400,700,450,650);
  drawQuad(255,255,0,350,650,300,700,350,750,400,700);
  drawQuad(255,255,0,450,650,400,700,450,750,500,700);
  drawQuad(255,255,0,400,700,350,750,400,800,450,750);
  // don't forget the triangles...
  //drawTriangle(255,255,0,200,400,200,500,250,450);
  //drawTriangle(255,255,0,200,500,200,600,250,550);
  //drawTriangle(255,255,0,600,400,600,500,550,450);
  //drawTriangle(255,255,0,600,500,600,600,550,550);
  // end face-coloring
  
  
  
  // eyes--to be drawn on the non-yellow parts of face
  drawQuad(180,120,0,250,350,350,350,350,450,250,450); // light-brown
  drawQuad(180,120,0,450,350,550,350,550,450,450,450); // light-brown
  // want to make multiple squares as pupils
  // left pupil
  int p = 2;
  int r = 180; // current "red" value
  int g = 120; // current "green" value
  int x = 275; // starting x-coordinate
  int y = 375; // starting y-coordinate
  int n = 50; // increment
  for (int i = 1; i < 5; i++) {
    drawQuad(r/p,g/p,0,x,y,x+n,y,x+n,y+n,x,y+n);
    p += p - (p/2); // color is darker as smaller squares are made
    r /= p;
    g /= p;
    n /= 4; // smaller circles
    x += n;
    y += n;
  }
  // right pupil
  // reset values
  p = 2;
  r = 180;
  g = 120;
  x = 475; // new x-coordinate
  y = 375;
  n = 50;
  for (int i = 1; i < 5; i++) {
    drawQuad(r/p,g/p,0,x,y,x+n,y,x+n,y+n,x,y+n);
    p += p - (p/2);
    r /= p;
    g/= p;
    n /= 4;
    x += n;
    y += n;
  }
  
  
  // lips
  drawQuad(180,0,120,400,600,350,650,400,700,450,650); // magenta
  drawQuad(180,0,120,350,550,300,600,350,650,400,600);
  drawQuad(180,0,120,450,550,400,600,450,650,500,600);
  drawQuad(180,0,120,500,600,450,650,500,700,550,650);
  drawQuad(180,0,120,300,600,250,650,300,700,350,650);
  
  // nostrils
  drawQuad(0,0,0,450,450,400,500,450,550,500,500);
  drawQuad(0,0,0,350,450,300,500,350,550,400,500);
  
  // ears
  drawTriangle(180,120,0,600,500,600,600,550,550);
  drawTriangle(180,120,0,200,500,200,600,250,550);
  
  // adding more "hair"
  drawQuad(0,0,0,300,0,250,50,300,100,350,50);
  drawQuad(0,0,0,250,50,200,100,250,150,300,100);
  drawQuad(0,0,0,200,100,150,150,200,200,250,150);
  drawQuad(0,0,0,150,150,100,200,150,250,200,200);
  
  drawQuad(0,0,0,500,0,450,50,500,100,550,50);
  drawQuad(0,0,0,550,50,500,100,550,150,600,100);
  drawQuad(0,0,0,600,100,550,150,600,200,650,150);
  drawQuad(0,0,0,650,150,600,200,650,250,700,200);
  
  // extra "sideburns"
  drawTriangle(0,0,0,600,400,600,500,550,450);
  drawTriangle(0,0,0,200,400,200,500,250,450);
  
  //for (int i = 0; i < 80; i++) {
    //ellipse(random(mouseX - 50, mouseX + 50), mouseY, random(60, 20), random(60,20));
  //}
} // draw()
// End of file


