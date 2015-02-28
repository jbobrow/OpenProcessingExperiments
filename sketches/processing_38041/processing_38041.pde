


void setup() {
  size(500, 500);
  noStroke();
  smooth();
}

void draw() {
    background(0);
  for (int i = 50; i < width; i= i+50)
  {  
    for (int j= 50; j< height; j = j + 50)
    { 
        float r = i/13;
        float c = 255-j/2;
        fill(0, 255, 230, c);
        ellipse(i, j, r, r);
      }
    }
  }

