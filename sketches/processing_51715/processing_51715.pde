
// 2012 by Ralf Schallenberg

//import processing.opengl.*;

PImage    imgBlob;

final float hiThresh = 0.7;
final float loThresh = 0.65;

Blob[] blobs = new Blob[25];

void setup()
{
  size(400, 400, P3D);

  imageMode(CENTER);

  imgBlob = loadImage("bigblob_round.png");

  noStroke();
  fill(255);  
  
  for(int i=0; i < blobs.length; i++) {
    blobs[i] = new Blob();
  }
 
  colorMode(RGB, 1.0);
  
  frameRate(30);
} 

class Blob {
  float m_x, m_y;
  float m_dx, m_dy;
  float m_radius, m_diameter;
  
  Blob () {
    m_diameter = 0.5*imgBlob.width;
    m_radius   = m_diameter / 2.0;
    m_x = random(m_radius, width - m_radius);
    m_y = random(m_radius, height - m_radius);
    m_dx = random(-width/400.0, width/400.0);
    m_dy = random(-height/400.0, height/400.0);
  } 
  
  void update() {
    m_x += m_dx;
    m_y += m_dy;
    m_dy += 0.0125;
    if(m_x > width - m_radius) {
      m_dx = -abs(m_dx);
    }
    if(m_y > height - m_radius) {
      m_dy = -0.95*abs(m_dy);
    }
    if(m_x < m_radius) {
      m_dx = abs(m_dx);
    }
    if(m_y < m_radius) {
      m_dy = abs(m_dy);
    }
    
    image(imgBlob, m_x, m_y);
  }
  
  void jump() {
    m_dy -= random(1.5, 3.0);
  }
};

void mousePressed() {
    for(int i=0; i < blobs.length; i++) {
      blobs[i].jump();
    }
}


void draw() 
{ 
  background(0);
  
  for(int i=0; i < blobs.length; i++) {
    blobs[i].update();
  }
  
  final color colInside  = color(0, 0.75, 1.0);
  final color colOutside = color(0, 0.5, 0.75);
  final color colIso     = color(1.0, 1.0, 1.0);
  float colRed;

  loadPixels();
  for(int i=0; i < (width*height); i++) {
    colRed = red(pixels[i]);
    if( colRed > hiThresh ) {
      pixels[i] = colInside;
    } else if( colRed > loThresh ) {
      pixels[i] = colIso;
    } else {
      pixels[i] = colOutside;
    }
  }
  updatePixels();
}

