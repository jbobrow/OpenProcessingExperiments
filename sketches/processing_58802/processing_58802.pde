
class Indiogram {

  int seed;
  int x, y;
  int w, h;
  int xUnit, yUnit;
  boolean[][] hStrokes, vStrokes;

  Indiogram() {
    this.seed = (int)random(1000, 9999);
    this.x = 0;
    this.y = 0;
    this.w = 3;
    this.h = 3;
    this.xUnit = 30;
    this.yUnit = 30;
    instanciate();
  }

  Indiogram(int seed, int x, int y, int w, int h, int xUnit, int yUnit) {
    this.seed = (int)random(1000, 9999);
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.xUnit = xUnit;
    this.yUnit = yUnit;
    instanciate();
  }

  void instanciate() {
    this.hStrokes = new boolean[this.h][this.w-1]; //y,x
    this.vStrokes = new boolean[this.h-1][this.w]; //y,x
    for ( int y = 0; y < this.hStrokes.length; y++ )
      for ( int x = 0; x < this.hStrokes[0].length; x++ )
        hStrokes[y][x] = false;
    for ( int y = 0; y < this.vStrokes.length; y++ )
      for ( int x = 0; x < this.vStrokes[0].length; x++ )
        vStrokes[y][x] = false;
    this.generate();
  }

  void generate() {
    randomSeed(this.seed);

    // iterate through all vertices
    for ( int y = 0; y < this.h; y++ ) {
      for ( int x = 0; x < this.w; x++ ) {

        // build empty edge-table for vertex
        boolean[] edges = {
          false, false, false, false
        };
        // and a flag to see if the vertex in unconnected
        boolean empty = true;

        // see how which edges are available for vertex
        if ( y < this.h-1 ) {
          edges[0] = true; //vStrokes[y][x];
          if ( vStrokes[y][x] )
            empty = false;
        } 
        if ( y > 0 ) {
          edges[2] = true; //vStrokes[y-1][x];
          if ( vStrokes[y-1][x] )
            empty = false;
        }
        if ( x < this.w-1 ) {
          edges[1] = true; //hStrokes[y][x];
          if ( hStrokes[y][x] )
            empty = false;
        }
        if ( x > 0 ) {
          edges[3] = true; //hStrokes[y][x-1];
          if ( hStrokes[y][x-1] )
            empty = false;
        }

        // make sure that no vertex is complete empty
        if ( empty ) {
          boolean success = false;
          while ( !success ) {
            int t = floor(random(0, 4));
            if ( edges[t] ) {
              success = true;
              switch ( t ) {
              case 0:
                vStrokes[y][x] = true;
                break;  
              case 2:
                vStrokes[y-1][x] = true;
                break;  
              case 1:
                hStrokes[y][x] = true;
                break;  
              case 3:
                hStrokes[y][x-1] = true;
                break;
              }
            }
          }
        }

        // randomly fill in other strokes
        for ( int i=0; i < edges.length; i++)
          if ( edges[i] ) {
            int t = floor(random(0, 4));
            if ( t > 2 ) {
              switch ( i ) {
              case 0:
                vStrokes[y][x] = true;
                break;  
              case 2:
                vStrokes[y-1][x] = true;
                break;  
              case 1:
                hStrokes[y][x] = true;
                break;  
              case 3:
                hStrokes[y][x-1] = true;
                break;
              }
            }
          }
      }
    }
  }

  void draw() {
    // points
    /*for (int y = 0; y < this.h; y++)
      for ( int x = 0; x < this.w; x++)
        point(this.x+x*xUnit, this.y+y*yUnit);*/
    // horizontal strokes
    for ( int y = 0; y < this.hStrokes.length; y++ )
      for ( int x = 0; x < this.hStrokes[0].length; x++ )
        if ( hStrokes[y][x] )
          line(this.x+x*xUnit, this.y+y*xUnit, this.x+x*xUnit+xUnit, this.y+y*xUnit);
    // vertical strokes
    for ( int y = 0; y < this.vStrokes.length; y++ )
      for ( int x = 0; x < this.vStrokes[0].length; x++ )
        if ( vStrokes[y][x] )
          line(this.x+x*yUnit, this.y+y*yUnit-3, this.x+x*yUnit, this.y+y*yUnit+yUnit+2);
  }
}

Idiogram i;

void setup() {
  size(100, 100);
  frameRate(6);
  //smooth();
  strokeWeight(6);
  i = new Indiogram((int)random(1000, 9999), 20, 20, 4, 4, 20, 20);
}

void draw() {
  background(255);
  i.draw();
}

void mouseReleased() {
  setup();
}

