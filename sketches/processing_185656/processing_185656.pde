
void setup () {
  size(600, 600);
  colorMode(HSB);
}
void draw() {
  float aleatorio = random(0, 250);
  background ((aleatorio), 122, 255);
  for (int i = 500;i>0;i=i-2) {


    stroke((i/2)+(pmouseX/3), 255, 255);
    ellipse(i, 300, i, i);
    rect(500-i, 300, i, i);
    
 
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

