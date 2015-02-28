
void setup() {
size(500,500);
}

void draw() {
background(255,255,255);  
  
stroke(0);
fill(209,158,69);
ellipseMode(CENTER);
ellipse(mouseX+190,mouseY+100,90,40);

stroke(0);
fill(209,158,69);
ellipseMode(CENTER);
ellipse(mouseX+131,mouseY+120,90,60);

stroke(0);
fill(209,158,69);
ellipseMode(CENTER);
ellipse(mouseX+90,mouseY+90,100,70);

stroke(0);
fill(209,158,69);
ellipseMode(CENTER);
ellipse(mouseX+60,mouseY+60,100,70);

//hoofd
stroke(0);
fill(209,158,69);
ellipseMode(CENTER);
ellipse(mouseX+55,mouseY+10,120,90);

//neus
stroke(0);
fill(233,113,247);
ellipseMode(CENTER);
ellipse(mouseX+10,mouseY+10,50,30);

//oog rechts
stroke(0);
fill(0);
ellipseMode(CENTER);
ellipse(mouseX+60,mouseY-15,15,15);

//pupil rechts
stroke(0);
fill(255);
ellipseMode(CENTER);
ellipse(mouseX+57,mouseY-15,5,5);

//oog links
stroke(0);
fill(0);
ellipseMode(CENTER);
ellipse(mouseX+10,mouseY-15,15,15);

//pupil links
stroke(0);
fill(255);
ellipseMode(CENTER);
ellipse(mouseX+7,mouseY-15,5,5);

//diehoek
stroke(0);
fill(234,251,238);
triangle(mouseX+23,mouseY-27, mouseX+51, mouseY-72, mouseX+79, mouseY-27);

}

