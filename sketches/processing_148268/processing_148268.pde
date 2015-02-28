
 
void setup() {
  size(500, 500);
  background(random(300),random(300),random(255));

}
 void draw() 
{
stroke(random(255),random(200),random(255));
line(3,3,mouseX,mouseY);
line(1000,0,mouseX,mouseY);
line(0,500,mouseX,mouseY);


triangle(90, 250, 40, 60, mouseX, mouseY);
ellipse(79, 250, mouseX, mouseY);
fill(random(200));
}

