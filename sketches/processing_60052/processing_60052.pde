
/*

Rythm effect by duplicating an image into slices and rotating them sequentially.

@author Rafael Rinaldi (rafaelrinaldi.com)
@since Apr 29, 2012

*/

// Maximum layers number.
int TOTAL_LAYERS = 10;

PImage source;

int layers = 0;
float rotation = 0;
int size = 500; // Starts with the original document size.

void setup() {
  
  size(500, 500);
  
  // Loads external image.
  source = loadImage("nyc.jpg");
  smooth();
  image(source, 0, 0);
  
  // Drawing layers.
  while(layers < TOTAL_LAYERS) {
    drawLayer();
    ++layers;
    size -= 45;
    rotation += 1;
  }
  
}

// Draw a new layer to the image.
void drawLayer() {
  
  // Creating the mask.
  PGraphics msk = createGraphics(width, height, P2D);
  msk.beginDraw();
  msk.smooth();
  msk.noStroke();
  msk.ellipse(width * .5, height * .5, size, size);
  msk.endDraw();
  
  // Clone source image.
  PImage layer = source.get();
  
  // Positioning and rotating.
  translate(width * .5, height * .5);
  rotate(radians(rotation));
  translate(-layer.width * .5, -layer.height* .5);
  
  // Applying the mask to the image copy.
  layer.mask(msk);
  
  image(layer, 0, 0);
  
}

