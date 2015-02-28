
float r = 0;
float b = 0;
float g = 0;

void setup() {
  //do once
size(500,500); // Set the size of the window background(255); // Draw a black background smooth();
smooth();
frameRate(50);
}

void draw() {
  //repeat endlessly

// Set ellipses and rects to CENTER mode
ellipseMode(CENTER);
rectMode(CORNER);
background(0);
smooth();

// Draw ellipse
noStroke();
if (mouseX > width/2) {
  r = r + 1;
}else{
  r = r - 1;
fill(102,45,145);
}
ellipse(100,100,400,400);


if (mouseX > width/2) {
  r = r + 1;
}else{
  r = r - 1;
fill(r= constrain(r, 0, 255));
}
ellipse(300,200,400,400);



if (mouseX > height/2 + 1) {
  g = g + 1;
}else{
  g = g - 1;
fill(70,149,188);
}
ellipse(600,50,400,400);


if (mouseY > width/2 + 1) {
  g = g + 1;
}else{
  g = g - 1;
fill(102,45,145);
}
ellipse(500,500,400,400);


fill(100,150,100,50);
ellipse(100,500,400,400);




// Draw rectangle
rect(0,0,mouseX,pmouseY+500);


// Draw ellipse
noStroke();
ellipse(mouseX, mouseY, pmouseX-150, pmouseY+100);

{
  if (mousePressed) {
    fill(56,124,66);
  } else {
    fill(70,90,220,50);
  }
ellipse( mouseX, mouseY, 80, 80);
}
}




