
void setup() {
size(200,200); // set the size of the window
smooth();
frameRate(30);
}


void draw() {
  background(50,100,5); //draw a black background


ellipseMode(CENTER);

// draw zoogs body
stroke(255);
fill(50,50,20);
rect(75,75,50,50);

//draw zoogs head
stroke(255);
fill(150);
ellipse(100,50,90,90);

//draw zoogs eyes
fill(mouseX,mouseY,pmouseX,pmouseY);
ellipse(80,50,16,32);
ellipse(120,50,16,32);

//draw zoogs legs
stroke(255);
line(75,125,75,150);
line(125,125,125,150);

}

void mousePressed() {
  println("hey im cool");
}


