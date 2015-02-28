
// kate parsons // lesson 1 homework //

void setup() { 
  
size(200,200); 
smooth(); 
frameRate(30);

}

void draw() { 
background(208,130,247);

ellipseMode(CENTER); 
rectMode(CENTER);

fill(247,130,228); 
rect(mouseX,mouseY,20,100);
stroke(0); 
fill(255); 
ellipse(mouseX,mouseY-30,60,60);

fill(mouseX,0,mouseY); 
ellipse(mouseX-19,mouseY-30,16,32); 
ellipse(mouseX+19,mouseY-30,16,32);

stroke(0); 
line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60); 
line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);

}



