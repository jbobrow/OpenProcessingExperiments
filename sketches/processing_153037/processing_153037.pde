
/*
  @pjs preload="zero_wing.png";
 */

/*
 Andor Salga
 Wobble
 Similar to my GLSL shader: https://www.shadertoy.com/view/Msf3D4
*/

PImage orig;
PImage out;
PImage colorDeformed;

float a = 0.0f;
float amplitude = 20;


int xOffset = 0;
boolean xMoving = false;

boolean colorChanging = false;
int colorOffset = 0;

void setup() {
  size(320, 224);
  orig = loadImage("zero_wing.png"); 
  out = createImage(orig.width, orig.height, RGB);
  colorDeformed = createImage(orig.width, orig.height, RGB);

  for (int i = 0; i < orig.width * orig.height; i++) {
    colorDeformed.pixels[i] = orig.pixels[i];
  }
}

void keyPressed(){
    // X for toggling X movement
    if(keyCode == 88){
        xMoving = !xMoving;
    }
    // C for changing colors
    if (keyCode == 67) {
        colorChanging = !colorChanging;
  }
}

void draw() {
  a += 0.1;
  
  xOffset += xMoving ? 1 : 0;
  if (colorChanging) {
    updateColors();
  }

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {

      int deformY = y + int((sin( a +  (x/(float)height) * TWO_PI) * (mouseX/(float)height*amplitude)));
      int deformX = x + int((cos( a +  (y/(float)width) * TWO_PI) *  (mouseY/(float)width*amplitude)));

      deformY = deformY < 0 ? height - deformY : deformY;
      deformX = deformX < 0 ?  width - deformX : deformX;

      deformY = deformY > height-1 ? deformY % height : deformY;
      deformX = deformX > width-1  ? deformX % width : deformX;

      out.pixels[(y * width) + x] = colorDeformed.pixels[(deformY * width) + deformX + (xOffset%width)];
    }
  }
  out.updatePixels();

  image(out, 0, 0);
}


void updateColors() {
  float s = abs( sin(frameCount / 50.0f) *1);

  for (int i = 0; i < orig.width * orig.height; i++) {
    color c = orig.pixels[i];
    float r = abs( 255 * s - red(c)  );
    float g = abs( 255 * s - green(c)  );
    float b = abs( 255 * s - blue(c)  );

    colorDeformed.pixels[i] = color(r, g, b);
  }
}

