
/*
This demo shows three approaches to randomness
Click the mouse to cycle between 3 modes:
1. Random r, g, and b values, each between 0 and 255
2. rgb values change by +/- random(15)
3. Perlin noise used for gradual changes between 0 and 255

Nancy Doubleday 2013
*/

//PShape not fully implemented in JS, so use simple shapes

float r, g, b;
float offsetR = 0.0;
float offsetG = 1000.0;
float offsetB = 100000.0;
float increment = 0.005;

int noiseMode = 1; //1 is random 0-200, 2 is +/-10, 3 is Perlin noise

void setup() {
  size(600, 600, P2D);
  smooth();
  noStroke();
   r = g = b = 150;
  fill(r, g, b);
}

void draw() {
  //don't draw if mouse isn't engaged

 if (mouseX >10) 
  {
   
    if (noiseMode == 1) {
      //plain ol' random values
      r = random(0, 255);
      g = random(0, 255);
      b = random(0, 255);
    }
    else if (noiseMode == 2) { 
      //try smoothing them out  
      r = constrain(r + random(-15, 15), 0, 255);
      g = constrain(g + random(-15, 15), 0, 255);
      b = constrain(b + random(-15, 15), 0, 255);
    }
    else if (noiseMode==3) {
      //use Perlin noise
      r = map(noise(offsetR), 0, 1, 0, 255);
      g = map(noise(offsetG), 0, 1, 0, 255);
      b = map(noise(offsetB), 0, 1, 0, 255);
      offsetR += increment;
      offsetG += increment;
      offsetB += increment;
    } 

    //bit shifting would probably be more efficient 
    fill(unhex(hex(color(r, g, b ))));
    
    
  ellipse( mouseX, mouseY, 100, 100);

  }
}

void mouseClicked() {
  noiseMode += 1;
  if (noiseMode > 3) noiseMode = 1;
}



