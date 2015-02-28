
/**
 * Image Mask
 * 
 * Move the mouse to reveal the image through the dynamic mask.
 */
 
PShader maskShader;
PImage srcImage;
PGraphics maskImage;

void setup() {
  size(878, 847, P2D);
  srcImage = loadImage("ANDREA_explode_hue.jpg");
  maskImage = createGraphics(srcImage.width, srcImage.height, P2D);
  maskImage.noSmooth();
  maskShader = loadShader("mask.glsl");
  maskShader.set("mask", maskImage);
  background(190);
}

void draw() { 
  maskImage.beginDraw();
  maskImage.background(0);
  if (mouseX != 0 && mouseY != 0) {  
    maskImage.noStroke();
    maskImage.fill(255, 0, 0);
    maskImage.rect (mouseX, mouseY, 100, 150);
  }
  maskImage.endDraw();

  shader(maskShader);    
  image(srcImage, 0, 0, width, height);
}



