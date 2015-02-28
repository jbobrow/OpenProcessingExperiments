


boolean clear = false;
PImage solid;
PImage liquid;
PImage gas;
boolean colorMeter = false;
int oilX;
int oilY;
boolean addOil = false;
boolean images = false;
boolean molecules = true;
color oxygen = color(0x99,0x33,0x33);
int blurN = 0;

void setup () {
  size(500, 500);
  background(#000000);
  solid = loadImage("http://tvjrennie.files.wordpress.com/2010/05/icecube-melt1.jpg", "jpg");
  liquid = loadImage("http://www.backdrops.co.uk/uploaded_images/liquid_8.jpg", "jpg");
  gas = loadImage("http://static.howstuffworks.com/gif/wash-and-dry-with-steam-2.jpg", "jpg");
  oilX = width/2;
  oilY = height;
}

void draw() {
  int r = (int) (map(mouseX, 0, width, 0, 70));
  int n = (int) (map(mouseX, 0, width, 20, 7));
  background(#000000);
  if (!clear) {
    if (images) {
      if (mouseX < width/3) {
        image(solid, 0, 0, width, height);
      }
      else if (mouseX < 2*width/3) {
        image(liquid, 0, 0);
      }
      else {
        image(gas, 0, 0, width, height);
      }
    } 
    if (molecules) {
      for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
          int waterX = width/(2*n) + i*width/n;
          int waterY = height/(2*n) + j*height/n;
          if(addOil) {
            
             if(abs(waterX-oilX) < 50 && abs(waterY-oilY) < 20) {
             waterX += (int) random(5) + (50-abs(waterX-oilX)) - 40;
            waterY += (int) random(5) + (50-abs(waterX-oilX)) - 40;
          } 
          }
          water(waterX + (int)random(r), 
          waterY + (int)random(r), 1);
          if(addOil) {
          oil();
          }
        }
      }
    }
    if(colorMeter) {
      fill(#000000);
      stroke(#ffffff);
      rect(0,height-20,width, height-20, width, 20);
      colorMode(HSB,width+100);
      for(int i = 0; i < mouseX; i++) {
        stroke(width-i, 3*width/4 + i, width/2 + i);
        line(i,height-20,i,height);
      }
      colorMode(RGB, 256);
      noStroke();
    }
  }
  if(key == 'b') {
  filter(BLUR,++blurN);
  blurN %= 10;
  }
  
}

void keyPressed() {
  if (key == ' ') {
    clear = true;
  }
  if(key =='s') {
    clear = false;
}
  if(key == '3') {
    noLoop();
  }
  if(key =='4') {
    loop();
  }
  if(key =='5') {
    colorMeter = !colorMeter;
  }
  if(key =='o') {
    oilY = height;
    addOil = true;
  }
  if(key =='1') {
    images = true;
  }
  if(key =='2') {
    molecules = true;
  }
  if(key =='0') {
    oxygen = color((int)random(0xff),(int)random(0xff),(int)random(0xff));
  }
}

void water(int x, int y, int sc) {
  noStroke();
  smooth();
  fill(#eeeeee);
  ellipse(x-5*sc, y+4*sc, 6*sc, 6*sc);
  ellipse(x+5*sc, y+4*sc, 6*sc, 6*sc);
  fill(oxygen);
  ellipse(x, y, 10*sc, 10*sc);
}

void oil() {
  fill(0xFC, 0xE4, 0x59, 50);
  ellipse(oilX,oilY,15,15);
  if(frameCount % 1000 == 0) {
  oilY--;
  }
  
}


