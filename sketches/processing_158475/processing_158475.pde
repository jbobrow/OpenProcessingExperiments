
/*
  @pjs preload="eyes.png";
 */

/*
 Andor Salga
 Eyes of God
 
 Similar ShaderToy of mine here: https://www.shadertoy.com/view/Xsl3W4
*/

int shift = 0;

PVector p = new PVector();
PImage buff;
PImage texture; 
PImage overlay;
float aTanLUT[];

void setup() {
  size(480, 300);

  fill(0, 0, 255);
  buff = new PImage(width, height, RGB);
  texture = loadImage("eyes.png");

  // Create LUT
  aTanLUT = new float[height * width];
  for (int i = 0; i < width * height; i++) {
    int x = i % (width);
    int y = int(i/width);
    aTanLUT[y * width + x] = atan2((height/2 - y), (width/2 - x));
  }

  overlay = new PImage(width, height, ARGB);
  overlay.loadPixels();

  // change for different darkness amounts
  float maxLen = height/1.5;

  PVector p = new PVector();
  for (int i = 0; i < width * height; i++) {
    int x = i % width;
    int y = int(i/width);

    p.set(x - width/2.0, y - height/2.0);
    float d = sqrt(p.x*p.x + p.y*p.y);
    float normalizedDist = d/maxLen;

    // invert since we want 255 to be at the center
    overlay.pixels[i] = color(0, (1 - normalizedDist) * 255);
  }
}

//
//
void draw() {

  for (int i = 0; i < width * height; i++) {
    int x = i % width;
    int y = floor(i/(width));

    p.x = width / 2.0  - x;
    p.y = height / 2.0 - y;

    float len = sqrt(p.x * p.x + p.y * p.y);
    if(len > 20){
    float theta = aTanLUT[y * width + x];

    theta = abs((theta / TWO_PI) * texture.height * 11);

    theta %= texture.height;

    len = len/(texture.width);
    len = (1.0/len) * texture.width*4;
    len += frameCount * 2;

    int u = int(theta) % texture.width;
    int v = int(len) % texture.width;

    // hack for brad
       if (v < 20 || v > 80) {
      if ( p.y > 0) {
        u += shift;
      }
      else {
        u += texture.height - shift;
      }
       u %= texture.width;
    }
    else {
      if (p.y > 0) {
        u += texture.height - shift;

        if (u <= 0) {
          u = texture.height-1;
        }
      }
      else {
        u += shift;
      }
      u %= texture.width;
    }

    buff.pixels[i] = texture.pixels[u * texture.width + v];
    }
  }

  shift++;
  shift %= texture.width;

  buff.updatePixels();

  image(buff, 0, 0);
  image(overlay, 0, 0);
}

