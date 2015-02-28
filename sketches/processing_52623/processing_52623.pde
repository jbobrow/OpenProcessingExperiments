
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
fill(100,150,100,50); 
ellipse(100,100,400,400);
fill(70,90,220,50);  
ellipse(300,200,400,400);
fill(100,150,100,50);  
ellipse(600,50,400,400);
fill(100,150,100,50);  
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
    fill(120,170,120,70);
  } else {
    fill(70,90,220,50);
  }
ellipse( mouseX, mouseY, 80, 80);
}

}
void mouseReleased(){
fill(random(255), random(255), random(255));
}


