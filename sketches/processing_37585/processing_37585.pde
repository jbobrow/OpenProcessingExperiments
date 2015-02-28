

void setup () {
size(420, 400);
background(209, 42, 48);
smooth();
frameRate(30);
}

void draw() {
background(mouseX, 42, mouseY);
//ground

fill(118, 6, 10);
rect(0, 330, 420, 80);
fill(255);
text("drag the mouse to check out my moves!", 35, 350);


//lower belly
fill(255);
ellipseMode(CENTER);
ellipse(mouseX,mouseY,100,100);

//middle belly
ellipseMode(CENTER);
ellipse(mouseX, mouseY-50, 60, 60);

//face 
ellipseMode(CENTER);
ellipse(mouseX, mouseY-95, 50, 50);

//smile
noFill();
arc(mouseX+2, mouseY-84, 20, 20, 0.5, PI/1.3);

//left eye
ellipseMode(CENTER);
fill(0);
ellipse(pmouseX-8, pmouseY-95, 5, 5);

//right eye
ellipseMode(CENTER);
ellipse(pmouseX+15, pmouseY-95, 5, 5);

//nose
triangle(mouseX+2, mouseY-88, mouseX+4, mouseY-82, mouseX+30, mouseY-88);

//left hand points down
line( mouseX-70, mouseY-20, pmouseX-25, pmouseY-60);

//left fingers
line( mouseX-70, mouseY-20, pmouseX-80, pmouseY-26);
line( mouseX-70, mouseY-20, pmouseX-78, pmouseY-6);
line( mouseX-70, mouseY-20, pmouseX-69, pmouseY-6);

//right hand points down
line( mouseX+23, mouseY-64, pmouseX+60, pmouseY-30);

//right fingers
line (mouseX+61, mouseY-30, pmouseX+60, pmouseY-20);
line (mouseX+61, mouseY-30, pmouseX+70, pmouseY-20);
line (mouseX+61, mouseY-30, pmouseX+73, pmouseY-27);

//right hand up
//line(226, 240, 260, 200);

//left hand up
//line( 180, 245, 130, 200);

//belly dot high
fill(0);
ellipseMode(CENTER);
ellipse(mouseX+8, mouseY-60, 7, 7);

//belly dot middle
fill(0);
ellipseMode(CENTER);
ellipse(mouseX+10, mouseY-45, 7, 7);

//belly dot low
fill(0);
ellipseMode(CENTER);
ellipse(mouseX+8, mouseY-30, 7, 7);

//ground
//line(0, 330, 161, 330);

}





