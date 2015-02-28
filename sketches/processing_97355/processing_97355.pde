
//global variables to set the size of the canvas
int xsize = 2000;
int ysize = 2000;
 
//these global variables set colour for circles 
 
int rcolor = int(random(0-255));
int gcolor = int(random(0-255));
int bcolor = int(random(0-255));
 
void setup () 
{
size (xsize,ysize); //set the size using global variables
background (255); //background colour
smooth ();
noStroke(); 
}
 
void draw () 
{
stroke(0,20); // line on circle
fill (rcolor, gcolor, bcolor);//set fill colour using global variables
println(rcolor); //print rcolor
}
 
//this will run when a keyboard key is pressed
 
void mouseDragged () 
{
int r = int(random(1,120)); //set a random size value for circles that continually refreshes
fill (rcolor, gcolor, bcolor,random(0,30)); //set a random colour using global variables
ellipse (mouseX, mouseY, r, r); //use the mouse to draw with and use r variable to determine random size
 
}
