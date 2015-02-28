
void setup(){
size(300,300);
}
void draw() {
background(76,147,39);
fill(255,0,0);
ellipse(150,150,300,300);
fill(255,255,255);
ellipse(150,150,250,250);
fill(76,147,39);
ellipse(150,150,200,200);
fill(255,0,0);
ellipse(150,150,150,150);
fill(255,255,255);
ellipse(150,150,100,100);
fill(76,147,39);
ellipse(150,150,50,50);

strokeWeight(3);
line(mouseX -10,mouseY -40,mouseX -90,mouseY);
line(mouseX +10,mouseY -40,mouseX +90,mouseY);
line(mouseX +20,mouseY +50,mouseX +20,mouseY +100);
line(mouseX -20,mouseY +50,mouseX -20,mouseY +100);
strokeWeight(2);
fill(13,52,118);
triangle(mouseX,mouseY -70,mouseX -50,mouseY +50,mouseX +50,mouseY +50);
fill(255,255,93);
ellipse(mouseX,mouseY -100,75,75);
fill(255,255,255);
ellipse(mouseX -15,mouseY -110,10,30);
ellipse(mouseX +15,mouseY -110,10,30);
ellipse(mouseX,mouseY -75,10,10);
fill(0,0,0);
ellipse(mouseX -15,mouseY -110,5,15);
ellipse(mouseX +15,mouseY -110,5,15);
fill(0,0,0);
ellipse(mouseX,mouseY,50,50);
fill(255,0,0);
rect(mouseX -15,mouseY -5,30,10,7);
rect(mouseX -15,mouseY -15,10,30,7);
rect(mouseX +5,mouseY -15,10,30,7);
fill(250,250,250);
strokeWeight(2);
line(mouseX -90,mouseY +100,mouseX -90,mouseY -75);
strokeWeight(2);
fill(173,167,167);
triangle(mouseX -90,mouseY -75,mouseX -90,mouseY -90,mouseX -130,mouseY -75);
fill(250,250,250);
fill(255,231,93);
strokeWeight(3);
ellipse(mouseX -90,mouseY,15,15);
ellipse(mouseX +90,mouseY,15,15);
}


