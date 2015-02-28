
void setup() {
  size (500, 500);
 smooth();
}
void draw() {
    

 // background(-300);
  //fill (10, 1); 
  if (mousePressed == true) {
   // fill(0);
  } 
  else {
    fill(270, 15);
    int value = 0;
    loadPixels();
  for(int i =0;i<width*height;i++){
    pixels[i]=color(random (255));
    pixels[12345]=color(0,255,0);
  }
  updatePixels();
  }
  for (int i = 1; i < 2; i++) {
    for (int b=10; b<20;b++) {
      float d= dist (i*40, b*15, mouseX, mouseY);
      float nx = noise(millis()*0.001)*10; // generador de "ruido" para el eje x
      float ny = noise(millis()*0.0012)*10; // generador de "ruido" para el eje y
      
      curve (i*-50, b*80, d*1, d*1, 200, -1, 30*ny, 40*nx);
     // curve (i*4000, b*80, d*1, d*1, 200, -1, 60*ny, 50*nx);
     //curve (i*3000, b*80, d*1, d*1, 200, -1, 60*ny, 50*nx);
    // curve (i*2000, b*80, d*1, d*1, 200, 700, 60*ny, 50*nx);
     curve (i*1000, b*80, d*1, d*1, 10, 300, 9*ny, 9*nx);
    }
  }
}


