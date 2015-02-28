




import hypermedia.video.*;
import java.awt.*;

OpenCV opencv;
Circle[] circle= new Circle[2000];
ArrayList flowers;

int threshold = 160;
int c = -1;
int gridX = 24;
int gridY = 14;

void setup() {
  size (1280, 720);
  frameRate(30);
  background(0);
  opencv = new OpenCV( this );
  opencv.capture(width, height);

  flowers = new ArrayList();
  flowers.add(new Circle (2*(width/gridX)+(width/gridX/2), 2*(height/gridY)+(height/gridY/2))); 
  backDots();
}
void backDots() {
  for (int i=0; i<gridX; i++) {
    for (int j=0;j<gridY;j++) {
      smooth();
      fill(100);
      noStroke();
      ellipse(i*(width/gridX)+(width/gridX/2), j*(height/gridY)+(height/gridY/2), 3, 3);
    }
  }
}

void draw() {
  background(0);

  // OpenCV reads images from cam.
  opencv.read();
  opencv.flip( OpenCV.FLIP_HORIZONTAL );
  opencv.absDiff();
  opencv.threshold(threshold);
  //  image( opencv.image(), 10, 10 );

  backDots();

  if (c>=0) {
    for (int i=0; i<=c; i++) {
      
    }
  }
  //OpenCV detects IR light as a blob.
  Blob[] blobs = opencv.blobs( 100, 25600, 20, true );
  for ( int i=0; i<blobs.length; i++ ) {
    Point centroid = blobs[i].centroid;
    fill(255, 255, 0);
    ellipse(centroid.x, centroid.y, 20, 20);
    makeFlowers (centroid.x, centroid.y);
  }
  displayFlowers();
}

void makeFlowers (int fingerX, int fingerY) {
  for (int i=0; i<gridX; i++) {
    for (int j=0;j<gridY;j++) {
      if ( dist(fingerX, fingerY, i*(width/gridX)+(width/gridX/2), j*(height/gridY)+(height/gridY/2)) < width/gridX/2) {
        c++;
        
        flowers.add(new Circle(i*(width/gridX)+(width/gridX/2), j*(height/gridY)+(height/gridY/2)));
        
        //circle[c] = new Circle(i*(width/gridX)+(width/gridX/2), j*(height/gridY)+(height/gridY/2));
      }
    }
  }
}
void displayFlowers() {
  for (int i = flowers.size()-1; i >= 0; i--) {
 //     circle[i].draw();
      Circle circle = (Circle) flowers.get(i);
     circle.draw();
    if (circle.finished()) {
      // Items can be deleted with remove()
      flowers.remove(i);
    }
  }
}
public void stop() {
  opencv.stop();
  super.stop();
}


