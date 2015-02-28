
void setup() {
  size(500,500);
  background(#E5FDFF);
  smooth();
}

 void draw() {
   
    line(pmouseX,pmouseY,mouseX,mouseY);
  
  if (mouseButton == LEFT) {
    fill(random(255),random(255),random(255),random(255));
  } else {
    fill (random(255),random(255),random(255),random(255));
  }
}

void mousePressed() {
   if (mouseButton == LEFT) {
  ellipse(mouseX,mouseY,random(80),random(80));
   } else if(mouseButton == RIGHT) {
  rect(mouseX,mouseY,random(50),random(50));
   } else {
    
   }
 }
 


