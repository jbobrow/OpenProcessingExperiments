
void setup() {
  size(600,400);
  background(#790BDB);
  noStroke();
  noLoop();
}

void draw() {
  drawDNA(width*0, height*0.15, 50, 1);
  drawDNA(width*0.1, height*0.15, 50, 2);
  drawDNA(width*0.2, height*0.15, 50, 3);
  drawDNA(width*0.3, height*0.15, 50, 4);
  drawDNA(width*0.4, height*0.15, 50, 5);
  drawDNA(width*0.5, height*0.15, 50, 6);
  drawDNA(width*0.6, height*0.15, 50, 7);
  drawDNA(width*0.7, height*0.15, 50, 8);
  
  drawDNA(width*0, height*0, 50, 8);
  drawDNA(width*0.1, height*0, 50, 7);
  drawDNA(width*0.2, height*0, 50, 6);
  drawDNA(width*0.3, height*0, 50, 5);
  drawDNA(width*0.4, height*0, 50, 4);
  drawDNA(width*0.5, height*0, 50, 3);
  drawDNA(width*0.6, height*0, 50, 2);
  drawDNA(width*0.7, height*0, 50, 1);
  
  drawDNA(width*0, height*0.3, 50, 8);
  drawDNA(width*0.1, height*0.3, 50, 7);
  drawDNA(width*0.2, height*0.3, 50, 6);
  drawDNA(width*0.3, height*0.3, 50, 5);
  drawDNA(width*0.4, height*0.3, 50, 4);
  drawDNA(width*0.5, height*0.3, 50, 3);
  drawDNA(width*0.6, height*0.3, 50, 2);
  drawDNA(width*0.7, height*0.3, 50, 1);

 drawDNA(width*0, height*0.45, 50, 1);
  drawDNA(width*0.1, height*0.45, 50, 2);
  drawDNA(width*0.2, height*0.45, 50, 3);
  drawDNA(width*0.3, height*0.45, 50, 4);
  drawDNA(width*0.4, height*0.45, 50, 5);
  drawDNA(width*0.5, height*0.45, 50, 6);
  drawDNA(width*0.6, height*0.45, 50, 7);
  drawDNA(width*0.7, height*0.45, 50, 8);
  
  drawDNA(width*0, height*0.6, 50, 8);
  drawDNA(width*0.1, height*0.6, 50, 7);
  drawDNA(width*0.2, height*0.6, 50, 6);
  drawDNA(width*0.3, height*0.6, 50, 5);
  drawDNA(width*0.4, height*0.6, 50, 4);
  drawDNA(width*0.5, height*0.6, 50, 3);
  drawDNA(width*0.6, height*0.6, 50, 2);
  drawDNA(width*0.7, height*0.6, 50, 1);
  
  drawDNA(width*0, height*0.75, 50, 1);
  drawDNA(width*0.1, height*0.75, 50, 2);
  drawDNA(width*0.2, height*0.75, 50, 3);
  drawDNA(width*0.3, height*0.75, 50, 4);
  drawDNA(width*0.4, height*0.75, 50, 5);
  drawDNA(width*0.5, height*0.75, 50, 6);
  drawDNA(width*0.6, height*0.75, 50, 7);
  drawDNA(width*0.7, height*0.75, 50, 8);
  
  drawDNA(width*0, height*0.9, 50, 8);
  drawDNA(width*0.1, height*0.9, 50, 7);
  drawDNA(width*0.2, height*0.9, 50, 6);
  drawDNA(width*0.3, height*0.9, 50, 5);
  drawDNA(width*0.4, height*0.9, 50, 4);
  drawDNA(width*0.5, height*0.9, 50, 3);
  drawDNA(width*0.6, height*0.9, 50, 2);
  drawDNA(width*0.7, height*0.9, 50, 1);
  
 }

void drawDNA(float a, float b, int squ, int n) {
  float colorNum = 255/n;
  float steps = 50/n;
  for (int i = 0; i++ < n; i++) {
    fill(i*colorNum);
    rect(a, b, 50 + i+steps, 60 - i*steps);
  }
}


