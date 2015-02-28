
void setup() {
  //window size
size(640, 480);
smooth();
frameRate(30);
}

void draw() {
  //black background
background(0);

//modes
ellipseMode(CENTER);
rectMode(CENTER);

// pooh body
noStroke();
fill(220,150,64);
ellipseMode(CENTER);
ellipse(mouseX,mouseY,50,68);

//pooh ears, arms, legs
noStroke();
fill(220,150,64);
ellipse(mouseX-20,mouseY-53,15,15);
ellipse(mouseX+20,mouseY-53,15,15);
ellipse(mouseX-20,mouseY-15,30,20);
ellipse(mouseX+20,mouseY-15,30,20);
ellipse(mouseX-15,mouseY+24,20,30);
ellipse(mouseX+15,mouseY+24,20,30);

//pooh shirt
noStroke();
fill(232,38,16);
rect(mouseX,mouseY-11,50,27);

// pooh head
noStroke();
fill(220,150,64);
ellipse(mouseX,mouseY-37,48,48);

//pooh eyes
noStroke();
fill(0);
ellipse(mouseX-11,mouseY-40,7,9);
ellipse(mouseX+11,mouseY-40,7,9);

//pooh nose
fill(0);
ellipse(mouseX,mouseY-30,11,9);

//balloom string
stroke(255);
line(pmouseX+50,pmouseY-50,mouseX+25,mouseY-15);

//balloon
noStroke();
fill(mouseX,0,mouseY);
ellipse(pmouseX+50,pmouseY-50,20,23);

}

