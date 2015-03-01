
import java.util.Date;

long lastClicked;
int clickTime = 300;

int imageDimension = 800;
int gutter = 20;

ImageArea leftImage;
ImageArea rightImage;
int whichImage;

String folders;


void setup() {
  size(2*imageDimension + 3*gutter, imageDimension + 2*gutter);

  if (frame != null) {
    frame.setResizable(true);
  }

  leftImage = new ImageArea(gutter, gutter, imageDimension);
  rightImage = new ImageArea(imageDimension + 2*gutter, gutter, imageDimension);

  Date d = new Date();
  long timestamp = d.getTime(); 
  String date = new java.text.SimpleDateFormat("yyyyMM").format(timestamp);
  folders = "/users/danielsoltis/Desktop/stereo/" + date + "/";
}

void draw() {
  background(0);

  leftImage.displayImage();
  rightImage.displayImage();

  if (mousePressed) {
    if (mouseX < rightImage.position.x) leftImage.updateVertex(mouseX, mouseY);
    else rightImage.updateVertex(mouseX, mouseY);
  }

  //something is wrong with the height of the window, this forces the frame at the bottom
  noStroke();
  fill(0);
  rect(0, height-gutter, width, gutter);
}

// double click detection
void mouseClicked() {
  long now = millis();
  if (now - lastClicked < clickTime) {
    if (mouseX < width/2) whichImage = 0;
    else whichImage = 1;
    selectInput("Select a file to process:", "fileSelected");
    lastClicked = 0;
  }
  else lastClicked = now;
}

//loads the image and resizes the longest edge to imageDimension
void fileSelected(File selection) {
  if (selection == null) {
  } 
  else {
    String imageName = selection.getName();
    PImage img = loadImage(selection.getAbsolutePath());
    if (img!= null) {
      if (img.width > img.height) img.resize(imageDimension, 0);
      else img.resize(0, imageDimension);
      if (whichImage == 0) leftImage.newImage(img);
      else rightImage.newImage(img);
      resizeWindow();
    }
  }
}

//adjusts the position and size of the images so they meet up at the selected vertices
void keyPressed() {
  if (key == ' ') {
    rightImage.alignVertex(leftImage);
    leftImage.resizeFromOtherOffset(rightImage);
    resizeWindow();
  }

  //save the screen
  if (key == 's') {
    Date d = new Date();
    long timestamp = d.getTime(); 
    String date = new java.text.SimpleDateFormat("yyyyMMddhhmm").format(timestamp); 
    save(folders + "" + date + "_stereo.png");
  }
}

//resizes the window to fit the imges
void resizeWindow() {
  if (leftImage.croppedImage != null && rightImage.croppedImage != null) {
    rightImage.setXPosition(2*gutter + leftImage.getWidth());
    int w = 3*gutter + leftImage.getWidth() + rightImage.getWidth();
    int h = 2*gutter + max(leftImage.getHeight(), rightImage.getHeight());
    frame.setSize(w, h);
  }
}

class ImageArea {
  PImage img;
  PImage croppedImage;
  
  PVector position;
  PVector offset;
  PVector vertex;
  int imageDimension;
  
  boolean vertexVisible = false;

  ImageArea(int _x, int _y, int _d) {
    imageDimension = _d;
    position = new PVector(_x, _y);
    offset = new PVector(0, 0);
    vertex = new PVector(imageDimension/2, imageDimension/2);
  }

  void displayImage() {
    fill(0);
    noStroke();

    if (croppedImage!=null) {
      image(croppedImage, position.x, position.y);
      fill(255, 255, 0, 127);
      noStroke();
      if (vertexVisible) ellipse(position.x - offset.x + vertex.x, position.y - offset.y + vertex.y, 10, 10);
    }
    else {
      fill(255);
      text("double click to load an image", position.x + imageDimension/2 - 40, position.y + imageDimension/2);
    }
  }

  void newImage(PImage _img) {
    img = _img;
    croppedImage = new PImage(img.width, img.height);
    croppedImage.copy(img, 0, 0, img.width, img.height, 0, 0, img.width, img.height);
    vertex.x = img.width/2;
    vertex.y = img.height/2;
    offset.x = 0;
    offset.y = 0;
    vertexVisible = false;
  }

  void updateVertex(float _x, float _y) {
    vertex.x = _x + offset.x - position.x;
    vertex.y = _y + offset.y - position.y;
    vertexVisible = true;
  }

  void alignVertex(ImageArea _i) {
    offset.x = vertex.x - _i.vertex.x;
    offset.y = vertex.y - _i.vertex.y;

    int leftX = 0;
    int newWidth = 0;
    int topY = 0;
    int newHeight = 0;

    if (offset.x > 0) leftX = int(offset.x);
    else leftX = 0;

    if (offset.y > 0) topY = int(offset.y);
    else topY = 0;

    newWidth = int(img.width - abs(offset.x));
    newHeight = int(img.height - abs(offset.y));

    croppedImage = new PImage(newWidth, newHeight);
    croppedImage.copy(img, leftX, topY, newWidth, newHeight, 0, 0, newWidth, newHeight);
    vertexVisible = false;
  }

  void resizeFromOtherOffset(ImageArea _i) {

    int leftX = 0;
    int newWidth = 0;
    int topY = 0;
    int newHeight = 0;

    if (_i.offset.x < 0) leftX = -int(_i.offset.x);
    else leftX = 0;

    if (_i.offset.y < 0) topY = -int(_i.offset.y);
    else topY = 0;

    newWidth = int(img.width - abs(_i.offset.x));
    newHeight = int(img.height - abs(_i.offset.y));

    croppedImage = new PImage(newWidth, newHeight);
    croppedImage.copy(img, leftX, topY, newWidth, newHeight, 0, 0, newWidth, newHeight);
    vertexVisible = false;
  }

  void setXPosition(int _x) {
    position.x = _x;
  }

  int getWidth() {
    if (croppedImage!=null) return croppedImage.width;
    else return 0;
  }

  int getHeight() {
    if (croppedImage!=null) return croppedImage.height;
    else return 0;
  }
}



