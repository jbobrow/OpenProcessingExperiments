
//PImage img;
int striplength = 5;
int patternlength = 8;
int arraydepth = 3;

//temp values for the x and y positions to do calculations on
float mx;
float my;

color c;

//The main data structure
char[][][] pattern = new char[striplength][patternlength][arraydepth];

int time = 100;

void setup() {

  size(512, 512);
  noStroke();

  // fill array
  for (int i = 0; i<striplength; i++) {
    for ( int j =0; j<patternlength; j++) {
      for (int p=0; p<arraydepth; p++) {
        pattern[i][j][p]=255;
      }
    }
  }

 // img = loadImage("test.bmp");
}

void draw() {
  colorMode(RGB);

  background(0);

  //draw ellipse grid
  for (int i = 0; i<striplength; i++) {
    for ( int j =0; j<patternlength; j++) {
      noStroke();

      fill(pattern[i][j][0], pattern[i][j][1], pattern[i][j][2]);
      ellipse(30+i*50, 30+j*50, 20, 20);
    }
  }

  //draw spectrum

  for (int i=0; i<255; i++) {
    for (int j = 0; j<20; j++) {
      colorMode(HSB);
      stroke(i, 12*j, 255);
      point(i+255, j);
    }
  }

  for (int i=0; i<255; i++) {
    colorMode(HSB);
    stroke(i, 255, 255);
    line(i+255, 20, i+255, 40);
  }

  for (int i=0; i<255; i++) {
    for (int j = 40; j<60; j++) {
      colorMode(HSB);
      stroke(i, 255, 255-(12*(j-40)));
      point(i+255, j);
    }
  }


  //draw current selected node and pattern
  stroke(255);
  noFill();
  ellipse(30+mx*50, 30+my*50, 30, 30);
  rect(10, 10+my*50, 240, 40);
}


void mouseReleased() {
  c = get(mouseX, mouseY);

  if (mouseX<255) {
    if ( mouseY<50*patternlength) {

      //transforms pixel coordinates into array coordinates
      mx = mouseX;
      my = mouseY;
      mx = mx-20;
      mx = mx/50;
      mx = int(mx);
      my = my-20;
      my = my/50;
      my = int(my);
      print(mx);
      println(my);
    }
  }

  if (mouseX>255) {

    //fill array with color selected
    pattern[int(mx)][int(my)][0]=char(int(red(c)));
    pattern[int(mx)][int(my)][1]=char(int(green(c)));
    pattern[int(mx)][int(my)][2]=char(int(blue(c)));
  }
}

void keyPressed() {
  if (key == 's') {
    println("Sending now");
    //sending code
  }


  if (key == 'r') {
    println("Reset");
    for (int i = 0; i<striplength; i++) {
      for ( int j =0; j<patternlength; j++) {
        for (int p=0; p<arraydepth; p++) {
          pattern[i][j][p]=255;
        }
      }
    }
  }

 /* if (key == 'l') {
    img.loadPixels(); 
    for (int i = 0; i<striplength; i++) {
      for ( int j =0; j<patternlength; j++) {
        int loc = i + j*striplength;

        // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
        pattern[int(i)][int(j)][0] = char(int(red(img.pixels[loc])));
        pattern[int(i)][int(j)][1] = char(int(green(img.pixels[loc])));
        pattern[int(i)][int(j)][2] = char(int(blue(img.pixels[loc])));
      }
    }
  }*/
}

