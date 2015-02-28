
int counter;
int frameNum = 0;
int[] y= new int[50];
int[] x= new int[50];


void setup() {  
  size(600, 600,P3D);
    background(0); 
  counter = 0;
}

void draw() {
  counter++;

  noStroke();
  fill(random(255),100,255,50);
    triangle(mouseX, mouseY, 58, 20, 86, 75); 
   for (int i = 49; i > 0; i--) {
    y[i] = y[i-1];
    x[i] = x[i-1];
  }
    x[0] = mouseX;
  y[0] = mouseY;
 for (int i = 0; i < 49; i++) {
    triangle(mouseX+30, mouseY+75, mouseX+58, mouseY+20, mouseX+86, mouseY+75);
  }
   if (keyPressed) {
    if (key == 'v') {
      if(frameNum%2==0){
        saveFrame("saved/frame-####.tga");
      }
    }
   }  
  
  
}

