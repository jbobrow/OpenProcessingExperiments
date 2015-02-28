
import codeanticode.gsvideo.*;

int numPixels;
int[] previousFrame;
GSCapture video;

void setup() {
  size(640, 480); 
  video = new GSCapture(this, width, height, 24);
  numPixels = video.width * video.height;
 
  previousFrame = new int[numPixels];
  loadPixels();
}

void draw() {
  if (video.available()) {
    video.read(); 
    video.loadPixels();
    
    int movementSum = 0; 
    for (int i = 0; i < numPixels; i++) { 
      color currColor = video.pixels[i];
      color prevColor = previousFrame[i];
      
      int currR = (currColor >> 16) & 0xFF; 
      int currG = (currColor >> 8) & 0xFF;
      int currB = currColor & 0xFF;
     
      int prevR = (prevColor >> 16) & 0xFF;
      int prevG = (prevColor >> 8) & 0xFF;
      int prevB = prevColor & 0xFF;
      
      int diffR = abs(currR - prevR);
      int diffG = abs(currG - prevG);
      int diffB = abs(currB - prevB);
      
      movementSum += diffR + diffG + diffB;
      
      //pixels[i] = color(diffR, diffG, diffB);
      // The following line is much faster, but more confusing to read
      pixels[i] = 0xff000000 | (diffR << 16) | (diffG << 8) | diffB;
      previousFrame[i] = currColor;
    }
      if (movementSum > 0) {
      updatePixels();
      println(movementSum);
    }
  }
}

