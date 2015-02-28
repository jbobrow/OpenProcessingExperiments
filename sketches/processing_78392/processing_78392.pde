
float[] opacity = new float[36];
void setup () {
  size (635, 635);
  background(255);
  
    opacity[0] = 20;
  
}

void draw() {
 
  
  for (int x = 5; x < width; x+=105) {
  for (int y = 5; y < height; y+=105) {
    stroke(0);
    strokeWeight(10);
    fill(255, 255, 255, 0); //The last argument is called an "alpha channel", or opacity
    rect(x,y,100,100);
    
  }
  }
}
  void keyPressed() {
    float r = random(255);
    float g = random(255);
    float b = random(255);
    switch(key) {
      case 'a':
      fill(r, g, b);
      rect(5,5,100,100);
      break;
      case 'b':
      fill(r, g, b);
      rect(110,5,100,100);
      break;
      case 'c':
      fill(r, g, b);
      rect(215,5,100,100);
      break;
      case 'd':
      fill(r, g, b);
      rect(320,5,100,100);
      break;
      case 'e':
      fill(r, g, b);
      rect(425,5,100,100);
      break;
      case 'f':
      fill(r, g, b);
      rect(530,5,100,100);
      break;
       case 'g':
      fill(r, g, b);
      rect(5,110,100,100);
      break;
       case 'h':
      fill(r, g, b);
      rect(110,110,100,100);
      break;
       case 'i':
      fill(r, g, b);
      rect(215,110,100,100);
      break;
       case 'j':
      fill(r, g, b);
      rect(320,110,100,100);
      break;
       case 'k':
      fill(r, g, b);
      rect(425,110,100,100);
      break;
       case 'l':
      fill(r, g, b);
      rect(530,110,100,100);
      break;
       case 'm':
      fill(r, g, b);
      rect(5,215,100,100);
      break;
       case 'n':
      fill(r, g, b);
      rect(110,215,100,100);
      break;
       case 'o':
      fill(r, g, b);
      rect(215,215,100,100);
      break;
       case 'p':
      fill(r, g, b);
      rect(320,215,100,100);
      break;
       case 'q':
      fill(r, g, b);
      rect(425,215,100,100);
      break;
       case 'r':
      fill(r, g, b);
      rect(530,215,100,100);
      break;
      case 's':
      fill(r, g, b);
      rect(5,320,100,100);
      break;
       case 't':
      fill(r, g, b);
      rect(110,320,100,100);
      break;
       case 'u':
      fill(r, g, b);
      rect(215,320,100,100);
      break;
       case 'v':
      fill(r, g, b);
      rect(320,320,100,100);
      break;
       case 'w':
      fill(r, g, b);
      rect(425,320,100,100);
      break;
       case 'x':
      fill(r, g, b);
      rect(530,320,100,100);
      break;
      case 'y':
      fill(r, g, b);
      rect(5,425,100,100);
      break;
       case 'z':
      fill(r, g, b);
      rect(110,425,100,100);
      break;
       case '1':
      fill(r, g, b);
      rect(215,425,100,100);
      break;
       case '2':
      fill(r, g, b);
      rect(320,425,100,100);
      break;
       case '3':
      fill(r, g, b);
      rect(425,425,100,100);
      break;
       case '4':
      fill(r, g, b);
      rect(530,425,100,100);
      break;
      case '5':
      fill(r, g, b);
      rect(5,530,100,100);
      break;
       case '6':
      fill(r, g, b);
      rect(110,530,100,100);
      break;
       case '7':
      fill(r, g, b);
      rect(215,530,100,100);
      break;
       case '8':
      fill(r, g, b);
      rect(320,530,100,100);
      break;
       case '9':
      fill(r, g, b);
      rect(425,530,100,100);
      break;
       case '0':
      fill(r, g, b);
      rect(530,530,100,100);
      break;
      default:
      break;

}
  }

