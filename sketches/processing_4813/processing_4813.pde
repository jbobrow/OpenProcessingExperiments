
// Gravity Pulsar
// Claudio Gonzales, June 2009
// Albuquerque, New Mexico

particle[] Z = new particle[15000];
float colour = random(1);

void setup() {
  smooth();
  size(500,500,P2D);  
  background(255);
  
  float phi, x, y, xx, yy;
  
  phi = 0;
  for(int i = 0; i < Z.length; i++) {
    phi = random(1);
    x = width/2 + ( 10 + 10*phi ) * cos( phi*TWO_PI );
    y = height/2 + ( 10 + 10*phi ) * sin( phi*TWO_PI );
    phi += ( random(2) - 1 ) / float(Z.length);
    xx = width/2 + ( 10 + 10*phi ) * cos( phi*TWO_PI );
    yy = height/2 + ( 10 + 10*phi ) * sin( phi*TWO_PI );
    Z[i] = new particle( x, y, 10, findAngle(x-xx,y-yy), 1 );
  }
  
  frameRate(50);

}

void draw() {

  filter(INVERT);
  float r;

  /*
  stroke(0);
  fill(255,30);
  rect(0,0,width,height);
  */
  background(255);
  
  colorMode(HSB,1);
  for(int i = 0; i < Z.length; i++) {
    Z[i].gravitate( new particle( width/2, height/2, 0, 0, 1000 ) );
    Z[i].deteriorate();
    Z[i].update();
    r = float(i)/Z.length;
    //colour = pow( ( sq(Z[i].x-width/2) + sq(Z[i].y-height/2) ) / ( sq(width/2) + sq(height/2) ), 0.1);
    stroke( colour, pow(r,0.1), 1-r, 0.1 );
    if(Z[i].magnitude<15)
      Z[i].display();
    if( !Z[i].inSector(-width,2*width,-height,2*height) )
      reset(i);
  }
  colorMode(RGB,255);
  
  colour+=random(0.01);
  if( colour > 1 ) { 
    colour = colour%1;
  }
    
  filter(INVERT);
  
}

void mousePressed() {
  reset();
}

void keyPressed() {
  if( key == CODED ) {
    if( keyCode == LEFT ) {
      colour-=0.01;
    }
    if( keyCode == RIGHT ) {
      colour+=0.01;
    }
    if( colour > 1 ) { 
      colour = colour%1;
    }
    if( colour < 0 ) { 
      colour += 1;
    }
  }
}

void reset() {
  float r, phi, x, xx, y, yy;  
  
  colour = random(1);
  
  phi = random(-1000,1000);
  for(int i = 0; i < Z.length; i++) {
    r = float(i)/float(Z.length);
    if( mouseButton == RIGHT ) {
      phi += random(1) * 1/float(Z.length);
      x = width/2 + ( 10 + 10*r ) * cos( noise(phi)*TWO_PI );
      y = height/2 + ( 10 + 10*r ) * sin( noise(phi)*TWO_PI );
      phi += random(1) * 1/float(Z.length);
      xx = width/2 + ( 10 + 10*r ) * cos( noise(phi)*TWO_PI );
      yy = height/2 + ( 10 + 10*r ) * sin( noise(phi)*TWO_PI );
    }
    else {
      phi = random(1);
      x = width/2 + ( 10 + 10*phi ) * cos( phi*TWO_PI );
      y = height/2 + ( 10 + 10*phi ) * sin( phi*TWO_PI );
      phi += ( random(2) - 1 ) / float(Z.length);
      xx = width/2 + ( 10 + 10*phi ) * cos( phi*TWO_PI );
      yy = height/2 + ( 10 + 10*phi ) * sin( phi*TWO_PI );
    }
    Z[i].reset( x, y, 10, findAngle(x-xx,y-yy), 1 );
  }
  
}

void reset(int i) {
  float r, phi, x, xx, y, yy;  
    
  phi = random(-1000,1000);
  r = float(i)/float(Z.length);
  if( mouseButton == RIGHT ) {
    phi += random(1) * 1/float(Z.length);
    x = width/2 + ( 10 + 10*r ) * cos( noise(phi)*TWO_PI );
    y = height/2 + ( 10 + 10*r ) * sin( noise(phi)*TWO_PI );
    phi += random(1) * 1/float(Z.length);
    xx = width/2 + ( 10 + 10*r ) * cos( noise(phi)*TWO_PI );
    yy = height/2 + ( 10 + 10*r ) * sin( noise(phi)*TWO_PI );
  }
  else {
    phi = random(1);
    x = width/2 + ( 10 + 10*phi ) * cos( phi*TWO_PI );
    y = height/2 + ( 10 + 10*phi ) * sin( phi*TWO_PI );
    phi += ( random(2) - 1 ) / float(Z.length);
    xx = width/2 + ( 10 + 10*phi ) * cos( phi*TWO_PI );
    yy = height/2 + ( 10 + 10*phi ) * sin( phi*TWO_PI );
  }
  Z[i].reset( x, y, 10, findAngle(x-xx,y-yy), 1 );
  
}


