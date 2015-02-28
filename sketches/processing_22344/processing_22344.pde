
//February 1st, 2011 - Letter F

//global variables to describe size
int xsize = 500;
int ysize = 500;
//these global variables to describe color
int rcolor = 200;
int gcolor = 100;
int bcolor = 150;
void setup () {
size (xsize,ysize); //set the size using global variables
background (0);
smooth ();
}
void draw () {
fill (rcolor, gcolor, bcolor); //set fill color using global variables
println(rcolor); //print rcolor

}
//this will run when a keyboard key is pressed
void keyPressed () {
int r = int(random(10, 30)); //set a random size value that continually refreshes
// is w is pressed, draw this
if (key == 'w') {
stroke (0, 30);
fill (random(250,255), random(5,10), random(80, 200), 80); //set a random color
ellipse (mouseX, mouseY, r, r); //use the mouse to draw with and use r variable to determine random size
fill (random(255), random(255), random(255));
ellipse (mouseX + random (-20, 20), mouseY + random (-30, 30), r/2, r/2);

}

//if s is pressed, save a frame
if (key =='s') {
saveFrame();
}
}

