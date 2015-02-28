
PImage img;
PImage imgCopy;
float xc;
float yc;
int xj = 0;
int yj = 0;
float xj2;
float yj2;
int xi = 0;
int yi = 0;
float w;
color c;

float distV;
float angleV;

float depth;
float mouseXVal;
float mouseYVal;

void setup() {
  size(400, 400);
  xc = width/2;
  yc = height/2;

  background(0);
  smooth();
  img = loadImage("eye.jpg");
  image(img,0,0);
  img.loadPixels();

  imgCopy = createImage(img.width, img.height, ARGB);
}

void draw() {
  
  //yc = xc = map(mouseY, 0, height, height, 0);
  xc = mouseX;
  yc = mouseY;
  
  //depth = map(mouseX, 0, width, 40.0, 0);
  depth = 40.0;

  for (yi = 1; yi <= height; yi++) {
    for (xi = 1; xi <= width; xi++) {

      distV = sqrt(pow((xi - xc), 2) + pow((yi - yc), 2));
      angleV = atan2((xi - xc), (yi - yc));
      if (yi < yc) {
        yj = floor(((distV + (depth * ((float)yi / yc))) * cos(angleV)) + yc);
      }
      else {
        yj = floor(((distV + (depth * ((float)yc / yi))) * cos(angleV)) + yc);
      }
      if (xi < xc) {
        xj = floor(((distV + (depth * ((float)xi / xc))) * sin(angleV)) + xc);
      }
      else {
        xj = floor(((distV + (depth * ((float)xc / xi))) * sin(angleV)) + xc);
      }

      c = img.get(xj, yj);
      imgCopy.set(xi, yi, c);
    };
  };
  image(imgCopy, 0, 0);
}


