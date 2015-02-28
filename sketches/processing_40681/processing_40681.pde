
void setup()
{
  size(600, 400);
  smooth();
  frameRate(30);
}

void draw() {
background(abs(mouseY-145),abs(mouseX/2 -50),168); 
//background(210,237,243);
strokeWeight (3);
//ROBOT HEAD
//coloring the head
stroke(174,223,228); 
fill(174,223,228);
rect (mouseX-60,mouseY-150,120,120);
rect (mouseX-80,mouseY-130,160,80); 
//antennae
stroke(0);
line (mouseX, mouseY-150, pmouseX-10, pmouseY-170);
line (mouseX, mouseY-150, pmouseX+10, pmouseY-170);
//head border lines
line (mouseX-60, mouseY-150, mouseX+60, mouseY-150);
line (mouseX-60, mouseY-30, mouseX+60, mouseY-30);
line (mouseX-80, mouseY-130, mouseX-80, mouseY-50);
line (mouseX+80, mouseY-130, mouseX+80, mouseY-50);
//head's corners
ellipseMode(CORNER);
arc(mouseX-80, mouseY-150, 40, 40, PI, TWO_PI-PI/2);
arc(mouseX+40, mouseY-150, 40, 40, TWO_PI-PI/2, TWO_PI);
arc(mouseX+40, mouseY-70, 40, 40, 0, PI/2);
arc(mouseX-80, mouseY-70, 40, 40, PI/2, PI);
//eyes
ellipseMode(CENTER);
fill(0);
ellipse(pmouseX-45,mouseY-120,10,10);
ellipse(pmouseX+45,mouseY-120,10,10);
//blush
ellipseMode(CENTER);
stroke(247,165,170);
fill(247,165,170); 
ellipse(mouseX-50,mouseY-100,10,10);
ellipse(mouseX+50,mouseY-100,10,10);
//mouth
stroke(0); 
line (mouseX-20, mouseY-100, mouseX+20, mouseY-100);

//ROBOT BODY
fill(174,223,228);
rect (mouseX-25,mouseY-30,50,50);
//button
ellipse (mouseX,mouseY-5,30,30);
line (mouseX-5, mouseY-10, mouseX-5, mouseY);
line (mouseX+5, mouseY-10, mouseX+5, mouseY);
//hands
line (mouseX-25, mouseY-30, pmouseX-35, pmouseY+5);
line (mouseX+25, mouseY-30, pmouseX+35, pmouseY+5);
//legs
line (mouseX-15, mouseY+20, pmouseX-15, pmouseY+45);
line (mouseX+15, mouseY+20, pmouseX+15, pmouseY+45);
}

void mousePressed() {
//say hello
println("Where is this place?!I'm scared!");
}



