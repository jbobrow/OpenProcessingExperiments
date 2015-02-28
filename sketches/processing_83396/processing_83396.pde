
void setup() {
  
size(400,400);
background(255);
smooth();
ellipseMode(CENTER);
rectMode(CENTER); 

}


void draw () {
  background(255);
// Body
stroke(0);
fill(3,60,88);
rect(mouseX,mouseY,40,200);

// Head

fill(245,222,228);
ellipse(mouseX,mouseY-75,150,150); 

// Eyes socket
stroke(0);
fill(255); 
ellipse(mouseX-35,mouseY-75,50,50); 
ellipse(mouseX+35,mouseY-75,50,50);

//eye colour
noStroke();
fill(81, 113, 237);
ellipse(mouseX-35,mouseY-75,35,35); 
ellipse(mouseX+35,mouseY-75,35,35);



//pupils
stroke(0);
fill(0); 
ellipse(mouseX-35,mouseY-75,20,20); 
ellipse(mouseX+35,mouseY-75,20,20);

// Legs
stroke(0);
line(mouseX-20,mouseY+90,160,360);
line(mouseX+20,mouseY+90,240,360); 

//Arms
stroke(0);
line(mouseX-20,mouseY+10,mouseX-80,mouseY-20);
line(mouseX+20,mouseY+10,mouseX+80,mouseY-20);

}
