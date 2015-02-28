
float i = 0; //hey playgramming! this is a VARIABLE used to control the rotation

void draw(){ //this entire section loops once a frame
 background(0); //this makes the background black and draws over the last square
 i = i + .1; //this is the variable that keeps the rotation going
 translate(50,50); //this puts the rect in the middle of the screen 
 smooth(); //this makes the square look smooth
 fill(255,125,0); // this makes the rect orange
 rotate(i); //this rotates the rect using the variable
 rect(-25,-25,50,50); //this finally draws the rect to screen
}

