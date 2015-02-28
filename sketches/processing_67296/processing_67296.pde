
// list of colors
PFont tits;
int[] colores = {
  10, 50, 90, 150
};

int[] tamano = {
  20, 40, 80, 100
};

int col; //store colors
int var; // change mov and var

void setup() {
  size(800, 600);
  background(50);
  tits = loadFont("Dialog-48.vlw");
  textFont(tits, 16);
  text("Please, press 1, 2, 3 or 4.", 20, 20);
}

void draw() {
  smooth();
  translate(width/2, height/2);

  for (float i=0; i<360; i += 0.9) {
    pushMatrix();
    rotate(radians(i));
    translate(100, 100);
    rotate(radians(i*3));
    stroke(20, 20, 50+i);
    rotate(col+20);
    drawEllipse();
    popMatrix();

    if (col>200) {
      col = col*-1;
    }
    else {    
      col = col+1;
    }

  }

  if (keyPressed) {
    if (key == '1') {
      col = colores[0];
      var = tamano[0];
    }
    if (key == '2') {
      col = colores[1];
      var = tamano[1];
    }
    if (key == '3') {
      col = colores[2];
      var = tamano[2];
    }
    if (key == '4') {
      col = colores[3];
      var = tamano[3];
    }
  }
}

void drawEllipse() {
  noFill();
  stroke(col+20, 30+col , 60+col , 30);
  ellipse(0, 0, col, col/2);
}


