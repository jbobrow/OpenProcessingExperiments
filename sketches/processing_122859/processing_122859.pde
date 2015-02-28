
void setup() {
size(200,200);
background(255,255,255);
stroke(0);
}
void draw() {
background(255,255,255);
fill(200,100,150);
ellipseMode(CENTER);
ellipse(mouseX,mouseY,100,100);
fill(0,100,150);
strokeWeight(5);
line(mouseX,mouseY-15,mouseX-20,mouseY-70);
fill(0,100,150);
strokeWeight(5);
line(mouseX,mouseY-15,mouseX+20,mouseY-70);

fill(200,100,150);
ellipse(mouseX,mouseY,100,100);
fill(0,0,0);
ellipse(mouseX+10,mouseY,50,70);
fill(0,0,0);
ellipseMode(CENTER);
ellipse(mouseX-10,mouseY,50,70);
fill(0,0,0);
ellipseMode(CENTER);
ellipse(mouseX,mouseY+5,70,70);
strokeWeight(0);
fill(255,255,255);
triangle(mouseX+7,mouseY-10,mouseX,mouseY-34,mouseX+15,mouseY-36.5);
strokeWeight(0);
fill(255,255,255);
triangle(mouseX-10,mouseY-15,mouseX,mouseY-34,mouseX-10,mouseY-36.5);
strokeWeight(0);
fill(255,255,255);
triangle(mouseX-10,mouseY-15,mouseX-20,mouseY-20,mouseX,mouseY-35);

}
