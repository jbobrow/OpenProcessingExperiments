
PImage img, comparedImg;
int imgWidth = 320, imgHeight = 240;
color[][] loadedColor = new color[imgWidth+1][imgHeight];
color loadedColorDump, loadedColorTemp;
int sqSize = 2;
int numKeyPressed=0;

void setup() {
  size (640, 480);
  img = loadImage("image1-320.jpg");
  loadedColor[imgWidth][imgHeight-1] = 0;
  getColorData ();
}
int i=0, row=-10;
void draw() {

  if (i%imgWidth == 0) {
    println("change row, row: "+row);
    if (row < imgHeight) {
      row+=10;
    }
  }
  i++;
  if (row < imgHeight) {
    for (int i = 0; i< 10; i++){
    sortColorData(row+i);
    }}
}

void getColorData () {
  noStroke();
  for (int i = 0; i < imgWidth; i++) {
    for (int j = 0; j < imgHeight; j++) {
      loadedColorDump = img.get(i, j);
      loadedColor[i][j] = int(red(loadedColorDump));
      //createImg(i, j);
      if (i<imgWidth) {  
        fill(loadedColor[i][j]);
        rect(2*i, 2*j, 2, 2);
      }
    }
  }
}

void sortColorData (int row) {
  int dump;
  int j = row;
  for (int i = 0; i< imgWidth ; i++) {
    //    println(loadedColor[i][j]);

    //pick first one and compare
    if (i<imgWidth-1) { 
      if (loadedColor[i][j] > loadedColor[i+1][j]) {
        //       println("true");
        dump = loadedColor[i][j];
        loadedColor[i][j] = loadedColor[i+1][j];
        loadedColor[i+1][j] = dump;
      }
      //       else println("false");
    }
    fill(loadedColor[i][j]);
    rect(2*i, 2*j, 2, 2);

    //  for (int i = 0; i < imgWidth; i++) {
    //    for (int j = 0; j < imgHeight; j++) {
    //      if (loadedColor[i][j] < loadedColor[i+1][j] ) {
    //        loadedColorTemp = loadedColor[i][j];
    //        loadedColor[i+1][j] = loadedColorTemp;
    //        loadedColor[i][j] = loadedColor[i+1][j];
    //        createImg(i,j);
    //      }
    //    }
    //  }
  }
}
void createImg (int i, int j) {
  fill(loadedColor[i][j]);
  rect(i*sqSize, j*sqSize, sqSize, sqSize);
}


