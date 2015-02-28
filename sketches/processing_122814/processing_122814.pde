
void setup() {
size(500,500);}
void draw() {
background(255,255,255); 
stroke(0);
fill(255,0,0);
ellipseMode(CENTER);
fill(0);
ellipse(mouseX-50,mouseY+60,100,40);
ellipse(mouseX+50,mouseY+60,100,40);
fill(255,0,0);
ellipse(mouseX,mouseY,150,150);
fill(0);
ellipse(mouseX-30,mouseY-30,50,50);
ellipse(mouseX+30,mouseY-30,50,50);
fill(255);
ellipse(mouseX-40,mouseY-40,25,25);
ellipse(mouseX+40,mouseY-20,25,25);
fill(0);
ellipse(mouseX-40,mouseY-40,10,10);
ellipse(mouseX+40,mouseY-20,10,10);
fill(0);
rect(mouseX-35,mouseY+30,70,20);
fill(255);
rect(mouseX-35,mouseY+30,10,10);
rect(mouseX+25,mouseY+30,10,10);}

//referentiepunt 250
