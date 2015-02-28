
void setup() {
  size(300, 300);
}

float boxwidth = 50; 
 
void draw() {
  background(225,0,mouseY);
     stroke(1);
   strokeWeight(3);
   fill(mouseX,150,mouseY);
   rect(mouseX,mouseY,boxwidth,600);
   rect(height-mouseX-boxwidth,height-mouseY,boxwidth,600);
   quad(mouseX,mouseY,mouseX+boxwidth,mouseY,height-mouseX,height-mouseY,height-mouseX-boxwidth,height-mouseY);
}

void mousePressed(){
  boxwidth=mouseX/2;
}


