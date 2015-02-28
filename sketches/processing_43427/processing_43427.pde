
/* Uses a height field as a habitat for little dots!
 * I originally wanted to use spheres, but that pushes the rendering
 * time up to like a minute a frame. So instead I compromised and drew
 * circles that will always face the camera.
 *
 * If you don't know what a height field is, here's a short explanation:
 * A height field is generated from an image where the height of the image
 * is calculated as a function of the color (usually brightness) at the
 * x and y position of that image. They're a cheap and dirty way of creating
 * simple 3D shapes without alot of calculations. Because of this, they're
 * used most often in video games where memory and processing power are
 * costly and are great for rendering terrain.
 */

final static String[] IMAGE_NAMES = {"marilyn.jpg", "spiral.jpg", "clouds.jpg"};

final static int BALL_WIDTH = 10;

PImage[] images;
int imgIndex;

float rotationX;
float rotationZ;
float zoom;

void setup() {
  PImage tempImg;
  
  size(400, 400, P3D);
  frameRate(30);
  noStroke();
  ellipseMode(CENTER);
  rotationZ = rotationX = 0;
  zoom = 1;
  imgIndex = 0;

  // Load all images  
  images = new PImage[IMAGE_NAMES.length];
  for(int i=0; i<IMAGE_NAMES.length; i++) {
    tempImg = loadImage(IMAGE_NAMES[i]);
    
    // For each image, make a smaller scaled one
    // (this saves memory and makes things work faster)
    images[i] = createImage(tempImg.width/BALL_WIDTH, tempImg.height/BALL_WIDTH, RGB);
    for(int y=0; y<images[i].height; y++) {
      for(int x=0; x<images[i].width; x++) {
        images[i].set(x, y, tempImg.get(x*BALL_WIDTH, y*BALL_WIDTH));
      }
    }
  }
}

void draw() {
  PImage img = images[imgIndex];
  
  background(0);
  
  // Translate to the center and rotate/scale accoordingly
  translate(width/2, height/2, 0);
  scale(zoom);
  rotateX(rotationX);
  rotateZ(rotationZ);
  
  // This moves the camera back above the height field
  translate(0, 0, -127);
    
  for(int y=0; y<img.height; y++) {
    for(int x=0; x<img.width; x++) {
      float jitterZ = random(0, BALL_WIDTH);
      
      pushMatrix();
      
      // scale the height based on the brightness of the
      // image plus some jitter to make the balls jump up
      // and down
      translate(x*BALL_WIDTH-width/2, 
                y*BALL_WIDTH-height/2, 
                brightness(img.get(x, y)) + jitterZ);
      
      // If we undo the rotation above, we can draw
      // the circles always facing the camera
      rotateZ(-rotationZ);
      rotateX(-rotationX);
      fill(img.get(x, y));
      ellipse(0, 0, BALL_WIDTH, BALL_WIDTH);
      popMatrix();
    }
  }
}

void keyPressed() {
  // For zooming in and out
  if(key=='+' || key=='=') {
    zoom*= 1.1;
  } else if(key=='-' || key=='_') {
    zoom/= 1.1;
  }
  
  // Lets you change the image
  else if(key==java.awt.event.KeyEvent.VK_RIGHT) {
    imgIndex = (imgIndex+1)%images.length;
  } else if(key==java.awt.event.KeyEvent.VK_LEFT) {
    imgIndex = (imgIndex+images.length-1)%images.length;  
  }
}

// Lets you rotate
void mouseDragged() {
  rotationZ += 2*PI*(pmouseX - mouseX)/width;
  rotationX += 2*PI*(pmouseY - mouseY)/height;
}

