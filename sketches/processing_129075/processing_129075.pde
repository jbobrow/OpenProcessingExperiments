
float xstart, xnoise, ynoise; 

void setup() { 
 for (float b = 1;b < 10; b++) {
  
 size(770,202);

 smooth();

 background(255);

 xstart = random(10);

 xnoise = xstart;

 ynoise = random(10);

 for (int y = 0; y <= height; y+=5) { 

 ynoise += 0.1; 

 xnoise = xstart; 

 for (int x = 0; x <= width; x+=5) { 

 xnoise += 0.1; 

 drawPoint(x, y, noise(xnoise, ynoise)); 

 }

 } 
saveFrame("Bild"+b+".png");
}
}

void drawPoint(float x, float y, float noiseFactor) { 

 float len = 10 * noiseFactor;

 rect(x, y, len, len);

}

