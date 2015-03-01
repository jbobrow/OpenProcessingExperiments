
    float contador = 0;

    void setup() {
      size(400, 300);
      noFill();
      strokeWeight(3);
      colorMode(HSB, 100);
      background(0);
      frameRate(1);
    }

    void draw() {
      int m =millis();
      if (contador < 12) {
        escena1();
      }
      else if (contador < 24) {
        escena2();
      }
      else if (contador < 36) {
        escena3();
      }
      else {
        contador = 0;
      }
      contador++;
    }

    void escena1() {
      loadPixels();  
      // Loop through every pixel column
      for (int x = 0; x < width; x++) {
        // Loop through every pixel row
        for (int y = 0; y < height; y++) {
          // Use the formula to find the 1D location
          int loc = x + y * width;
          float h = noise((x-y*sin(millis()/1000)*cos(y/10))/10)*100;
          float s = 50 + noise((x-y*sin(millis()/1000))/10)*50;
          float b = noise((x-y*sin(millis()/1000)*cos(y))/10)*100;
          pixels[loc] = color(h, s, b);
        }
      }
      updatePixels();
    }

     
    void escena2() {
      loadPixels();  
      // Loop through every pixel column
      for (int x = 0; x < width; x++) {
        // Loop through every pixel row
        for (int y = 0; y < height; y++) {
          // Use the formula to find the 1D location
          int loc = x + y * width;
          float h = 50 + noise((x-y*sin(millis()/1000))/10)*50;
          float s = noise((x-y*sin(millis()/1000)*cos(y/10))/10)*100;
          float b = noise((x-y*sin(millis()/1000)*cos(y))/10)*100;
          pixels[loc] = color(h, s, b);
        }
      }
      updatePixels();
    }


    void escena3() {
      loadPixels();  
      // Loop through every pixel column
      for (int x = 0; x < width; x++) {
        // Loop through every pixel row
        for (int y = 0; y < height; y++) {
          // Use the formula to find the 1D location
          int loc = x + y * width;
          float h = 25 + noise((x+y*sin(millis()/1000)+sin(y)))*50;
          float s = noise((x-y*sin(millis()/1000)*cos(y))/10)*100;
          float b = noise((x-y*sin(millis()/1000)*cos(y/10))/10)*100;
          pixels[loc] = color(h, s, b);
        }
      }
      updatePixels();
    }
