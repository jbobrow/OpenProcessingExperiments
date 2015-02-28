
void setup() {
size(200,200);
smooth();
}

void draw() {
background(0);

//head//
strokeWeight(2);
stroke(73,97,150);
fill(116,152,236);
ellipse(50,50,30,20);
fill(0);
noStroke();
ellipse(45,50,4,4);

//neck//
strokeWeight(2);
stroke(54,126,105);
fill(100,216,182);
ellipse(70,65,20,30);

//body//
stroke(60,150,143);
fill(89,217,236);
rect(80,70,60,40);

//legs//
stroke(81,156,120);
fill(128,243,187);
rect(90,110,10,30);
rect(120,110,10,30);

//lines//
stroke(238,245,123);
strokeWeight(2);
line(25,40,35,50);
line(25,50,35,50);
line(45,20,55,40);
line(55,20,55,40);
line(65,20,55,40);
line(mouseX+20,mouseY+5,140,70);
line(mouseX+35,mouseY+15,140,70);
line(mouseX,mouseY-10,140,70);
line(mouseX-15,mouseY-5,140,70);
line(80,130,90,140);
line(80,140,90,140);
line(110,130,120,139);
line(110,140,120,139);
}

