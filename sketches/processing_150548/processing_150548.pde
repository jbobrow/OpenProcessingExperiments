
int   anzTiles = 5; 
float tileSize; 
float gap = 5; 
float border = 10; 
int   cMode = 1;   // Color Mode: 1 = Original Colors 2 = Random Colors

void setup() {
  size(500, 500); 
  noLoop(); 
  noStroke(); 

  tileSize = (width - (anzTiles - 1) * gap - (2 * border)) / anzTiles;
} 

void draw() {
  float x, y;   
  float randNum;     //random number to chose first or second color    
  float r1, g1, b1;  //RGB-values first color
  float r2, g2, b2;  //RGB-values second color ( = RGB-Values first color + a little randomness)

// random colors
  r1 = random(255);  
  r2 = r1 + random(-45, 45);   
  g1 = random(255);  
  g2 = g1 + random(-45, 45);     
  b1 = random(255);  
  b2 = b1 + random(-45, 45);

  background(220);

  for (int i = 0; i < anzTiles; i++) {
    for (int j = 0; j < anzTiles; j++) {
      y = border + gap * (i) + tileSize * i;
      x = border + gap * (j) + tileSize * j;

      y += random(-7, 7); 
      x += random(-7, 7);
      randNum = random(1); 

      if (randNum < 0.8) {
        if (cMode == 1) {
          fill(137, 35, 26, 200);
        } else {
          fill(r1, g1, b1, 200);
        }
      } else {
        if (cMode == 1) {
          fill(173, 0, 0, 200);
        } else {
          fill(r2, g2, b2, 200);
        }
      }      

      rect(x, y, tileSize, tileSize);
    }
  }
}

void mouseReleased() {
  redraw();
}

void keyReleased() {
  if (key == '1') {
    cMode = 1;
    redraw();
  }
  if (key == '2') {
    cMode = 2;
    redraw();
  }  
  if(key == 'S' || key == 's'){
    saveFrame("Square_25.jpg");
  }
}



