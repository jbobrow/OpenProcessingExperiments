
void setup() {
size(400,400);
}

void draw() {
  
fill(0,mouseX,mouseY,75); //0-400
rect(0,0,400,400);

fill(35,75);
rect(0,0,400,400);
  
  noStroke();
  fill(0,100,140); //0-255
ellipse(200,200,350,350); //center x, center y, width, height

noStroke();
fill (200); //0-250
rect(125,125,150,150); //center x, center y, width, height

stroke(250);
line(mouseX,mouseY,200,200);

noStroke();
fill(100,0,0,150);
triangle(25,375,200,200,375,375);

  noCursor();
   noStroke();
fill(random(255),0,0); //0-400
  ellipse(mouseX,mouseY,random(175),random(175)); 
  
fill(random(55)+200);
ellipse(mouseX,mouseY,random(50),random(50));


}



