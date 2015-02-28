
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/2337*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

//-------------------------------------------------
// Volcano2.pde   a simple vulcano simulation
//
//  v2   2013-11-18  some improvements
//
// press mouse button to pause animation
//-------------------------------------------------
static int size = 40;
static float scale = 25;   // landscape scale
boolean paused = false;
Volcano volcano;
//---------------
void setup()
{
  size(600, 800, P3D);
  println ("------- volcano v2 -----");
  frameRate(30);
  mouseY = 500;
  volcano = new Volcano();
}
//---------------
void draw()
{
  background(128, 128, 128);
  lights();
  perspective(1.0, float(width)/float(height), 1, 10000);
  camera( 0, -33 -mouseY,  mouseY/2 + 60, // eyeX, eyeY, eyeZ
          0, 0, 50, // centerX, centerY, centerZ
          0.0, 0.0, -1.0); // upX, upY, upZ 
  rotateZ( mouseX / 80.0 );
  translate( -size/2 * scale, -size/2 * scale, 0 );

  volcano.draw();
  if (!mousePressed)
    volcano.animate();

  //if (frameCount % 60 == 0) println (round(frameRate) + " fps  ");
}
//----------------
void keyPressed()
{
  if (key == 'r') volcano = new Volcano();   // create random vulcano 
  if (key == 's') save ("vulcano2.png");     // save picture
}

//================
//  class volcano
//================
public class Volcano
{
  Landscape landscape = new Landscape();
  Rocks rocks = new Rocks();
  //----------------
  public Volcano()    // constructor
  {
    println ("new volcano created");
    noStroke();
    noiseSeed(frameCount);
  }
  //------------------
  void draw()
  {
    landscape.draw();
    rocks.draw();
  }
  //----------------
  void animate()
  { 
    landscape.erode();
    rocks.update (landscape.heightmap[size/2][size/2]);
  }
}

//===================
//  class Landscape
//===================
public class Landscape
{
  float[][] heightmap = new float[size][size];
  //----------------
  public Landscape()    // constructor
  {
    for(int ni=0; ni<size*size; ni++)
       heightmap[ni / size] [ni % size] = 111*(-0.5 +noise( (ni / size)*0.1, (ni % size) * 0.1));
    heightmap[size/2][size/2] += 44;
  }  
  //------------------
  void erode()                            //        y1
  {                                       //   x1  x/y  x2
    for( int y = 0; y < size; y++ )       //        y2
    {
      int y1 = (y-1+size) % size;
      int y2 = (y+1) % size;
      for( int x = 0; x < size; x++ )
      {
        int x1 = (x-1+size) % size;
        int x2 = (x+1) % size;
        float h0 = heightmap[x ][y];   
        float h1 = heightmap[x1][y];    
        float h2 = heightmap[x2][y];    
        float h3 = heightmap[x ][y1];
        float h4 = heightmap[x ][y2];
        float hv = h0;
        if (abs(h0-h1) > 5) { hv *= 0.998;   heightmap[x1][ y] = h1 *1.001; }
        if (abs(h0-h2) > 5) { hv *= 0.998;   heightmap[x2][ y] = h2 *1.001; }
        if (abs(h0-h3) > 5) { hv *= 0.998;   heightmap[x ][y1] = h3 *1.001; }
        if (abs(h0-h4) > 5) { hv *= 0.998;   heightmap[x ][y2] = h4 *1.001; }
        heightmap[x][y] = hv;
      }
    } 
  }
  //------------------
  void draw()
  {
    noStroke();
    for( int y1 = 0; y1 < size-1; y1++ )
    {
      int y2 = y1+1;
      float yy1 = y1 * scale;
      float yy2 = (y1+1) * scale;
      for( int x1 = 0; x1 < size-1; x1++ )
      {
        int x2 = x1+1;
        float h1 = heightmap[x1][y1];
        float h2 = heightmap[x1][y2];
        float h3 = heightmap[x2][y2];
        float h4 = heightmap[x2][y1];
        float hm = (h1+h2+h3+h4) / 4.0;
        float xx1 = x1 * scale;
        float xx2 = xx1 + scale;
        //stroke(0);
        beginShape(TRIANGLE_FAN);
        fill (hm + 99, 99, 99);
        vertex ((xx1+xx2)*0.5, (yy1+yy2)*0.5, hm);
        vertex (xx1, yy1, h1);
        vertex (xx1, yy2, h2);
        vertex (xx2, yy2, h3);
        vertex (xx2, yy1, h4);
        vertex (xx1, yy1, h1);
        endShape();
      }
    } 
  } 
  //------------------
  void draw2()
  {
    noStroke();
    beginShape(QUADS);
    for( int y = 0; y < size-1; y++ )
    {
      float y1 = y * scale;
      float y2 = (y+1) * scale;
      for( int x = 0; x < size-1; x++ )
      {
        float hm = heightmap[x][y];
        fill (hm + 99, 99, 99);
        vertex (    x * scale, y1, hm);
        vertex ((x+1) * scale, y1, heightmap[x+1][y  ]);
        vertex ((x+1) * scale, y2, heightmap[x+1][y+1]);
        vertex (    x * scale, y2, heightmap[x  ][y+1]);
      }
    } 
    endShape();
  }
}

