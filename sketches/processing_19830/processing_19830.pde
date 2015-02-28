

int linecircleColor = 0;

void setup() {
  size (600,600);
  colorMode(HSB, 100);
  background(50, 20, 20);
  
  smooth();
 
}


void draw() {
  linecircleColor = int(random (50,60));
  
  noStroke();
  fill (linecircleColor, 20, 40, 30);
  ellipse (mouseX, mouseY, 20, 20);
  
  stroke (linecircleColor, 20, 40, 30);
   line (300,300,mouseX,mouseY);
   
   fill (linecircleColor,20,40,30);
   noStroke();
   ellipse (300,300,100,100);
   
  
   
}

void mousePressed (){
 background(50,20,20); 
  
}


void keyPressed() {
  save("drawing.jpg");

}




