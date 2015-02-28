
int counter;
int[] y= new int[50];
int[] x= new int[50];


void setup() {  
  size(600, 600,P3D);
  background(HSB); 
  colorMode(HSB);
  counter = 0;
}

void draw() {
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) {
    ellipse(mouseX, mouseY, 50, 50);
  
   for (int i = 49; i > 0; i--) {
    y[i] = y[i-1];
    x[i] = x[i-1];
  }
    x[0] = mouseX;
  y[0] = mouseY;
 for (int i = 0; i < 49; i++) {
    ellipse(mouseX, mouseY, 40, 40);
 
  }
  }
}
  
  
  
  

