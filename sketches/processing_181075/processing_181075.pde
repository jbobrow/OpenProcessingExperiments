
//Goes Section by section (defined by boundMin and boundMax, advanced by the for loops)
//And takes (array length) number of points and draws lines between them. The color of the first point
//becomes the color of the line

// length of array affects number of points drawn, more generally results in a harsher image.
Point[] points = new Point[3];
PImage img;
int boundMin = 0; 
int boundMax = 100;

void setup() {
  img = loadImage("face.jpg");
  //change to img.width, img.height, just had to change for JavaScript
  size(520, 375);
  for (int i = 0; i<points.length; i++) {
    points[i] = new Point(0, 0);
  }
  smooth();
  background(255);
}

void draw() {
  img.loadPixels();
  //Section advancement, width then height
  for ( int i = 0; i < height-boundMax; i+=1) {
    for ( int j = 0; j < width-boundMax; j+=1) {
      
      //Setting random points within the boundaries 
      for ( int k = 0; k < points.length; k++) {
        points[k] = new Point(int(random(boundMin+j, boundMax + j)), int(random(boundMin + i, boundMax + i)));
        points[k].colorSet();
      }

      //creating the connections bounding from point to point
      //robust enough to do as many points as desired as far as I could see
      for (int l = 0; l<points.length-1; l++) {
        for (int m = l+1; m<points.length; m++) {

          color average = points[l].c;
          stroke(average);
          line(points[l].location.x, points[l].location.y, points[m].location.x, points[m].location.y);
        }
      }
    }
  }
  
  //saves and stops looping
  save("rendered.jpg");
  noLoop();
}

class Point{
  PVector location;
  int x,y;
  color c;
  int loc;
  
  Point(int x_, int y_){
    location = new PVector(x_, y_);
    x= x_;
    y=y_;
  }
  
  void colorSet(){
    loc = x + y*width;
    c = img.pixels[loc];
  } 
}


