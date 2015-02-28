
void setup() {
size(200,200);

}

void draw() {
  background(random(255),random(255),random(255),40);
  rectMode(CENTER);
rect(100,100,20,100);
ellipse(100,70,60,60);
ellipse(81,70,16,32); 
ellipse(119,70,16,32); 
line(90,150,80,160);
line(110,150,120,160);
  line(90, 100, mouseX-20, mouseY);
  line(110, 100, mouseX+20, mouseY);
}
