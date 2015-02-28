




int frame; // The frame to display
PImage[] images = new PImage[10]; // Image array




float y = 0;



void setup() {
  size(330,500);
  smooth();
  frame = 0;
  images[0] = loadImage("folders1.png");
  images[1] = loadImage("folders2.png");
  images[2] = loadImage("folders3.png");
  images[3] = loadImage("folders4.png");
  images[4] = loadImage("folders5.png");
  images[5] = loadImage("folders6.png");
  images[6] = loadImage("folders7.png");
  images[7] = loadImage("folders8.png");
  images[8] = loadImage("folders9.png");
  images[9] = loadImage("folders10.png");
}




void draw() {

  background(225);
  noStroke();
  
      if (frame == 0) {
         // main folder
    image(images[9], 0, y);

    if (mousePressed) {
      if (mouseX<200 && mouseX>130 && mouseY>275 && mouseY<330) {
        frame++;
      }
    }
  }

  
    if (frame == 1) {

    image(images[0], 0, y);

    if (mousePressed) {
      if (mouseX<90 && mouseX>20 && mouseY>275 && mouseY<330) {
        frame++;
      }
    }
  }
  
    if (frame == 2) {
    image(images[1], 0, y);

    if (mousePressed) {
      if (mouseX<90 && mouseX>20 && mouseY>385 && mouseY<435) {
        frame ++;
   
      }
    }
  }
  
      if (frame == 3) {
    image(images[2], 0, y);

    if (mousePressed) {
      if (mouseX<305 && mouseX>235 && mouseY>160 && mouseY<215) {
        frame ++;
   
      }
    }
  }
  
        if (frame == 4) {
    image(images[3], 0, y);

    if (mousePressed) {
      if (mouseX<90 && mouseX>20 && mouseY>55 && mouseY<105) {
        frame ++;
   
      }
    }
  }
  
        if (frame == 5) {
    image(images[4], 0, y);

    if (mousePressed) {
      if (mouseX<300 && mouseX>235 && mouseY>270 && mouseY<330) {
        frame ++;
   
      }
    }
  }
  
        if (frame == 6) {
    image(images[5], 0, y);

    if (mousePressed) {
      if (mouseX<90 && mouseX>20 && mouseY>165 && mouseY<215) {
        frame ++;
   
      }
    }
  }
  
        if (frame == 7) {
    image(images[6], 0, y);

    if (mousePressed) {
      if (mouseX<195 && mouseX>130 && mouseY>55 && mouseY<105) {
        frame ++;
   
      }
    }
  }
  
        if (frame == 8) {
    image(images[7], 0, y);

    if (mousePressed) {
      if (mouseX<305 && mouseX>240 && mouseY>380 && mouseY<440) {
        frame ++;
   
      }
    }
  }
  
         if (frame ==9) {
    image(images[8], 0, y);

    if (mousePressed) {
      if (mouseX<190 && mouseX>125 && mouseY>155 && mouseY<210) {
        frame = frame - 8;
   
      }
    }
  }
  

  
  
  
}

void keyPressed() {
  if (key==' ') {
    if (frame >= 10)
      frame = 10;
    else
      frame++;
  }
}



