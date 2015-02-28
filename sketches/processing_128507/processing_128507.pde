
/*Assignment 5
 
 Draws smoke using perlan noise
 Lines are drawn in random colors
 made y increment by i instead of 0.25
 
 Arturo Alviar
 1/13/14
 */

void setup() {
  size(600, 600);
  background(0);
  noLoop();
}

void draw() {
  float x, y, noiseX, noiseY, baseLine, noiseScale;
  stroke(random(0, 255), random(0, 255), random(0, 255), random(10, 20));
  strokeWeight(1);
  x = 0;
  y = height/4;
  noiseScale = 0.008;
  baseLine =random(0, 10);
  noiseY =random(0, 10);
  for (int i =0; i <200; i++) {
    y = height/4 + i;
    noiseY+=noiseScale;
    noiseX =baseLine;
    x = 0;
    while (x < width) {
      x += noise(noiseX+noiseY);
      y = y + (noise(noiseX, noiseY)*2 -1);
      point(x, y);
      noiseX+=noiseScale;
    }
  }
}

void keyReleased() {
  
  switch(key) {
    case 'r':
    redraw();
    break;
    
    case ' ':
    loop();
    break;
    
    case 'n':
    noLoop();
    break;
    
    case 's':
    saveFrame("aalviar_hw5b-####.png");
    break;
  }
} 



