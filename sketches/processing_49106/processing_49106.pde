
void setup () {
size(640,480);
background(255);
smooth();
}

void draw() {
  background(255);
//Harry's Body
noStroke();
fill(171,101,13);
ellipseMode(CENTER);
ellipse(mouseX, mouseY,40,40);

//Harry's Left Horn
stroke(249,218,216);
strokeWeight(4);
line(mouseX-15,mouseY-50,mouseX-9,mouseY-42);

//Harry's Right Horn
stroke(249,218,216);
strokeWeight(4);
line(mouseX+15,mouseY-50,mouseX+9,mouseY-42);

//Harry's Head
noStroke();
fill(171,101,13);
ellipseMode(CENTER);
ellipse(mouseX,mouseY-28,30,30);

//Harry's Left Eye
noStroke();
fill(255);
ellipseMode(CENTER);
ellipse(mouseX-5,mouseY-28,5,5);

//Harry's Right Eye
noStroke();
fill(255);
ellipseMode(CENTER);
ellipse(mouseX+5,mouseY-28,5,5);

//Harry's Nose
noStroke();
fill(249,218,216);
ellipseMode(CENTER);
ellipse(mouseX,mouseY-22,8,4);

//Harry's Left Foot
noStroke();
fill(171,101,13);
ellipseMode(CENTER);
ellipse(mouseX-10,mouseY+19,18,6);

//Harry's Right Foot
noStroke();
fill(171,101,13);
ellipseMode(CENTER);
ellipse(mouseX+10,mouseY+19,18,6);
}






