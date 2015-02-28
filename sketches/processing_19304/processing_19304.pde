

int xcir = 1000;
int ycir = 1000; 

void setup() {
  size(600, 600);
  background(80);
  noStroke();
  colorMode(HSB,100);
}

// this function gets run over and over
void draw() {
  
  //contracting circles
  xcir--;  
  ycir--;
  fill(random(100),random(40),random(50), 10);
  ellipse(mouseX,mouseY,xcir,ycir);
  
  // cursor lines track
  stroke(80,80,80,20);
  line(mouseX, 0, mouseX, 600);
  line(600, mouseY, 0, mouseY);
  
}

// marks a pink circle
void mousePressed() {  
  fill(80, 80, 80); 
  ellipse(mouseX,mouseY,xcir,ycir);

}

// save and reset 
void keyPressed() {
  save("circles.jpg");   
  background(80);
  xcir = 1000;
  ycir = 1000;
   
}