//================
//  class Rocks
//================
float[][] mask;
public class Rocks
{
  ArrayList rocks = new ArrayList();
  //------------------
  public Rocks()       // constructor
  {
    sphereDetail(4);
    mask = new float[5][5];
    for( int y = 0; y < 5; y++ )
    {
      //print(y+": ");
      for( int x = 0; x < 5; x++ )
      {
        mask[x][y] = constrain(1.0 - dist(x, y, 2, 2)*0.42, 0.01, 1.0);
        //print(nf(mask[x][y],0,2) + "  ");
      }
      //println();
    }    
  }
  //------------------
  public void draw()
  {
    for( int i = 0; i < rocks.size(); i++ )
    {
      Rock r = (Rock)rocks.get(i);
        r.draw();
    } 
  }
  //------------------
  public void update(float z)
  {
    rocks.add( new Rock(z) );
    rocks.add( new Rock(z) );
    rocks.add( new Rock(z) );

    for( int i = 0; i < rocks.size(); i++ )
    {
      Rock r = (Rock)rocks.get(i);
      if (r.alive)
        r.update();
      else
      {
        rocks.remove( r );
        i--; 
      }
    } 
  }
}

//================
//  class Rock
//================
public class Rock
{
  float start = 7;
  float angle = random (0, TWO_PI);
  float mag = random (0.2, 1.6);
  PVector loc;
  PVector speed = new PVector (cos(angle)*mag, sin(angle)*mag, random(2, start));
  boolean alive = true;
  //------------------
  public Rock(float z)        // constructor
  {
    loc = new PVector( (size/2 +2.0 - random(4.0)) * scale
                     , (size/2 +2.0 - random(4.0)) * scale
                     , z+1.0);
    changeHeight(-0.30);
  }
  //------------------
  void draw()
  {
    pushMatrix();
    fill(100+speed.z*30, 77,77);
    translate( loc.x, loc.y, loc.z);
    sphere (2.0);
    popMatrix();
  }
  //------------------
  void update()
  {
    Landscape landscape = volcano.landscape;
    speed.z -= .1;
    loc.add (speed);
    if (  (loc.x >= 0 && loc.x <= size*scale && loc.y >= 0 && loc.y <= size*scale)
        &&(loc.z < 0.0 || loc.z < landscape.heightmap[(int)constrain(loc.x / scale, 0, size)]
                                                  [(int)constrain(loc.y / scale, 0, size)])
        && (speed.z < 0.0))    // move up ?
    {
      changeHeight (+1.40);
      alive = false;  
    }
  }

  void changeHeight(float vscale)
  { 
    int xx = ((int)(loc.x / scale));
    int yy = ((int)(loc.y / scale));
    //println (xx + " , " +yy + nf(vscale,0,2));
    int minX = constrain(xx - 2, 0, size);
    int minY = constrain(yy - 2, 0, size);
    int maxX = constrain(xx + 2, 0, size);
    int maxY = constrain(yy + 2, 0, size);
    for( int x = minX; x < maxX; x++ )
    {
      for( int y = minY; y < maxY; y++ )
      {
        volcano.landscape.heightmap[x][y] += max (-10, mask[xx-x+2][yy-y+2] * vscale); 
      }
    }
  }
  
}


