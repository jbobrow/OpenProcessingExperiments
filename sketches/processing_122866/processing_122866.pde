
void setup(){
  size(200,200);}
  
void draw(){background(255,255,255);
stroke(0);
fill(0,0,255);
ellipseMode(CENTER);
ellipse(mouseX,mouseY,60,60);
ellipse(mouseX,mouseY-40,70,70);
line(mouseX-10,mouseY-100,mouseX-15,mouseY-70);
line(mouseX+40,mouseY-100,mouseX+20,mouseY-70);
fill(255);
ellipse(mouseX-14,mouseY-100,18,18);
ellipse(mouseX+36, mouseY-100,18,18);
fill(0);
ellipse(mouseX-12,mouseY-100,12,12);
ellipse(mouseX+33,mouseY-100,10,10);
fill(0);
ellipse(mouseX,mouseY-30,50,30);
fill(255);
ellipse(mouseX-10,mouseY-40,12,10);
ellipse(mouseX,mouseY-40,12,10);
ellipse(mouseX+10,mouseY-40,12,10);
ellipse(mouseX-10,mouseY-20,12,10);
ellipse(mouseX,mouseY-20,12,10);
ellipse(mouseX+8,mouseY-20,12,10);
fill(0,0,255);
ellipse(mouseX-10,mouseY+50,40,30);
ellipse(mouseX+20,mouseY+50,40,30);
}

