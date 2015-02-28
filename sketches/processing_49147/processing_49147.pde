

PImage img;
int cellsize =8;
int columns, rows;
PFont myfont;

void setup() {
  size(1024, 768, P3D);
  img = loadImage("data/fruits.jpg");
  myfont = createFont("Futura", 160);
  //myfont = createFont("小塚ゴシック pro", 96);
  columns = img.width / cellsize;
  rows = img.height / cellsize;
}

void draw() {
  background(255);
  rotateY(0.0);

  if (mousePressed) {
    stroke(255, 160, 160);
    noFill();
    line(50, 630, 1000, 630);
    line(1000, 630, 980, 610);
    line(1000, 630, 980, 650);
    ellipse(mouseX, 630, 30, 30);
    for ( int i = 0; i < columns; i++) {
      for ( int j = 0; j < rows; j++) {
        int x = i*cellsize + cellsize/2; 
        int y = j*cellsize + cellsize/2; 
        int loc = x + y*img.width;
        color c = img.pixels[loc];
        float z = (mouseX / float(width)) * blue(img.pixels[loc])/5 - 14.0;
        pushMatrix();
        translate(x + 295, y + 150, z * 90);
        
        fill(c, 190);
        noStroke();
        
        rotateY(cos(i + 1.0) * (millis() / 1000.0) * PI);
        textFont(myfont, 12.0);      
        text("fruits", cellsize, cellsize, z*10);
      
        popMatrix();
      }
    }
  }


  else {
    stroke(255, 160, 160);
    line(50, 630, 1000, 630);
    line(1000, 630, 980, 610);
    line(1000, 630, 980, 650);
    fill(255, 160, 160, 190);
    ellipse(50, 630, 30, 30);
    for ( int i = 0; i < columns; i++) {
      for ( int j = 0; j < rows; j++) {
        int x = i*cellsize + cellsize/2;  
        int y = j*cellsize + cellsize/2;
        int loc = x + y*img.width; 
        color c = img.pixels[loc]; 
        float z = -14;
        pushMatrix();
        translate(x + 295, y + 150, z * 90);

        fill(c, 190);
        noStroke();
        textFont(myfont, 12.0);
        text("fruits", cellsize, cellsize, z*10);
        popMatrix();
      }
    }
  }
}


