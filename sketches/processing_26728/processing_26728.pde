
void setup() {
size(300,300);  // Set the size of the window
smooth(); 
frameRate(30);

}

void draw() {
  // Draw a white background
  background(255);  
 
  
// Set ellipses and rects to CENTER mode
ellipseMode(CENTER);
rectMode(CENTER); 

// Draw Zoog's body
stroke(0);
fill(255);
rect(mouseX,mouseY+30,20,100);

// Draw Zoog's head
fill(255);
ellipse(mouseX,mouseY,60,40); 

// Draw Zoog's eyes & nose & mouth 
fill(mouseX,0,mouseY); 
ellipse(mouseX-19,mouseY,16,20);  
ellipse(mouseX+19,mouseY,16,20);
fill(0);
ellipse(mouseX,mouseY,12,40);
fill(255);
ellipse(mouseX,mouseY,16,20);


// Draw Zoog's legs
stroke(0);
line(mouseX+10,mouseY+40,pmouseX+20,pmouseY+40);
line(mouseX-10,mouseY+40,pmouseX-20,pmouseY+40);
line(mouseX+10,mouseY+20,pmouseX+20,pmouseY+20);
line(mouseX-10,mouseY+20,pmouseX-20,pmouseY+20);
line(mouseX+10,mouseY+50,pmouseX+20,pmouseY+100);
line(mouseX-10,mouseY+50,pmouseX-20,pmouseY+100);

//Draw Zoog's laserbeams 
line(mouseX+10,mouseY-50,pmouseX+20,pmouseY+50);
line(mouseX-10,mouseY-50,pmouseX-20,pmouseY+50);

}

void mousePressed() {
  println(0); 
}

