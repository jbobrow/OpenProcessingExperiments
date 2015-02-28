
float y = 0.0;
float z = 600.0;


void setup() {
  size(600, 600);
}

float a = 0;
float b = 0;
float c = -255;

void draw() {

// paint toy 1
  pushStyle();
  if (keyPressed && mousePressed) {
    if (key == 'r') {
      noStroke();
      fill(255, 0, 0);
      ellipse(mouseX, mouseY, 50, 50);
      ellipse(mouseX + 100, mouseY, 50, 50);
      ellipse(mouseX + 50, mouseY + 30, 40, 40);
      ellipse(mouseX, mouseY + 70, 50, 50);
      ellipse(mouseX + 100, mouseY + 70, 50, 50);
    }
  }
  popStyle();

// paint toy 2
  pushStyle();
  if (keyPressed && mousePressed) {
    if (key == 'l') {
      frameRate(200);
      y = y + 0.5;
      z = z + -0.5;

      drawDiamondRain(10, y);
      drawDiamondRain(50, y);
      drawDiamondRain(100, y);
      drawDiamondRain(150, y);
      drawDiamondRain(200, y);
      drawDiamondRain(250, y);
      drawDiamondRain(300, y);
      drawDiamondRain(250, y);
      drawDiamondRain(300, y);
      drawDiamondRain(350, y);
      drawDiamondRain(400, y);
      drawDiamondRain(450, y);
      drawDiamondRain(500, y);
      drawDiamondRain(550, y);
      drawDiamondRain(600, y);
      
      drawDiamondRain(10, z);
      drawDiamondRain(50, z);
      drawDiamondRain(100, z);
      drawDiamondRain(150, z);
      drawDiamondRain(200, z);
      drawDiamondRain(250, z);
      drawDiamondRain(300, z);
      drawDiamondRain(350, z);
      drawDiamondRain(400, z);
      drawDiamondRain(450, z);
      drawDiamondRain(500, z);
      drawDiamondRain(550, z);
      drawDiamondRain(600, z);
      
        if (y > 600) {
        y = 0;
      
         if (z < 600) {
          z = 600;
        }
      }

     
    }
  }
  popStyle();
  
  
  // paint toy 3
    if ((keyPressed == true) && (key == 'b')){
  a = a + .1;
  b = b + 1;
  c = c + 1;
  float d = random(0,255);
  float e = random(0,255);
  float f = random(0,255);
  translate(mouseX, mouseY);
  rotate(a);
  if(b<255){
  fill(d, e, f);
  } else {
  fill(d, e, f);
  }
  fill(d, e, f);
 rect(140, -50, 40, 250);
 rect(100, 10, 120, 25);
 triangle(180, 200, 140, 190, 150, 240);

    }
}


void drawDiamondRain(float x, float y) {
  fill(#19E5E0);
  quad(x, y, x - 30, y + 40, x, y + 80, x + 30, y + 40);
}
