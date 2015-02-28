
void setup() { 
  size(500, 500);
  noStroke();
}
 
void draw() { 
background(255);
float a=random(255);
    float b=random(255);
    float c=random(255);
ellipse(mouseX, mouseX, mouseX,500-mouseY);
fill(a,b,c);
ellipse(mouseY+mouseX/30,25,mouseY/2, mouseY/2);
fill(a,b,c);
ellipse(mouseX,mouseY,mouseY/2, mouseY/2);
}



