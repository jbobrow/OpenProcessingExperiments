
int xsize = 500;
int ysize = 500;

void setup () {
size (xsize,ysize);
background (255);
smooth ();
}

void draw () {

}

//buttons

void keyPressed () {

int r = int(random(10, 20)); //set a random size value that continually refreshes

// if w is pressed, draw this

if (key == 'w') {
  rectMode(CENTER);
stroke (0, 100);
fill (random(0,255), random(10, 100), random(10, 150),50); //set a random color
line (mouseX-20, mouseY, mouseX+20 , mouseY);
line (mouseX, mouseY-20, mouseX , mouseY+20);
line (mouseX-20, mouseY-20, mouseX+20 , mouseY+20);
line (mouseX+20, mouseY+20, mouseX-20 , mouseY-20);
noStroke();
ellipse (mouseX, mouseY, r , r);
fill (random(0,255), random(0,255), random(0,255), 70);
ellipse (mouseX-20, mouseY+20,r,r);
fill (random(0,255), random(0,255), random(0,255));
rect (mouseX+20, mouseY-20,r,r);

}

//if q is pressed, draw this
if (key == 'q') {
noStroke();
fill (random(255), random(255), random(255)); //set a random color
ellipse (mouseX, mouseY, r, r);
stroke(1);
line (mouseX, mouseY, mouseX+50, mouseY);
rect (mouseX+50, mouseY, r, r);
}

//if e is pressed, draw this
stroke (1);
if (key == 'e') {
fill (random(255), random (200, 250), random(255));
rectMode(CENTER);
rect (mouseX, mouseY, r, r);
line (mouseX, mouseY, mouseX+20, mouseY);
line (mouseX, mouseY, mouseX-20, mouseY);
line (mouseX, mouseY, mouseX, mouseY-20);
line (mouseX, mouseY, mouseX, mouseY+20);
fill (random(255), random (255), random(255));
ellipse (mouseX+25,mouseY,10, 10);
ellipse (mouseX-20,mouseY,10, 10);
ellipse (mouseX,mouseY+20,10, 10);
ellipse (mouseX,mouseY-20,10, 10);
}

//if s is pressed, save a frame
if (key =='s') {
saveFrame();
}
//if c is pressed, change background color to white
if (key =='c'){
  rectMode(CENTER);
  noStroke();
  fill(255);
  rect (xsize/2,ysize/2,xsize,ysize);
   
}
//if b is pressed, change background color to black
if (key =='b'){
  rectMode(CENTER);
  noStroke();
  fill(0);
  rect (xsize/2,ysize/2,xsize,ysize);}


//if n is pressed, change background color to black
if (key =='m'){
  rectMode(CENTER);
  noStroke();
  fill(random(255),random(255),random(255));
  rect (xsize/2,ysize/2,xsize,ysize);
   
}
}

