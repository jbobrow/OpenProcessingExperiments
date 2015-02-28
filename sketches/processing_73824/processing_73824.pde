
int paintbrush = 1;
int circlenum = 0;
int colone = 1;
int coltwo = 2;
int colthree = 3;
int col1 = 1;
int col2 = 2;
int col3 = 3;
int arone = 1;
int artwo = 2;
int [] coords = new int[1000000];
int [] colors = new int[3000000];
int arrayone = 1;
int arraytwo = 2;
void setup() {
  size(1500, 1500);
  smooth();
  noStroke();
  clean();
}

void clean() {
  background(255, 255, 255);
}

void draw() {
  if (paintbrush == 1) {
    fill(0, 255, 0);
    colors[colone] = 0;
    colors[coltwo] = 255;   
    colors[colthree] = 0;
    colone+=3;
    coltwo+=3;
    colthree+=3;
    circlenum +=1;
    ellipse(mouseX, mouseY, 20, 20); 
    coords[arrayone] = mouseX;
    coords[arraytwo] = mouseY;
    arrayone += 2;
  arraytwo += 2;
  }
  else if (paintbrush == 2) {
    float r = random(0, 255);
    float g = random(0, 255);
    float b = random(0, 255);
    float l = random(0, 20);
    float w = random(0, 20);
    colors[colone] = int(r);
    colors[coltwo] = int(g);
    colors[colthree] = int(b);
    colone+=3;
    coltwo+=3;
    colthree+=3;
    circlenum+=1;
    fill(r, g, b);
    ellipse(mouseX, mouseY, 20+l, 20+w);
    coords[arrayone] = mouseX;
    coords[arraytwo] = mouseY;
    arrayone += 2;
    arraytwo += 2;
  }
  else if (paintbrush == 3) {
    background(255, 255, 255);
    ellipse(mouseX, mouseY, 20, 20);
    for (int i = 0; i<circlenum; i++) {
      fill (0, 0, 0);
      ellipse(mouseX, mouseY, 20, 20);
      fill(colors[col1], colors[col2], colors[col3]);
      ellipse(coords[arone], coords[artwo], 20, 20);
      if (coords[arone]>mouseX) {
        coords[arone]-=1;
      }
      else {
        coords[arone]+=1;
      }
      if (coords[artwo]>mouseY) {
        coords[artwo]-=1;
      }
      else {
        coords[artwo]+=1;
      }
      arone+=2;
      artwo+=2;
      col1+=3;
      col2+=3;
      col3+=3;
    }
  }
  else {
    paintbrush =1;
  }
}
void keyPressed() {
  if (key == 'r') {
    clean();
  }

  else if (key == 'q') { 
    if (paintbrush>1) {
      paintbrush -= 1;
    } 
    else {
    }
  }

  else if (key == 'e') {
    if (paintbrush<4) {
      paintbrush+=1;
    }
    else {
    }
  }
  else {
  }
}

