
// "Busy Beaver" automata by Dr. Goulu (www.goulu.net) 
// the beaver aims in one direction (NESW) and moves forward by one cell
// if the cell it lands on is empty, it turns 90° right and sets the cell
// is the cell is on, the beaver turns 90° left and clears the cell
// note how complex the path is before the beaver gets trapped on an oblique path to infinity
// tech stuff  : uses an image for the bitmap
// zooms out of the image and accelerates calculation simultaneously
// usage : enjoy and press any key to reset

int side=151;
PImage img= createImage(side,side, RGB);
float zoom,speed;

int side2=side*side;
int cpos; // castor position
int cdir=0;
int[] dirs = new int[4]; 
long gen;


color coff=color(255,255,255); // off is white
color con=color(0,0,0);

void setup() 
{
  zoom=3*side;
  size(3*side, 3*side);  
  speed=0.1;
  dirs[0]=-side; 
  dirs[1]=-1; 
  dirs[2]=side; 
  dirs[3]=1;
  clear();
  cpos=side2/2;
  gen=0;
}

void clear()
{
  for(int i=0; i < img.pixels.length; i++) {
    int c=int(random(256));
    img.pixels[i] = coff; 
  }
}

void keyPressed()
{
  setup();
}

void draw() 
{
  img.loadPixels();
  while (gen<speed) {
    if (img.pixels[cpos]==con) {
      img.pixels[cpos]=coff;
      cdir+=1;  
    } 
    else {
      img.pixels[cpos]=con;
      cdir-=1;  
    }
    cdir=(cdir+4)%4;
    cpos=(cpos+side2+dirs[cdir])%side2;
    gen+=1;
  }
  img.updatePixels();

  if (zoom<=3) {
    zoom=3;
    speed+=250; // max generations at each step
  } 
  else {
    speed*=1.005;
    zoom/=1.0022;
  }
  int s=int(side*zoom); 
  int o=(width-s)/2;
  image(img, o,o,s,s);
}


