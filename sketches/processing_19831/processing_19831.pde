

int linecircleColor = 0;

void setup() {
  size (600,600);
  colorMode(HSB, 100);
  background(0, 0, 0);
  
  smooth();
 
}


void draw() {
  linecircleColor = int(random (100));
  
  noStroke();
  fill (linecircleColor, 80, 90, 30);
  ellipse (mouseX, mouseY, 20, 20);
  
  stroke (linecircleColor, 80, 90, 30);
   line (300,300,mouseX,mouseY);
   
   fill (linecircleColor,80,90,30);
   noStroke();
   ellipse (300,300,100,100);
   
  
   
}

void mousePressed (){
 background(0,0,0);
 
  
}

void keyPressed() {
  save("drawing.jpg");

}


