
void setup(){
  size(200,200); //set the size of the window
  smooth();
  frameRate(30);
}

void draw(){
  background(119,183,111); //a colour background

rectMode(CENTER);

//body
stroke(0);
fill(255,200,247);
rect(mouseX,mouseY,80,100);

//ears
fill(255,160,240);
triangle(60,50,75,20,90,50);
fill(255,160,240);
triangle(110,50,125,20,140,50);

//eyes
fill(16,56,155);
ellipse(mouseX-19,mouseY-30,16,32);
ellipse(mouseX+19,mouseY-30,16,32);

//legs
stroke(0);
line(mouseX-10,mouseY+50,mouseX-10,mouseY+90);
line(mouseX+10,mouseY+50,mouseX+10,mouseY+90);

//smile
noFill();
arc(100,100,60,50,PI/2,PI);
}

void mousePressed(){
  println("Hi!I have ears.");
}


