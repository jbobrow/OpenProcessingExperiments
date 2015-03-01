
class MyText {
  int x, y, size;
  int r, g, b;
  String subString;
  float dir;
  MyText(int _size) {
    x = (int)random(0, width); 
    y = (int)random(0, height);
    dir = 1;
    size = ARR_SIZE - _size;

    String artStr = "YeongHo Jeong";
    int strSize = artStr.length(); 
    int startIdx = (int)random(0, strSize);
    int printCount = (int)random(1, strSize - startIdx);
    int endIdx = startIdx+printCount;
    subString = artStr.substring(startIdx, endIdx);
    
    r = (int)random(0, 256);
    g = (int)random(0, 256);
    b = (int)random(0, 256);
  }

  void moveText() {
    textSize(size);
    if(dir == 1 && x >= width)
      dir = -1;
    else if(dir == -1 && x <= 0)
      dir = 1;
    int nX = (int)(x+size*0.001*mouseX*dir);
    fill(r,g,b);
    text(subString, nX, y);
    x = nX;
  }
}

final int ARR_SIZE = 100;
MyText[] myTextArr = new MyText[ARR_SIZE];

void setup() {
 size(600, 600);
background(255);
textFont(loadFont("STXingkai-SC-Light-48.vlw"));
  for(int i=0 ; i<ARR_SIZE ; i++) {
   myTextArr[i] = new MyText(ARR_SIZE-i); 
  }
  frameRate( 20 );
}

void draw() {
  background(0);
  for(int i=0 ; i<ARR_SIZE ; i++) {
    myTextArr[i].moveText();
  }
}


