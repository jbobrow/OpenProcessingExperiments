
void setup() {
size(900,600);

smooth();
}

void draw() {
 
line (pmouseX, pmouseY, mouseX, mouseY);

ellipse(18,30,20,30);
ellipse (60,70,90,100);
ellipse(50,50,20,60);

fill(10,40,24);
  
rectMode(CENTER); 
fill(mouseY, 190, mouseX); 
noStroke();
rect(mouseX, mouseY, 20, 20);

}


