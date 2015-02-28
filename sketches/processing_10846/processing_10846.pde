
int heightMap[][][]; // water surface (2 pages).
int turbulenceMap[][]; // turbulence map
int line[]; // line optimizer;
int space;
int radius, heightMax, density;
int page = 0;
PImage water;

int pNum =4;
Particle[] p = new Particle[pNum];
float rr,gg,bb,dis;
int gain = 5;
float[] cc = new float[3];
void setup() {
 // size(50*6, 50*6,P3D);
 size(300,300,P3D);
  loadPixels();
  frameRate(3000);
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }
  for(int i=0;i<pNum;i++){
    p[i] = new Particle(random(width),random(height),random(0.1,0.3));
  }
  initWater();
  initMap();
}
public int vex;
void draw() {
  mouseX= (int)random(width);
  mouseY=(int)random(height);
  vex++;

  if (vex>100){
    vex=0;
    mouseButton=3;
    mousePressed(); 
  }
  waterFilter();
  updateWater();
  page ^= 1; // page switching.
  ov.copy(g,0,0,width,height,0,0,10,10);
  ov.mask(ov);
  blend(ov,0,0,9,9,0,0,width,height,OVERLAY);

}
PImage ov = createImage(10,10,ARGB);
void initWater() {
  float zoff = 0;

  water = createImage(width,height,ARGB);
  water.loadPixels();


  for (int y=height-1;y>0;y--){

    for (int x=width-1;x>0;x--){
      zoff += 0.0001f;
      float bright = ((noise(x*0.01f, y*0.01f, zoff)) * 255);
      //   water.pixels[x + y * width] = 0xFF000000 | ((int) bright);
      water.pixels[x + width*y]=color(height-x,y,width-x);
      // water.pixels[x+width*y]=color(random(40)+random(40)+random(40)+random(40));
      // water.pixels[x+width*y]=color(random(400),random(400),random(400),random(40));
      //   water.pixels[x + width*y]=color(bright,bright,bright,bright );
    }
  }
  water.updatePixels();
  water.filter(BLUR, 4.5f);

  water.filter(INVERT);
}

void initMap() {
  // the height map is made of two "pages".
  // one to calculate the current state, and another to keep the previous state.
  heightMap = new int[2][width][height];
  line = new int[height];
  for (int l = 0; l < height; l++) {
    line[l] = l * width;
  }
  density = 7;//5
  radius = 10;//20
  space = width * height - 1;

  // the turbulence map, is an array to make a smooth turbulence over the height map.
  turbulenceMap = new int[radius * 2][radius * 2]; // turbulence map.
  int r = radius * radius;
  int squarex, squarey;
  double dist;

  for (int x = -radius; x < radius; x++) {
    squarex = x * x;
    for (int y = -radius; y < radius; y++) {
      squarey = y * y;
      dist = Math.sqrt(squarex + squarey);
      if ((squarex) + (squarey) < r) {
        turbulenceMap[radius + x][radius + y] += (int) (900 * ((float) radius - dist));
      }
    }
  }
}

// to make a turbulence, just add the turbulence map, over the height map.
void makeTurbulence(int cx, int cy) {
  int r = radius * radius;
  int left = cx < radius ? -cx + 1 : -radius;
  int right = cx > (width - 1) - radius ? (width - 1) - cx : radius;
  int top = cy < radius ? -cy + 1 : -radius;
  int bottom = cy > (height - 1) - radius ? (height - 1) - cy : radius;


  for (int x= right;x>left;x--){
    int xsqr = x * x;

    for (int y=bottom;y>top;y--){
      if ((xsqr) + (y * y) < r)
        heightMap[page ^ 1][cx + x][cy + y] += turbulenceMap[radius + x][radius + y];
      //  water.set(x,y,turbulenceMap[radius + x][radius + y]); //<<<-- kick do not update water here
    }
  }
}

