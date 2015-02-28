
int x, y; 
int w = 10;  //BrushSizeWidth
int h = 10;  //BrushSizeHeight
int r = 0;//Red
int g = 0;//Green
int b = 0;//Blue
int a = 255;//Alpha


void setup() {
  size(600, 600);
  noStroke();
  smooth();
  fill(r,g,b,a);
  background(255);
} 

void mouseDragged(){
  fill(r,g,b,a);
  ellipse(mouseX, mouseY, w, h);
}

void draw() {
}

void keyPressed() {
switch(key) {
    case 'D':  //AllDelete
      background(255);
      break;
    case 'w':  //PenSizeWidth+
      w = w + 5;
      break;
    case 'W':  //PenSizeWidth-
      w = w - 5;
      break;
    case 'h':  //PenSizeHeight+
      h = h + 5;
      break;
    case 'H':  //PenSizeHeight-
      h = h - 5;
      break;
    case 'a':  //Alpha+
      a = a + 5;
      break;
    case 'A':  //Alpha-
      a = a - 5;
      break;
    case'e':  //EraserMode
      r = 255;
      g = 255;
      b = 255;
      a = 255;
      break;
    case'd':  //DefaltMode
      r = 0;
      g = 0;
      b = 0;
      a = 255;
      w = 10;
      h = 10;
      break;
    case'R':  //RedMode
      r = 255;
      g = 0;
      b = 0;
      break;
    case'r':  //+RedMode
      r = r + 5;
      break;
    case't':  //+RedMode
      r = r - 5;
      break;
    case'G':  //GreenMode
      r = 0;
      g = 255;
      b = 0;
      break;
    case'g':  //+GreenMode
      g = g + 5;
      break;
    case'f':  //+GreenMode
      g = g - 5;
      break;
    case'B':  //BlueMode
      r = 0;
      g = 0;
      b = 255;
      break;
    case'b':  //BlueMode
      b = b + 5;
      break;
    case'v':  //BlueMode
      b = b - 5;
      break;
    }
}


