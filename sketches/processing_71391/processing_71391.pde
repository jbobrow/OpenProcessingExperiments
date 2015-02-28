
void setup() {
size(500,500);
smooth();
frameRate(24);
}
void draw() {
background(215,0,205);
//scary random circles
fill(random(50,100),random(55),30);
ellipse(250,150,random(200), 200);
fill(random(300,255),random(-50),200);
ellipse(250,350,random(200),200);
//Rainbow;
stroke(random(50,255),random(150),255);
strokeWeight(10);
line(0,mouseY+500,mouseX-20,mouseY);
stroke(random(20,200),random(50),150);
line(50,mouseY+500,mouseX-10,mouseY);
stroke(random(150,50),random(225),0);
line(100,mouseY+500,mouseX,mouseY);
stroke(random(0,105),random(150),120);
line(200,mouseY+500,mouseX+10,mouseY);
stroke(random(50,200),random(80),255);
line(300,mouseY+500,mouseX+20,mouseY);
stroke(random(20,50),random(200),25);
line(495,mouseY+500,mouseX+30,mouseY);
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
ellipse(mouseX-40,mouseY-30,random(20),30);
ellipse(mouseX+40,mouseY-30,random(20),30);
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

