
void setup () {
  size(420, 400);
background(209, 42, 48);
smooth();
frameRate(30);
}

void draw() {

//ground

fill(118, 6, 10);
rect(0, 330, 420, 80);
fill(255);
text("click on anywhere on the background to make snowflakes appear", 5, 370);
text("click on a key to make them disapear!", 85, 390);

//lower belly
fill(255);
ellipseMode(CENTER);
ellipse(200,300,100,100);

//middle belly
ellipseMode(CENTER);
ellipse(200, 250, 60, 60);

//face 
ellipseMode(CENTER);
ellipse(200, 205, 50, 50);

//smile
noFill();
arc(202, 216, 20, 20, 0.5, PI/1.3);

//left eye
ellipseMode(CENTER);
fill(0);
ellipse(192, 205, 5, 5);

//right eye
ellipseMode(CENTER);
ellipse(215, 205, 5, 5);

//nose
triangle(202, 212, 204, 218, 230, 212);

//left hand points down
line( 130, 280, 175, 240);

//left fingers
line( 130, 280, 120, 284);
line( 130, 280, 122, 294);
line( 130, 280, 129, 294);

//right hand points down
line( 223, 236, 260, 270);

//right fingers
line (261, 270, 260, 280);
line (260, 270, 270, 280);
line (261, 270, 273, 273);

//right hand up
//line(226, 240, 260, 200);

//left hand up
//line( 180, 245, 130, 200);

//belly dot high
fill(0);
ellipseMode(CENTER);
ellipse(208, 240, 7, 7);

//belly dot middle
fill(0);
ellipseMode(CENTER);
ellipse(210, 255, 7, 7);

//belly dot low
fill(0);
ellipseMode(CENTER);
ellipse(208, 270, 7, 7);

//ground
line(0, 330, 161, 330);

}

void mousePressed() {

//snow frakes when mouse is clicked, change colour based on the location of the mouse
fill(mouseX, 0, mouseY);
ellipse (pmouseX, pmouseY, 10, 10);
}

void keyPressed() {
 //when a key is pressed the snowflakes disspear, background returns
background(209, 42, 48);
}

