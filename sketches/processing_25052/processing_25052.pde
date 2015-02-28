
int xsize = 700;
int ysize = 800;
//these global variables to describe color
int rcolor = 200;
int gcolor = 100;
int bcolor = 150;
void setup () {
size (xsize,ysize); //set the size using global variables
background (138,217,5);
smooth ();
}
void draw () {
fill (rcolor, gcolor, bcolor); //set fill color using global variables
println(rcolor); //print rcolor
}
//this will run when a keyboard key is pressed
void keyPressed () {
int r = int(random(10, 20)); //set a random size value that continually refreshes
// is w is pressed, draw this
if (key == 'w') {
  noStroke();
fill (random(255), random(255), random(255));
ellipse (mouseX + random (-30, 30), mouseY + random (-40, 40), 35, 35);
}

//if s is pressed, save a frame
if (key =='s') {
saveFrame();
}
}
    
                                                                                
