
void setup(){
size(200,200);   
smooth();
}

void draw(){
ellipseMode(CENTER);
background(mouseX,mouseX-mouseY,mouseY); 


stroke(0);
fill(150);
ellipse(mouseX,mouseY-60,40,40);

stroke(0);
fill(0);
ellipse(mouseX-10,mouseY-65,7,7);
ellipse(mouseX+10,mouseY-64,7,7);

stroke(0);
line(mouseX,mouseY-60,mouseX,mouseY-55);

stroke(0);
line(mouseX-10,mouseY-53,mouseX-4,mouseY-48);
line(mouseX-4,mouseY-48,mouseX+3,mouseY-48);
line(mouseX+4,mouseY-48,mouseX+10,mouseY-53);

stroke(0);
line(mouseX,mouseY-40,mouseX,mouseY-20);

stroke(0);
fill(150);
ellipse(mouseX,mouseY,20,35);

stroke(0);
line(mouseX,mouseY+15,80,170);
line(mouseX,mouseY+15,120,170);

stroke(0);
line(mouseX,mouseY-20,mouseX-30,mouseY+5);
line(mouseX,mouseY-20,mouseX+30,mouseY+5);
}
