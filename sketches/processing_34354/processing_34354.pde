
class PointImage {


  //////////////////////////////global variables
  int values[][];
  
  PImage imgC;
  String strng;
  String label;

  float zVal;
  PImage img;

  TColor colour;

  /////////////////////////////constructor
  PointImage(String _string, String _label, float _zVal, TColor _colour) {
    strng = _string ;
    label = _label;
    zVal = _zVal;
    colour = _colour;
  } 


  ////////////////////////////function
  void run() {
    fromPicture();
    //showImage();
    displayPts();
    makeGrid();
    showLabel();
    altPixels();
  }

  void displayPts() {

    stroke(255, 0, 0);

    for (int i=0; i<img.width; i++) {
      for (int j=0; j<img.height; j++) {
        stroke(colour.toARGB());
        //stroke((values[i][j]), (values[i][j]), (values[i][j]), 50);
        point (i*gridSize, j*gridSize, values[i][j]+zVal);
      }
    }
  }

  void fromPicture() {

    img = loadImage(strng);
    //specify limit
    values = new int[img.width][img.height];

    if (img != null) {
      img.loadPixels();
      for (int i=0; i<img.width; i++) {
        for (int j=0; j<img.height; j++) {
          color pixel = img.get(i, j);
          values[i][j] = int(brightness(pixel)*1);
        }
      }
    }
  }


  void showImage() {
    pushMatrix();
    translate(0, 0, zVal);
    scale(gridSize);
    fill(0, 0, 0, 50);
    image(img, 0, 0);
    popMatrix();
  }



  void makeGrid() {

    for (int x =0; x<img.width-1; x++) {
      for (int y =0; y<img.height-1; y+=2) {

        beginShape();
        strokeWeight(.8);
        //stroke(255, 255, 255, 50);
        tint(colour.toARGB());
        stroke((values[x][y])*colour.red(), (values[x][y])*colour.green(), (values[x][y])*colour.blue(), 100);
        noFill();
        //fill(r*(255-values[x][y]), g*(255-values[x][y]), b*(255-values[x][y]), 50);
        vertex(x*gridSize, y*gridSize, values[x][y]+zVal);
        vertex((x+1)*gridSize, y*gridSize, values[x+1][y]+zVal );
        //vertex((x+1)*gridSize, (y+1)*gridSize, values[x+1][y+1]+zVal );
        //vertex(x*gridSize, (y+1)*gridSize, values[x][y+1]+zVal );
        endShape(CLOSE);
      }
    }
  }


  void showLabel() {
    pushMatrix();
    textFont(font);
    translate(0, 0, zVal);
    fill(colour.toARGB());
    text(label, 0, 0);
    popMatrix();
  }


  void altPixels() {
     //imgC = createImage(img.width, img.height, RGB);
  }
}

