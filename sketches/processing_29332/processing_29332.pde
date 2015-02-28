
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
        background(0x000000);
        if (mouseX <= 0 && mouseY <= 0)
            return;
        fill(0xFF0000);
        for (int i = 0; i < width / 8; i++) {
            int w = (int) random(width);
            int h = (int) random(height);
            stroke(sin(w / (float) width) * 255,
                    255 - sin(w / (float) width) * 255,
                    sin(h / (float) height) * 255, 128);
            bezier(w, h, width / 2, height / 2, width / 2, height / 2, mouseX,
                    mouseY);
        }
}

                
                
