
// Clouds as drawn by Mala Kumar

int buttonWidth = 50, p;
int shadow = 200;
float breadR = 248, breadG = 234, breadB = 201;
float breadRR, breadGG, breadBB;

void setup() {
  size(800, 600);
  background(200);
  smooth();
}

void draw() {
  drawOven();
  drawCloud(70+mouseX/10, 200, 255, 255, 255);
  drawCloud(380-mouseX/30, 120, 255, 255, 255);
//  drawButton(720, 180, 254, 106, 27);
//  drawButton(720, 300, 254, 106, 27);
  drawButton(width-80, 180, 254, 106, 27);
  drawButton(width-80, 300, 254, 106, 27);
  
  if(mousePressed && dist(720, 180, mouseX, mouseY) < 30) {
    if(breadR >= 0 && breadG >= 0 && breadB >= 0) {
      breadR -= 2.1;
      breadG -= 2.7;
      breadB -= 2.6;
      p++;
      drawBread(breadR, breadG, breadB, 255);
      breadFace(breadR, breadG, breadB, 255, p);   
    } 
  }
  if(mousePressed && dist(720, 300, mouseX, mouseY) < 30) {
    if(breadR <= 248 && breadG <= 234 && breadB <= 201) {
        breadR += 2.1;
        breadG += 2.7;
        breadB += 2.6;
    p++;
    drawBread(breadR, breadG, breadB, 255);
    breadFace(breadR, breadG, breadB, 255, p);
    }  
  }
  drawBread(breadR, breadG, breadB, 255);
  breadFace(breadR, breadG, breadB, 255, p); 
}

void drawOven() {
  noStroke();
  fill(#f8f6f2);
  ellipse(50, 50, 100, 100);
  ellipse(750, 50, 100, 100);
  ellipse(50, 550, 100, 100);
  ellipse(750, 550, 100, 100);
  rect(50, 0, 700, 100);
  rect(0, 50, 100, 500);
  rect(50, 500, 700, 100);
  rect(620, 50, 180, 500);
  fill(#e3f8fc);
  rect(102, 102, 516, 396);
  fill(#d4ed99);
  rect(102, 402, 516, 96);
}

void drawCloud(int x, int y, int fillR, int fillG, int fillB) {
  noStroke();
  fill(fillR, fillG, fillB);
  ellipse(x+100, y+50, 60, 60);  
  ellipse(x+125, y+55, 50, 50);  
  ellipse(x+150, y+60, 30, 30);  
  ellipse(x+70, y+60, 30, 30);  
}

void drawButton(int x, int y, int fillR, int fillG, int fillB) {
  noStroke();
  fill(shadow);
  ellipse(x-2, y-2, 60, 60);
  if(mousePressed && dist(x, y, mouseX, mouseY) < 30) {
    fill(#fec134);
  }
  else {
    fill(fillR, fillG, fillB);
  }
  ellipse(x, y, 60, 60);
}

void drawBread(float fillR, float fillG, float fillB, int fillA) {
  noStroke();
  fill(fillR, fillG, fillB, fillA);
  ellipse(350, 300, 150, 110);
  rect(290, 300, 120, 80);
}

void breadFace(float fillR, float fillG, float fillB, int fillA, int p) {
  stroke(#694d0c);
  strokeWeight(2);
  line(320, 380, 320, 402); 
  line(380, 380, 380, 402);
  line(273, 335+(p%5), 295, 340); 
  line(403, 340, 426, 335+(p%5));  
  fill(#694d0c);
  ellipse(325, 290, 5, 5);
  ellipse(375, 290, 5, 5);
  ellipse(350, 302, 10, 8);
  fill(fillR, fillG, fillB, fillA);
  noStroke();
  rect(344, 296, 12, 4);  
}


