

void setup(){
size(500, 500);
background(0,0,255);
}

void draw() {
background(0,0,255);
fill(173,255,41);
ellipse(mouseX,mouseY,150,150);
fill(0);
ellipse(mouseX,mouseY-50,40,40);
fill(255);
ellipse(mouseX,mouseY-50,20,20);
fill(0);
strokeWeight(3);
line(mouseX-50,mouseY,mouseX+40,mouseY+10);

fill(0,0,0);
textSize(20);
text("FF Development",10,450);









if (mousePressed) {
  background(225,225,0);
  
  
fill(255,165,0);
ellipse(mouseX,mouseY,150,150);
fill(0);
ellipse(mouseX,mouseY-50,40,40);
fill(255);
ellipse(mouseX,mouseY-50,20,20);
fill(255,250,255);
strokeWeight(3);
line(mouseX-30,mouseY,mouseX+40,mouseY+10);
strokeWeight(3);
fill(255,250,255);
line(mouseX+70,mouseY-20,mouseX+35,mouseY+10);
strokeWeight(3);
fill(255,250,255);
line(mouseX-50,mouseY-40,mouseX-30,mouseY+3);

  fill(0,0,0);
textSize(20);
text("FF Development",10,450);
  
  
  
  
  
}
}
