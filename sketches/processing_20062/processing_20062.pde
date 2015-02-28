
//Xuan Li
//LEMONPIXELS

PImage img, imgM;

//int cellsize = 10;
int cellsizeM = 10;
int columns, rows;
int columnsM, rowsM;

int currR, currG, currB, a = 255;
color c;

float distM = 0;

void setup() {
  size(900,540, P3D);
  background(255);
  noStroke();
  //smooth();

  img = loadImage("lemon.jpg");
  imgM = img;

  //columns = img.width/ cellsize;
  //rows = img.height/ cellsize;

  //columnsM = columns;
  //rowsM = rows;

  
  a = a << 24;
}

float centerX, centerY;
float amp;
boolean coloring = false;
int hotZone = 50;

void draw() {

  background(250, 250, 250);
  pushMatrix();
  translate(50, 0, -30);
  image(img, 0, 0);
  popMatrix();


  for(int y = 0; y < 50; y += 10) {
    for (int x = 0; x < 71; x += 10) {

      centerX = x;
      centerY = y;
      distM = dist(mouseX, mouseY, centerX*10 + 105, centerY*10 + 50);

      if (distM < hotZone) {

        amp = map(distM, 0, hotZone, 0, 50);
        coloring = true;

        //for debugging
        ellipse(centerX*10 + 105, centerY*10 + 50, 20, 20);
      } 
      else {
        coloring = false;
        amp = 1;
      }

      expMicro(x, y, x+10, y+10, amp, coloring);
    }
  }

  //expMicro(8, 0, 80, 53); //full image
}

float z;
void expMicro(int startX, int startY, int columnsM, int rowsM, float amp, boolean coloring) {


  for ( int i = startX; i < columnsM; i++) {
    // Begin loop for rows
    for ( int j = startY; j < rowsM; j++) {

      int x = i*cellsizeM + cellsizeM/2;  // x position
      int y = j*cellsizeM + cellsizeM/2;  // y position
      int loc = x + y*imgM.width;  // Pixel array location


      currR = (imgM.pixels[loc] >> 16) & 0xFF;
      currG = (imgM.pixels[loc] >> 8) & 0xFF;
      currB = (imgM.pixels[loc]) & 0xFF;      
      currR = currR << 16;
      currG = currG << 8;

      if (mouseX < 300) {
        c = a | currR & currG | currB;
      } 
      if (mouseX >= 300 && mouseX < 500) {
        c = a | currR | currG & currB;
      }
      if (mouseX >= 500 && mouseX < 800) {
        c =  a | currR | currG | currB;
      } 
      else if (mouseX >= 800) {
        c = a | currG;
      }
      //equivalent to c = color(currR, currG, currB);

      // Calculate a z position as a function of mouseX and pixel brightness
      z = ((mouseY-40) / float(width)) * brightness(imgM.pixels[loc]) - 20.0;

      if (coloring) {
        fill(color(random(100,150), random(200, 255), random(200, 255)), 200);
        z = z + amp;
      } 
      else {
        fill(c, 220);
      }

      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x+55, y+5, z);

      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsizeM, cellsizeM);
      popMatrix();
    }
  }
}

void mouseClicked() {

  hotZone = (hotZone + 50) % 500;
}


