
void setup(){
size(500,500);
}

void draw(){
background(255,255,255);
stroke(0);
fill(218,56,110);
ellipseMode(CENTER);
ellipse(mouseX,mouseY,250,250);
fill(255,255,255);
ellipse(mouseX-50,mouseY-80,100,100);
ellipse(mouseX+50,mouseY-80,100,100);
fill(0);
ellipse(mouseX-50,mouseY-80,50,50);
ellipse(mouseX+50,mouseY-80,50,50);
fill(255,255,255);
ellipse(mouseX-60,mouseY-60,10,10);
fill(255,255,255);
ellipse(mouseX+40,mouseY-60,10,10);
fill(225,80,130);
ellipse(mouseX-35,mouseY+80,80,80);
fill(225,80,130);
ellipse(mouseX+35,mouseY+80,80,80);
