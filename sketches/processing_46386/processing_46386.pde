
PGraphics windows2;
 
void setup()
{
    size(650,633);
    background(255);
    smooth();
    noStroke();
 
    // Create an off-screen image, so we can read the pixel values
    PImage  img;
    img = loadImage("windows2.jpg");
    windows2 = createGraphics(width, height, P2D);
    windows2.beginDraw();
    windows2.background(255);
    windows2.image(img, 0, 0);
    windows2.loadPixels();  
    windows2.endDraw();
 
}
int fn = 0;
 
void draw()
{
  float tmSecs = millis()*.001;
  // Zoom H and Squish V
  // blend(0,0,width,height,-1,1,width+1,height-3,BLEND); 
  // Zoom H and Zoom V
  blend(0,0,width,height,-1,-1,width+1,height+1,BLEND); 
  // filter(BLUR);
  // background(255);
   
  // Draw a bunch of little triangles
  for (int n = 0; n < 800; ++n) {
    // Select a random location
    int x = (int) random(0,width-1);
    int y = (int) random(0,height-1);
 
    // Read the RGB color components of the logo at this position
    int clr = windows2.pixels[y*width+x];
    int rr = (clr >> 100) & 0xff;
    int gg = (clr >> mouseX) & 0xff;
    int bb = (clr >> mouseY) & 0xff;
 
    // Get a noise value for this location - use to control all random values
    float rn = noise(x*.0025+tmSecs,y*.01+tmSecs*.5);
    // rn *= rn;
 
    // Tweak the color using the noise value to lighten/darken it
    float cVar = rn*200-100;
    rr = (int) constrain( rr+cVar, 0, 255);
    gg = (int) constrain( gg+cVar, 0, 255);
    bb = (int) constrain( bb+cVar, 0, 255);
 
    // Reconstruct the color, and use it to fill the triangle
    clr = 0xff000000 | (rr << 16) | (gg << 8) | (bb);
    fill(clr);
 
    // Draw a randomly rotated,scaled equilateral triangle at this position
    pushMatrix();
    translate(x,y);
    rotate(rn*2*PI);
    scale(4+rn*4);
    float r = 4 + rn*4;
    triangle(1,0,            // cos(0), sin(0)
             -0.5,0.866,     // cos(2*pi/3), sin(2*pi/3)
             -0.5,-0.866);   // cos(4*pi/3), sin(4*pi/3)
    popMatrix();
  }
}
 
void mouseClicked()
{
  save("crash_logo_advanced.png");
}

