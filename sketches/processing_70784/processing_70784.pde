
void setup() {
 size(500,500);
 background(300);
  
  
  
}

void draw() {
 line(0,500,mouseX,mouseY);
 line(500,0,mouseX,mouseY);
 line(250,250,mouseX,mouseY);
 line(500,500,mouseX,mouseY);
 line(0,0,mouseX,mouseY);
 stroke(255,0,0);
 ellipse(250,250,mouseX,mouseY);
 fill(300);
}
void mousePressed() {
  background(300);
  

 
 
}


