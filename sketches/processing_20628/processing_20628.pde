
//global variables to describe size
int xsize = 900;
int ysize = 450
;

//these global variables to describe color  

int rcolor = int(random(0-255));
int gcolor = int(random(0-255));
int bcolor = int(random(0-255));

void setup () {
size (xsize,ysize);               //set the size using global variables
background (190);
smooth ();
}

void draw () {
println(rcolor); //print rcolor
}

void keyPressed () {
  if (key =='w'){
  rectMode(CENTER);
  noStroke();
  fill(255);
  rect (xsize/2,ysize/2,xsize,ysize);
  }   
}

  
  
//this will run when a keyboard key is pressed

void mouseDragged () {
int r = int(random(50,100)); //set a random size value that continually refreshes
stroke (0,15);
fill (rcolor, gcolor, bcolor,random(1,2)); //set a random color
ellipse (mouseX, mouseY, r, r); //use the mouse to draw with and use r variable to determine random size



}

