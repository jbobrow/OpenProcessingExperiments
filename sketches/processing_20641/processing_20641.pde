
//global variables to describe size
int xsize = 1000;
int ysize = 1000;

//these global variables to describe color  

int rcolor = int(random(0-255));
int gcolor = int(random(0-255));
int bcolor = int(random(0-255));

void setup () {
size (xsize,ysize);               //set the size using global variables
background (255);
smooth ();
noStroke();
}

void draw () {
stroke(0,20);
fill (rcolor, gcolor, bcolor);     //set fill color using global variables
println(rcolor); //print rcolor
}

//this will run when a keyboard key is pressed

void mouseDragged () {
int r = int(random(1,120)); //set a random size value that continually refreshes
fill (rcolor, gcolor, bcolor,random(0,30)); //set a random color
ellipse (mouseX, mouseY, r, r); //use the mouse to draw with and use r variable to determine random size

}
