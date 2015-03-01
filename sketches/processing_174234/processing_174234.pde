
import processing.video.*;

Capture video;
int signal = 0;

ArrayList frames = new ArrayList();

void setup() {
  size(640, 480);
  video = new Capture(this, width, height);
  video.start();  
}
void captureEvent(Capture camera) {
  camera.read();
  PImage img = createImage(width, height, RGB);
  video.loadPixels();
  arrayCopy(video.pixels, img.pixels);
  
  frames.add(img);
    if (frames.size() > height/6) {
    frames.remove(0);
  }
}
void draw() {
  int currentImage = 0;
 
 loadPixels();
 for (int y = 0; y < video.height; y+=4) {
   if (currentImage < frames.size()) {
      PImage img = (PImage)frames.get(currentImage);
      
      if (img != null) {
        img.loadPixels();
        
         for (int x = 0; x < video.width; x++) {
          pixels[x + y * width] = img.pixels[x + y * video.width];
          pixels[x + (y + 1) * width] = img.pixels[x + (y + 1) * video.width];
          pixels[x + (y + 2) * width] = img.pixels[x + (y + 2) * video.width];
          pixels[x + (y + 3) * width] = img.pixels[x + (y + 3) * video.width];
        }  
      }
      
       } else {
      break;
    }
  }
  
  updatePixels();
  
}

void mousePressed(){
  //background(0);
 if (mouseButton == LEFT) {
  saveFrame("foto-######.jpg");
 } else if (mouseButton == RIGHT) {
   textAlign(CENTER);
  textSize(24);
  fill(255, 100, 100);
  text(":D", width/2, height/2);

}
}



