
PImage img;
PImage img_02;
// PImage alphaImg = loadImage("jb_0285.png");
// Create an opaque image of the same size as the original
PImage backgroundImage;
PImage edgeImg;

// Make a movie
int VideoFrameCounter = 0;


int X=0;
int Y=0;
int Z=0;

int W=0;
int V=0;

int SketchFrameRate = 25;


int locationX;
int locationY;
int zoomandscale = 2;
float biggerorsmaller = 0.1;
float biggerorsmallerscale = 0.05;



void setup() {
  size(1680, 1050);
  backgroundImage = loadImage("background.png");
  edgeImg = createImage(screen.width, screen.height, RGB);
  // img = loadImage("jb_0285.png");
  img = loadImage("IMG_1365.png");
  locationX = -5;
  locationY = 10;
  frameRate(SketchFrameRate);
  
}

void draw() {
    // img.alpha(alphaImg);
    VideoFrameCounter++;
    
    int X=int(random(255));
    int Y=int(random(255));
    int Z=int(random(255));
    int W=int(random(360));
    int V=int(random(-1, 1));
    
    // image(img, X, X);
    translate(mouseX+locationX, mouseY+locationY);
    scale(biggerorsmaller);
    println("locationX: " +locationX +" locationY: " +locationY);
    rotate(X);
    tint(X, Y, Z);
    image(img, locationX-img.width/8, locationY-img.height/8, img.width/4, img.height/4);
    stroke(Z,Y,X);
      line(mouseX, mouseY, mouseX+X, mouseY+Y);
    // image(img, 25, 0);
    /* Too much delay this way.
    if (VideoFrameCounter==10) { 
      saveFrame("line-####.tif"); 
      VideoFrameCounter=0;
    }
    */
}





void keyPressed() {
  switch(key) {
    /*
    case ENTER:
    drawShapes();
    break;
    */
    
    
    case '3':
    TakeAPicture();
    break;

        case 'w':
        case 'W':
        case UP:
          moveUp();
          break;
        case 's':
        case 'S':
        case DOWN:
          moveDown();
          break;
        case 'a':
        case 'A':
        case LEFT:
          moveLeft();
          break;
        case 'd':
        case 'D':
        case RIGHT:
          moveRight();
          break;      
          
        // Change the scale - bigger.
        case 'e':
        case 'E':
        makeBigger();
        break;
            // Change the scale - smaller
        case 'q':
        case 'Q':
        makeSmaller();
        break;
        
        // Fade the background black.
        case '1':
        fadeTheBackground();
        break;
        
        // Blur the image.
        case '2':
        blurTheImage();
        break;
        
        // Play or pause.
        case ' ':
        PlayOrPause();
        break;
    
        // Play or pause.
        case '=':
        SketchFaster();
        break;
        
        // Play or pause.
        case '-':
        SketchSlower();
        break;
      }
    }
    
      void moveUp() {
        locationY -= zoomandscale;
    
      }
      
      void moveDown() {
        locationY += zoomandscale; 
      }
      void moveLeft() {
        locationX -= zoomandscale;
      }
      
      void moveRight() {
    
        locationX += zoomandscale; 
      }
      
      void makeBigger() {
        biggerorsmaller += biggerorsmallerscale;
      }
      
      void makeSmaller() {
        if (biggerorsmaller>0.05) {
        biggerorsmaller -= biggerorsmallerscale;
        }
      }
        
    void fadeTheBackground() {
      int i;
      int j;
      fill(0,0,0,55);
      translate(0,0);
      rotate(0);
      noStroke();
      i = int(10*screen.width);
      j = int(10*screen.height);
      quad(0,0,0,i,i,j,j,0);
    }
    
    
    
    
    
    void blurTheImage() {
    filter(BLUR, 1);
    }
    
    
    // Pause & Play
    
    void PlayOrPause() {
      if (SketchFrameRate == 30) {
      SketchFrameRate = 1;
      frameRate(SketchFrameRate);
      }
      else {
      SketchFrameRate = 30;
      frameRate(SketchFrameRate);
      }
    }
    
    void SketchFaster() {
      SketchFrameRate++;
      frameRate(SketchFrameRate);
    }
    void SketchSlower() {
      if (SketchFrameRate > 0);
      SketchFrameRate--;
      frameRate(SketchFrameRate);
    }      
    
    /*
    void drawShapes() {

    }
    */
    
    void TakeAPicture() {
          // Finish the movie if space bar is pressed
          // Quit running the sketch once the file is written
          saveFrame("line-####.tif"); 
          // exit();
    }

