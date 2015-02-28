
//global variables to describe size
int xsize = 1400;
int ysize = 1000;

//these global variables to describe color  

int rcolor = int(random(0-255));
int gcolor = int(random(0-255));
int bcolor = int(random(0-255));

void setup () {
size (xsize,ysize);               //set the size using global variables
background (50);
noStroke ();
smooth ();
}

void draw () {
println(rcolor); //print rcolor
}

//this will run when a keyboard key is pressed

void mouseDragged () {
int r = int(random(10,60)); //set a random size value that continually refreshes
fill (rcolor, gcolor, bcolor,random(0,0)); //set a random color
stroke(255);
ellipse (mouseX, mouseY, r, r); //use the mouse to draw with and use r variable to determine random size




  stroke(255);
  if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    
  }


}
