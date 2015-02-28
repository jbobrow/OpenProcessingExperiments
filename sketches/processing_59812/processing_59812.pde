
// animated image processing from a still image - Jim Bumgardner
 
PGraphics buf;
 
void setup()
{
    size(265,400);
    background(255);
    smooth();
    noStroke();
 
    // Create an off-screen image, so we can read the pixel values
    PImage  img;
    img = loadImage("close1.jpg");
    buf = createGraphics(width, height, P2D);
    buf.beginDraw();
    buf.background(255);
    buf.image(img, 0, 0);
    buf.loadPixels();  
    buf.endDraw();
 
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
    int clr = buf.pixels[y*width+x];
    int rr = (clr >> 16) & 0xff;
    int gg = (clr >> 8) & 0xff;
    int bb = (clr >> 0) & 0xff;
 
    // Get a noise value for this location - use to control all random values
    float rn = noise(x*.0025+tmSecs,y*.01+tmSecs*.5);
    // rn *= rn;
 
    // Tweak the color using the noise value to lighten/darken it
    float cVar = rn*200-100;
    rr = (int) constrain( rr+cVar, 0, 255);
    gg = (int) constrain( gg+cVar, mouseY, 255);
    bb = (int) constrain( bb+cVar, mouseX, 255);
 
    // Reconstruct the color, and use it to fill the triangle
    clr = 0xff000000 | (rr << 16) | (gg << 8) | (bb);
    fill(clr);
 
    // Draw a randomly rotated,scaled equilateral triangle at this position
    pushMatrix();
    translate(x,y);
    rotate(rn*5*PI);
    scale(1.5+rn*3);
    float r = 4 + rn*8;
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

