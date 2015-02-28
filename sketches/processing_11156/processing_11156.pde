
// 2010 by Ralf Schallenberg

class Dot {
  float x;    // x position
  float y;    // y position
  float dx;   // x displacement 
  float dy;   // y displacement
  int   c;    // color (gray value)
  float dc;   // color change
  float s;    // size
  float ds;   // size change
  int   health; // when health == 0 => fade out
  int   a;      // alpha value
  
  Wave wave = null;
  
  public void setWaveRef(Wave waveref) {
    wave = waveref;
  }
  
  public Dot() {
    reset();
  }
  
  public Dot(Wave waveref) {
    setWaveRef(waveref);
    reset();
  }

  private void reset() {
    x  = random(0, width);
    if( wave != null ) {
      y  = wave.getWaveYPos(x/width) + random(-0.05*height, 0.05*height);
    } else {
      y  = random(0.45*height, 0.55*height);
    }
    dx = random(-0.5, 0.5);
    dy = random(-0.5, 0.05);
    c  = int(random(127, 255));
    dc = random(-10.0, 10.0);
    s  = 5.0;//random(1.0, 7.5);
    ds = random(-0.25, 0.25);
    
    health = int(random(25, 200));
    a = 240;
  }
  
  private boolean isOffscreen() {
    return x < -s || x > width+s || y < -s || y > height+s;
  }
  
  public void move() {
    x = x + dx;
    y = y + dy;
    
    if( health > 0 ) {
      health--;
    } else {
      a = a - 5;
    }

    if( isOffscreen() || a<=0 ) {
      reset();
    }
    
    if( c+dc < 127 || c+dc >= 256 ) {
      dc = -dc;
    }
    c = int(c + dc);
    
    if( s+ds < 3.5 || s+ds > 15.0 ) {
      ds = -ds;
    }
    s = s + ds;
  }
  
  public void draw() {
    fill(c-32, c-32, 255, a);
    ellipse(x, y, s, s);
  }
}


