
int index  = 0;
int lines[][];

void setup () {
  size(250, 250);
  lines = new int[255][2];
}

void draw () {
  //background(204); 
  if (lines[1][0] != 0) {
    for (int i = 0; lines[i+1][0] != 0; i++) {
      line(lines[i][0], lines[i][1], lines[i+1][0], lines[i+1][1]);
    }
  }
}

void mousePressed() {
  if (mouseX + mouseY > 0) {
    lines[index][0] = mouseX;
    lines[index][1] = mouseY;
    index++;
  }
}

