
class fireCracker {
  float x, y, xx, yy;
  float ox, oy;
  float vx, vy;
  particle[] charges;
  int colour;
  int life;
  int age;
  int current = 0;

  fireCracker( float ix, float iy, float vx0, float vy0, int C, int L, int num ) {
    charges = new particle[num];
    x = 0;
    y = 0;
    xx = 0;
    yy = 0;
    ox = ix;
    oy = iy;
    vx = vx0;
    vy = vy0;
    colour = C;
    life = int(random(L));
    age = L;

    for (int i=0;i<num;i++) {
      charges[i] = new particle( -1, 0, 0, 0, 0, 0 );
    }

  }

  void reset( float ix, float iy, float vx0, float vy0, int C, int L ) {
    x = 0;
    y = 0;
    xx = 0;
    yy = 0;
    ox = ix;
    oy = iy;
    vx = vx0;
    vy = vy0;
    colour = C;
    life = L;
    age = L;

    for (int i=0;i<charges.length;i++) {
      charges[i].reset( -1, 0, 0, 0, 0, 0 );
    }
    
  }
  
  void update(){
    if( age > 0 ) {
      xx = x;
      yy = y;
      x += vx;
      y += vy;
      age--;
      // air resistance
      vx *= 0.99;
  
      // gravity
      vy += 0.065;
      
      if( oy + y > width ) {
        y = width - oy;
        vy = -vy;
      }
      
      if( 0.95 < random(1) ) {
        if( current < charges.length ) {
          charges[current].reset( ox+x, oy+y, vx+random(1)-0.5, vy+random(1)-0.5, colour, life-age );
          current++;
        }
      }
    }
    if( age == 0 ) {
      float phi;
      float r;
      float p;
      if( random(1) < 0.95 ) {
        for (int i=0;i<charges.length;i++) {
          p = random(2)+1;
          r = random(p);
          phi = random(TWO_PI);
          charges[i].reset( ox+x, oy+y, r*cos(phi), r*sin(phi), colour, life );
        }
      }
      else {
        for (int i=0;i<charges.length;i++) {
          p = random(4)+2;
          r = random(p);
          phi = random(TWO_PI);
          charges[i].reset( ox+x, oy+y, r*cos(phi), r*sin(phi), colour, life );
        }
      }
      age--;
    }
  }
  
  void display(){
    colorMode(HSB,100);    
    float temp;
        
    if( age > 0 ) {
      strokeWeight(1.5);
      temp = float(age)/float(life);
      stroke( color( colour, log((exp(1)-1)*temp+1)*100, 100-log((exp(1)-1)*temp+1)*100 ) );
      line(ox+xx,oy+yy,ox+x,oy+y);
      for (int i=0;i<current;i++) {
        charges[i].move();
      }
      strokeWeight(1);
    }
    else {
      for (int i=0;i<charges.length;i++) {
        charges[i].move();
      }
    }
    
    colorMode(RGB,255);
  }
    
  boolean dead(){
    for (int i=0;i<charges.length;i++) {
      if( charges[i].dead() == false ) {
        return false;
      }
    }
    if( age > 0 ) {
      return false;
    }
    return true;
  }
  
}

