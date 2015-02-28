
// janice pang
// november 7, 2013
// color theory: exploring complimentary colors

int w = 255; // width
int h = 650; // height
int div = 11; // size of sections

int alpha = 0; // opacity

int size = 10; // square size

//----------------color variables

int g = 100; // green
int b = 100; // blue


void setup() {
  size(w, h);
  noStroke();
  smooth();
}

void draw() {
  background(225);
  drawRect();
  //--------------small rectangle controls
  /* fill(255);
   rect(w/2, (h/2)-20, size, size);
   fill(215);
   rect(w/2, h/2, size, size);
   fill(170);
   rect(w/2, (h/2)+20, size, size);
   if (green) {
   g+=50;
   } */
  //fill(0);
  //triangle((w/2)-size,(h/2)-size,w/2,h/2,(w/2)+(size/2),(h/2)+(size/2));

  // ------------------- bottom half alpha
    if (keyPressed) { 
      if (keyCode == DOWN) {
        alpha+=3;
      }
      if (keyCode == UP) {
        alpha-=3;
      }

      // ------------------- green value
      if (key == 'g') {
        g++;
      }
      if (key == 'G') {
        g--;
      }

      // ------------------- blue value
      if (key == 'b') {
        b++;
      }
      if (key == 'B') {
        b--;
      }
}
}



void drawRect() {


  for (int i=0;i<width; i+=div) {
    //-------------------------------top half
    float distance = (abs(mouseX - i));
    float r = distance; // red
    fill(r, g, b);
    rectMode(CORNER);
    rect(i, 0, div, h/2);
    //-------------------------------bottom half
    fill(r, g, b, alpha);
    rect(i, h/2, div, h/2);
    }
  }
  
  void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("screen-####.jpg");
  }
}


