
int counter;
int width = 256;
int height = 256;

void setup() {  //setup function called initially, only once
  size(width, height);
  background(255, 255, 255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
}

void keyPressed() {
    if (key == 'c' || key == 'C') {
        background(255, 0, 0);
    }
    
    if (key == 'x') {
        for (int y = 0; y < height; y++) {
            for (int x = 0; x < width; x++) {
                  color pixelColor = color(35,35,35);
                  if ((x%8)==0) {
                      line(x, 0, x, height);
                      stroke(126);
                  }
                  if ((y*8)==0) {
                      line(0,y,width,y);
                      stroke(230);
                  }
            }
        }
    }
}

                
                                
