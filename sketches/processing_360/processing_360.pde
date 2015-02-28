
int i = 1;
int j = 1;
int k = 1;

void setup() {
  colorMode(HSB, 360, 100, 100);
  size(500, 500);
  smooth();
  rectMode(CENTER);
  noStroke();
  
}

void draw() {
 
  background(255, 0, 100);
  
  blinkingCircle(i);
  
  emergingSquare(j);
  
  emergingTriangle(k);
  
  i++;
  j++;
  k++;
  if(i > 600) {
    i = 1;
  }
  if(j > 400) {
    j = 1;
  }
  if(k > 580) {
    k = 1;
  }
  
}

void blinkingCircle(int i) {
  fill(240, 70, 70, 255);
  if(i < 300) {
       
    ellipse(250, 250, 500 - (i * 1.66), 500 - (i * 1.66));
  }
  if(i >= 300) {
    
    ellipse(250, 250, (i - 300) * 1.66, (i - 300) * 1.66);
  } 
}

void emergingSquare(int j) {
  if(j < 200) {
    fill(0, 70, 70, map(j, 1, 199, 0, 255));
    rect(250, 250, 350, 350);
  }
  if(j >= 200) {
    fill(0, 70, 70, 255 - (map(j, 200, 400, 0, 255)));
    rect(250, 250, 350, 350);
  } 
  
}

void emergingTriangle(int k) {
  if(k < 240) {
    fill(120, 70, 70, map(k, 1, 239, 0, 255));
    eqTri(250, 225, 200, 0);
  }
  if(k >= 240) {
    fill(120, 70, 70, 255 - (map(k, 240, 580, 0, 255)));
    eqTri(250, 225, 200, 0);
  }
} 
     
void eqTri(float x, float y, float lineLength, int orientation) {
  float half = lineLength/2;
  float middleLine = sqrt(sq(lineLength) - sq(half));
  float halfMiddleLine = middleLine/2;
  
  if(orientation == 0) {
    triangle(x, y - halfMiddleLine, x - half, y + halfMiddleLine, x + half, y + halfMiddleLine);
  }
  if(orientation == 1) {
    triangle(x, y + halfMiddleLine, x - half, y - halfMiddleLine, x + half, y - halfMiddleLine);
  }
  if(orientation == 2) {
    triangle(x - halfMiddleLine, y, x + halfMiddleLine, y - halfMiddleLine, x + halfMiddleLine, y + halfMiddleLine);
  }
  if(orientation == 3) {
    triangle(x + halfMiddleLine, y, x - halfMiddleLine, y - halfMiddleLine, x - halfMiddleLine, y + halfMiddleLine);
  }  
}  
  

