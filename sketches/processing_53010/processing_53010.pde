
int border = 50;

// increment creates direction of segement
int[][] increment = {{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}};
int xInc, yInc;
int xPos, yPos;

// length of segemtns when "nervous" or "calm" (in frames)
int nervousLen = 2; // mulitplied by 3 for pixels
int calmLen = 50;

void setup() {
  size(550, 550);
  background(255);
  frameRate(30);
  smooth();
  stroke(0);
  xPos = width/2;
  yPos = height/2;
}

void draw() {
  
  // nervous segements
  if (frameCount % 1800 <= 900 && frameCount % nervousLen == 0) {
    int rnd = int(random(8));
    xInc = increment[rnd][0] * 3;
    yInc = increment[rnd][1] * 3;
    strokeWeight(random(1, 5)); // new stroke weight for each segment
  }
  // calm segments
  else if (frameCount % 1800 > 900 && frameCount % calmLen == 0) {
    int rnd = int(random(8));
    xInc = increment[rnd][0];
    yInc = increment[rnd][1];
  }
  
  xPos += xInc;
  xPos = constrain(xPos, border, width-border);
  yPos += yInc;
  yPos = constrain(yPos, border, height-border);
  
  point(xPos, yPos); // draw point
  point(width-xPos-1, height-yPos-1); // mirror the point
   
}

void keyPressed() {
  
  switch(key) {
    
    // clear image and restart at center
    case BACKSPACE:
      background(255);
      xPos = width/2;
      yPos = height/2;
      break;
      
    // add transparency and gradation
    case ' ':
      noStroke();
      fill(255, 10);
      rect(0, 0, width, height);
      stroke(0);
      break;
      
  // make every drawn pixel black
    case ENTER:
      loadPixels();
      for (int x = 0; x < width; x++) {
        for (int y = 0; y < height; y++) {
          int pixel = pixels[y*width+x];
          if (pixel != color(255)) {
            pixels[y*width+x] = color(0);
          }
        }
      }
      updatePixels();
      break;
      
  }
  
}

