
String written = "Happy New Year!";
int l = written.length();
char write_now;
int sp = 10;
int plt = 20;

ArrayList fw = new ArrayList(1);

void setup() {
  size(800, 600);
  frameRate( 10 );
  float ts = ( width-plt-sp*( l - 1 ) )/ l;
  textSize( ts * 1.6 );
  fw.add( new Firework(0, 0, 50, 100, 5) );
}

void draw_text() {

  plt = 20;

  for ( int i = 0; i < l; i++ ) {

    write_now = written.charAt( i );
    //println( write_now );

    color ct = color( random( 1, 255 ), random( 1, 255 ), random( 1, 255 ) );
    fill( ct );

    text( write_now, plt, height - 100 + random( 20 ) - 10 );
    int tw = int( textWidth( write_now ) );

    plt+=( tw + sp);
  }
}

void draw() {
  background( 0 );

  draw_text();
  while( fw.size() < 5 ) {
    fw.add( new Firework(0, 0, 50, (int)random(75,150), random(90)-45 ));
  }
 
  
  
  ArrayList nfw = new ArrayList(0);

  for ( int fi = fw.size ()-1; fi >=0; fi-- ) {
    Firework f = (Firework) fw.get(fi);
    if ( f == null ) continue;
    //print(f);
    f.draw();
    int res;
    int speed = 7;
    do {
      res = f.calc();
      speed--;
    }
    while ( res == 0 && speed > 0 );



    if ( res == 1 && f.it > 13 && !f.exploded ) { //explode

      for ( int i = 0; i < 15; i++ ) {
        nfw.add( new Firework( (int)f.x, (int)f.y, f.m/2, (int)random(f.it / 2), random( 0, 360 ) ) );
      }
      f.exploded = true;
    }

    if ( res == 2 ) {
      fw.remove(f);
    }
  }

  fw.addAll( nfw );
}


class Firework {
  float x, y, vx, vy;
  float m; // mass
  float an; // init ang

  float g = 1.0;
  float r = 5.0;

  int it, t;

  ArrayList tailx = new ArrayList();
  ArrayList taily = new ArrayList();
  
  boolean  exploded = false;

  Firework( int x, int y, float m, int reactTime, float angle ) {
    this.x = x; 
    this.y = y;
    tail();
    this.m = m;
    this.it = reactTime; 
    this.t = reactTime;
    this.an = angle;
  }

  void tail() {

    tailx.add((int)this.x);
    taily.add((int)this.y);

    if ( tailx.size() > 50 ) {
      tailx.remove(0);
      taily.remove(0);
    }
  }

  int calc() {

    if ( t > 0 ) {
      vy -= g / m;
      //println( t, t/2);
      if ( t > t/6) {
        vy += (r/m) * cos(radians(an));
      }

      vx += (r/m)*sin(radians(an));
      //println(vx, vy);
      x += vx;
      y += vy;

      tail();

      t --;
    } else {
      if ( tailx.size() > 0 ) {
        tailx.remove(0);
        taily.remove(0);
        return 1; // explode
      }

      return 2; // finish
    }

    return 0;
  }

  void draw() {

    if ( tailx.size() > 0 ) {
      pushMatrix();
      translate( width/2, height-100 );
      scale(1.0, -1.0);

      for ( int i = 0; i < tailx.size (); i++ ) {
        stroke( color( random(0, 255), random(0, 255), random(0, 255) ) );
        point(tailx.get(i), (int)taily.get(i));
      }
      popMatrix();
    }
  }
}
