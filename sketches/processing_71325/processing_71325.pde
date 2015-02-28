
void setup() {
size(500,500);
smooth();
background (150,50,125);
}
void draw() {
background (150,50,125);
//Rainbow;
stroke(255,0,0);
strokeWeight(10);
line(250,mouseY+500,mouseX-20,mouseY);
stroke(230,150,0);
line(260,mouseY+500,mouseX-10,mouseY);
stroke(225,225,0);
line(270,mouseY+500,mouseX,mouseY);
stroke(0,255,0);
line(280,mouseY+500,mouseX+10,mouseY);
stroke(0,0,255);
line(290,mouseY+500,mouseX+20,mouseY);
stroke(220,0,255);
line(300,mouseY+500,mouseX+30,mouseY);
//cloud head;
fill(255);
stroke(255);
rect(mouseX-70,mouseY-35,150,60);
ellipse(mouseX-55,mouseY-40,70,55);
ellipse(mouseX+5,mouseY-50,90,75);
ellipse(mouseX+55,mouseY-40,80,55);
ellipse(mouseX-75,mouseY-1,80,51);
ellipse(mouseX+75,mouseY-1,80,51);
// cloud eyes;
stroke(0);
fill(0);
ellipse(mouseX-40,mouseY-30,10,30);
ellipse(mouseX+40,mouseY-30,10,30);
stroke(255);
strokeWeight(3);
fill(255);
ellipse(mouseX-44,mouseY-40,7,7);
ellipse(mouseX+44,mouseY-40,7,7);
//mouth;
fill(0);
ellipse(mouseX,mouseY-5,23,57);
stroke(255);
strokeWeight(3);
fill(255);
ellipse(mouseX,mouseY-22,23,35);


}