private void waterFilter() {
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {

      int n = y - 1 < 0 ? 0 : y - 1;
      int s = y + 1 > (height) - 1 ? (height) - 1 : y + 1;
      int e = x + 1 > (width) - 1 ? (width) - 1 : x + 1;
      int w = x - 1 < 0 ? 0 : x - 1;

      // water filter. I used to thought that this effect
      // had something to do with physics... :)

      // it a kind of image filter, but instead of applying to an image,
      // we apply it to the height map, that encodes the height of the waves.
      int value = ((heightMap[page][w][n] + heightMap[page][x][n]
        + heightMap[page][e][n] + heightMap[page][w][y]
        + heightMap[page][e][y] + heightMap[page][w][s]
        + heightMap[page][x][s] + heightMap[page][e][s]) >> 2)
        - heightMap[page ^ 1][x][y];

      heightMap[page ^ 1][x][y] = value - (value >> density);
      //   water.set(x,y,value - (value >> density)); //<<-- kick here - do not update water here

    }
  }
}

private void updateWater() {
  water.loadPixels();
  if (pmouseX==mouseX&& pmouseY==mouseY)
  {
    lo++;
  }
  else
  {
    lo=0 ;
  }

  if (mouseX > 25 && mouseY > 25 && mouseX< width -25 && mouseY  <height -25 && lo < 3){

    for(int i=0;i<3;i++){
      cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
    }

  }
  arraycopy(water.pixels, pixels); // not really needed...
  for (int y = 0; y < height - 1; y++) {


    for (int x = 0; x < width - 1; x++) {




      int pos=y*width+x;
      color col = water.pixels[pos];
      rr = col >> 16 & 0xff;
      gg = col >> 8 & 0xff;
      bb = col  & 0xff;
      dis = dist(mouseX,mouseY,x,y)/6;

      rr += cc[0]/dis-gain;
      gg += cc[1]/dis-gain;
      bb += cc[2]/dis-gain;

      water.pixels[pos]=color(rr,gg,bb,120);

      // using the heightmap to distort underlying image
      int deltax = heightMap[page][x][y] - heightMap[page][(x) + 1][y];
      int deltay = heightMap[page][x][y] - heightMap[page][x][(y) + 1];

      int offsetx = (deltax >> 3) + x;
      int offsety = (deltay >> 3) + y;

      offsetx = offsetx > width ? width - 1 : offsetx < 0 ? 0 : offsetx;
      offsety = offsety > height ? height - 1 : offsety < 0 ? 0 : offsety;

      int offset = (offsety * width) + offsetx;
      offset = offset < 0 ? 0 : offset > space ? space : offset;
      // Getting the water pixel with distortion and...
      // apply some fake lightning, in true color.
      int pixel = water.pixels[offset];
      int red = (pixel >> 16) & 0xff;
      int green = (pixel >> 8) & 0xff;
      int blue = (pixel) & 0xff;
      int light = (deltax + deltay) >> 6;
      red += light;
      green += light;
      blue += light;
      red = red > 255 ? 255 : red < 0 ? 0 : red;
      green = green > 255 ? 255 : green < 0 ? 0 : green;
      blue = blue > 255 ? 255 : blue < 0 ? 0 : blue;
      // updating our image source.
      pixels[line[y] + x] = 0xff000000 | (red << 16) | (green << 8) | blue;


    }
  }
  water.updatePixels();
}

public int lo;
void mouseDragged(){
  makeTurbulence(mouseX,mouseY);
}

void mousePressed() {
  Particle[] p = new Particle[pNum];
  makeTurbulence(mouseX,mouseY);
}




void mouseReleased(){
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }

  for(int i=0;i<pNum;i++){
    p[i] = new Particle(random(width),random(height),random(0.1,0.3));
  }
}

class Particle{
  float xpos,ypos,del;
  Particle(float x,float y,float d){
    xpos=x;
    ypos=y;
    del = d;
  }
  void update(){
    xpos += (mouseX-xpos)*del;
    ypos += (mouseY-ypos)*del;
  }
}


