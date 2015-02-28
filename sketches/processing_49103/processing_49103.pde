
/*
float circleFill = 0;
float change = .5;
*/
void setup() {
  //set size of window
  size(640,480); // Set the size of the window
}

void draw() {
  //draw the background color black
  background(0); // set the background black
  println();
  smooth();

//set ellipses and rectangles TO CENTER AND CORNERS
ellipseMode(CENTER); 
rectMode(CENTER);

/*
//draw bounding box
stroke(255);
noFill();
rect(320,240,100,100);
*/

//draw figo's body
stroke(0,255,100);
strokeWeight(2);
//color body
if (mouseX < 320 && mouseY <240) {
  fill(0,255,100);
  stroke (0,255,100);
} else if (mouseX < 320 && mouseY > 240) {
  fill (230,30,120);
  stroke (230,30,120);
}else if (mouseX > 320 && mouseY < 240) {
  fill (28,213,232);
  stroke (28,213,232);
}else if (mouseX > 320 && mouseY> 240) {
  fill (250,197,13);  
  stroke (250,197,13); 
}
ellipse(mouseX,mouseY,60,60);
/*
//make him color change
fill(circleFill);

circleFill=circleFill+change;
*/


//draw figos hair
stroke(0,255,0);
fill(0,255,0);
//color hat
if (mouseX < 320 && mouseY <240) {
  fill (28,213,232);
  stroke (28,213,232);
} else if (mouseX < 320 && mouseY > 240) {
  fill(0,255,100);
  stroke (0,255,100);
}else if (mouseX > 320 && mouseY < 240) {
  fill (250,197,13);  
  stroke (250,197,13); 
}else if (mouseX > 320 && mouseY> 240) {
  fill (230,30,120);
  stroke (230,30,120);
}
triangle(mouseX-5,mouseY-30,mouseX,mouseY-45,mouseX+5,mouseY-30);

//draw figo's eyes
stroke(255);
strokeWeight(2);
fill(255);
line(mouseX-10,mouseY-5,mouseX-10,mouseY);
line(mouseX+10,mouseY-5,mouseX+10,mouseY);

//draw figo's mouth
noStroke();
strokeWeight(2);
fill(255);
/*
ellipse(mouseX,mouseY+15,10,12);*/

arc(mouseX,mouseY+10,10,12,0,PI);

//draw figo's arms
stroke(255);
strokeWeight(2);

//option1
/*
line(mouseX-30,mouseY-5,mouseX-30,mouseY-5);
line(mouseX+30,mouseY-5,mouseX+45,mouseY-15);
*/

//other option static ends
line(mouseX-30,mouseY-5,275,225);
line(mouseX+30,mouseY-5,365,225);


//draw figo's hands
noStroke();
fill(255);

// option1
/*
ellipse(mouseX-45,mouseY-15,5,5);
ellipse(mouseX+45,mouseY-15,5,5);
*/

//other option static hands

ellipse(275,225,5,5);
ellipse(365,225,5,5);


//draw figo's legs
stroke(255);
strokeWeight(2);
line(mouseX-10,mouseY+30,mouseX-10,mouseY+42);
line(mouseX+10,mouseY+30,mouseX+10,mouseY+42);

//draw figo's feet
noStroke();
fill(255);
ellipse(mouseX-10,mouseY+42,8,6);
ellipse(mouseX+10,mouseY+42,8,6);
}

void critter(int x, int y) {
  stroke(255);
  line(x-5,y-40,x,y-60);
  line(x+5,y-40,x,y-60);
}

