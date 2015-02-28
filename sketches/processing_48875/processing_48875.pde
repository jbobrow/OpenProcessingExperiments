
// DPI - Dots per Inch
// OD - Outer diameter
// ID - Inner diameter
// Ticks - Number of black and white slices
float dpi = 600;
float od = 1.12*dpi;
float id = .365*dpi;
float ticks = 90;
float aoffset = 46-90;
float boffset = -44-90;
PImage encoder;

int trail = 160;
byte[] cha = new byte[trail];
byte[] chb = new byte[trail];

int counta = 0;
int countb = 0;
int outcount = 0;
String dir = "FWD";

float t = 0;

PFont font;

void setup() {
  font = createFont("Arial", 24);
  smooth();
  rectMode(CENTER);
  
  // Draw the encoder disk
  size((int)od, (int)od);
  encoder = createImage((int)od, (int)od, RGB);  
  noStroke();
  background(64, 64, 64);
  for(int i = 0; i < ticks; i++)
  {
    if(i % 1 == 0) fill(255);
    if(i % 2 == 0) fill(0);
    float offset = i * (PI*2)/ticks;
    arc(od/2.0, od/2.0, od, od, offset, offset+((PI*2)/ticks));
  }
  fill(64, 64, 64);
  ellipse(od/2.0, od/2.0, id, id);
  
  loadPixels();
  encoder.pixels = pixels;

  // Resize the screen
  size(800, 600);
}

void draw() {
  background(64, 64, 64);
    
  // Update the logged values
  for(int i = (trail-1); i > 0; i--)
  {
    cha[i] = cha[i-1];
    chb[i] = chb[i-1];
  }
  // Draw the rotating disk  
  pushMatrix();
  translate(400, 300);
  t += .0068;
  rotate(((sin(t) / 2) + .5)*(PI*2));
  translate(-od /2.0, -od/2.0);  
  image(encoder, 0, 0);
  popMatrix();

  fill(255, 0, 0);
  // Sample Channel A  
  float gxa = (400) + ((.5*dpi)*cos(radians(aoffset)));
  float gya = (300) + ((.5*dpi)*sin(radians(aoffset)));
  color ca = get((int)gxa, (int)gya);
  if(red(ca) < 128) cha[0] = 0; else cha[0] = 1;
  ellipse(gxa, gya, 10, 10);
  
  // Sample Channel B
  float gxb = (400) + ((.5*dpi)*cos(radians(boffset)));
  float gyb = (300) + ((.5*dpi)*sin(radians(boffset)));
  color cb = get((int)gxb, (int)gyb);
  if(red(cb) < 128) chb[0] = 0; else chb[0] = 1;
  ellipse(gxb, gyb, 10, 10);

  // Test phase, update direction
  if(cha[0] == 0 && chb[0] == 0 && cha[1] == 1 && chb[1] == 0) dir = "FWD";
  if(cha[0] == 0 && chb[0] == 1 && cha[1] == 0 && chb[1] == 0) dir = "FWD";
  if(cha[0] == 1 && chb[0] == 1 && cha[1] == 0 && chb[1] == 1) dir = "FWD";
  if(cha[0] == 1 && chb[0] == 0 && cha[1] == 1 && chb[1] == 1) dir = "FWD";  
  if(cha[0] == 1 && chb[0] == 0 && cha[1] == 0 && chb[1] == 0) dir = "REV";
  if(cha[0] == 1 && chb[0] == 1 && cha[1] == 1 && chb[1] == 0) dir = "REV";
  if(cha[0] == 0 && chb[0] == 1 && cha[1] == 1 && chb[1] == 1) dir = "REV";
  if(cha[0] == 0 && chb[0] == 0 && cha[1] == 0 && chb[1] == 1) dir = "REV";
  
  // Update counters on edge
  if(cha[0] != cha[1]) {
    if(dir == "FWD") { counta++; outcount++; } else { counta--; outcount--; }
  }
  if(chb[0] != chb[1]) {
    if(dir == "FWD") { countb++; outcount++; } else { countb--; outcount--; }
  }
  
  // Draw Backdrop
  fill(0, 0, 0, 196);
  rect(400, 500, 800, 200);
  // Draw text
  fill(255);
  text("ChA Raw Count: " + counta, 135, 425);
  text("ChB Raw Count: " + countb, 134, 440);
  text("Encoder Ticks: " + outcount, 135, 455);  
  text("Direction: " + dir, 135, 470);
  // Draw sensor view
  fill(ca);
  rect(35, 435, 50, 50);
  fill(cb);
  rect(85, 435, 50, 50);
  
  // Plot signal
  for(int i = 1; i < trail; i++)
  {    
    fill(255, 0, 0);
    rect(((i)*5), 500 - (cha[i] * 10), 5, 5);
    fill(0, 255, 0);
    rect(((i)*5), 550 - (chb[i] * 10), 5, 5);
  }
}

