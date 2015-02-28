
// 2012 by Ralf Schallenberg

//import processing.opengl.*;

PImage imgBlob;
PImage imgSchlamm;

final int hiThresh = int(0.575*255);
final int loThresh = int(0.475*255);

Blob[] blobs = new Blob[5];

final color colInside  = color(90, 40, 25);
final color colOutside = color(75, 162, 186);
//  final color colOutside = color(115.0/255.0, 113.0/255.0, 98.0/255.0);
final color colIso     = color(255, 255, 255);

color[] colorLUT = new color[256];

void setup()
{
  size(400, 320, P3D);

  imageMode(CENTER);

  imgBlob = loadImage("dackel.png");
  imgSchlamm = loadImage("schlamm.png");

  noStroke();
  fill(255);  
  
  // Create blobs
  for(int i=0; i < blobs.length; i++) {
    blobs[i] = new Blob();
  }

  // Fill color look up table
  for(int thresh=0; thresh<256; thresh++) {
    if( thresh > hiThresh )
      colorLUT[thresh] = colInside;
    else if( thresh > loThresh )
      colorLUT[thresh] = colIso;
    else
      colorLUT[thresh] = colOutside;
  }
 
  frameRate(60);
} 

class Blob {
  float m_rot, m_drot;
  float m_x, m_y;
  float m_dx, m_dy;
  float m_radius, m_diameter;
  
  Blob () {
    m_diameter = 0.5*imgBlob.width;
    m_radius   = m_diameter / 2.0;
    m_x = random(m_radius, width - m_radius);
    m_y = random(m_radius, height - m_radius);
    m_dx = random(-width/300.0, width/300.0);
    m_dy = random(-height/400.0, height/400.0);
    m_rot = random(0.0, 2*PI);
    m_drot = random(-0.01, 0.01);
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
    
    pushMatrix();
    translate(m_x, m_y);
    rotate(m_rot);
    image(imgBlob, 0, 0);
    popMatrix();
    
    m_rot += m_drot;
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
  
  image(imgSchlamm, width/2.0, height - imgSchlamm.height/2.);
  
  for(int i=0; i < blobs.length; i++) {
    blobs[i].update();
  }
  
  int colBlue;

  loadPixels();
  for(int i=0; i < (width*height); i++) {
    colBlue = pixels[i] & 0xFF;
    pixels[i] = colorLUT[colBlue];
  }
  updatePixels();
}

