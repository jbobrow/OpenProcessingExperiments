
/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;*/

ArrayList<Spot> spots; // A list of all the circles in the world
ArrayList<Rectangle> lines;
/*Minim minim;
AudioPlayer sound_bing;
AudioOutput out;
Oscil osc;*/
float amp; // Amplitude of the above Oscil
float cursorAngle;
int backgroundAlpha;

//boolean sketchFullScreen() { return true; }

void setup()
{
  size(640, 640);
  //size(displayWidth, displayHeight);
  background(0);
  fill(15, 15, 15);
  rect(0, 0, width, height);
  rectMode(CENTER);
  ellipseMode(CENTER);
  noCursor();
  backgroundAlpha = 15;

  /*minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 2048);
  amp = 4.0;
  osc = new Oscil(0.0, amp);
  osc.patch(out);*/

  /*sound_bing = minim.loadFile("woosh.wav");
  ChebFilter cf = new ChebFilter(800, ChebFilter.LP, .05, 4, sound_bing.sampleRate());
  sound_bing.addEffect(cf);*/

  spots = new ArrayList<Spot>();
  lines = new ArrayList<Rectangle>();
  cursorAngle = 0.0;
}
void draw()
{
  /*amp -= .05;
  if (amp <= 0.0) amp = 0.0;
  osc.setAmplitude(amp);
  */
  stroke(0, 0, 0, backgroundAlpha);
  fill(0, 0, 0, backgroundAlpha);
  rect(width/2, height/2, width + 1, height + 2);

  for (int i = 0; i < spots.size(); i++)
  {
    spots.get(i).update();
    spots.get(i).draw();
    if (spots.get(i).getAlpha() <= 0) spots.remove(i);
  }
  for (int i = 0; i < lines.size(); i++)
  {
    lines.get(i).update();
    lines.get(i).draw();
    if (lines.get(i).getAlpha() <= 0) lines.remove(i);
  }

  // Mouse cursor
  stroke(255);
  pushMatrix();
  translate(mouseX, mouseY);
  cursorAngle += 1.0;
  rotate(radians(cursorAngle));
  line(-25, -25, 25, 25);
  line(-25, 25, 25, -25);
  popMatrix();
}
void mouseDragged()
{
  //osc.setFrequency(map(mouseX, 0, width, 100, 200));
  //amp = 1.0;
  
  if (mouseButton == LEFT)
  {
    float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
    int green = (int)map(mouseX, 0, width, 0, 255);
    int red = (int)map(mouseY, 0, height, 0, 255);
    speed = map(speed, 0, 30, 1, 40);
    Spot newSpot = new Spot(mouseX, mouseY, speed, red, green, 255, true, true);
    spots.add(newSpot);
  }
  else if (mouseButton == RIGHT)
  {
    float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
    int green = (int)map(mouseX, 0, width, 0, 255);
    int red = (int)map(mouseY, 0, height, 0, 255);
    speed = map(speed, 0, 30, 1, 40);
    Spot newSpot = new Spot(mouseX, mouseY, speed, red, green, 255, true, false);
    spots.add(newSpot);
  }
}
void mousePressed() // Mouse pressed down
{
 // sound_bing.play(1000);
}
void mouseClicked() // Mouse clicked then release without movement
{
  if (mouseButton == RIGHT) // Clear the screen
  {
    spots.clear();
    lines.clear();
    background(0);
  }
}

// An empty circle
class Spot
{
  float x, y, radius;
  int r, g, b, a;
  float speedX, speedY;
  float angle;
  boolean rotation;
  Spot(float x, float y, float radius, boolean rotate)
  {
    this.x = x;
    this.y = y;
    this.radius = radius;
    r = 255;
    g = 255;
    b = 255;
    a = 255;
    speedX = 0.0;
    speedY = random(-2.0, 2.0);
    angle = 0.0;
    this.rotation = rotate;
  }
  Spot(float x, float y, float radius, int r, int g, int b, boolean vert, boolean rotate)
  {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.r = r;
    this.g = g;
    this.b = b;
    a = 255;
    this.rotation = rotate;
    if (vert)
    {
      speedX = 0.0;
      speedY = random(-2.0, 2.0);
    }
    else 
    {
      speedX = random(-2.0, 2.0);
      speedY = 0.0; 
    }
  }
  void update()
  {
    if (!rotation)
    {
      x += speedX;
      y += speedY;
      if (x - radius/2 < 0 || x + radius/2 > width) speedX = -speedX;
      if (y - radius/2 < 0 || y + radius/2 > height) speedY = -speedY;
    }
    else angle += 1.0;
    a--;
  }
  void draw()
  {
    noStroke();
    fill(r, g, b, a);
    
    if (rotation)
    {
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(angle));
      ellipse(x - width/2, y - height/2, radius, radius);
      popMatrix();
      //ellipse(width - x, y, radius, radius);
    }
    else
    {
      ellipse(x, y, radius, radius); 
      ellipse(width - x, y, radius, radius); // Draw a mirrored circle
    }
    if (a < 0) a = 0;
  }
  int getAlpha()
  {
    return a;
  }
}

class Rectangle
{
  float x, y;
  float w, h;
  float angle;
  int r, g, b, a;
  Rectangle(float x, float y, float w, float h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    angle = 0;
    r = 255;
    g = (int)map(mouseX, 0, width, 0, 219);
    b = (int)map(mouseX, 0, width, 190, 250);
    a = 255;
  }
  void update()
  {
    angle += 1.0;
    a -= 2;
  }
  void draw()
  {
    stroke(r, g, b, a);
    noFill();
    
    drawMirrored(x, y);
    drawMirrored(width - x, y);
    drawMirrored(width - x, height - y);
    drawMirrored(x, height - y);
  }
  void drawMirrored(float dx, float dy)
  {
    pushMatrix();
    translate(dx, dy);
    rotate(radians(angle));
    rect(0, 0, w, h);
    popMatrix();
  }
  int getAlpha()
  {
    return a;
  }
}


