
/* @pjs pauseOnBlur=true; 
preload="masssm.gif, sig.gif"; 
 */

PImage img;
PImage sig;
int offset = 200;
int pixscale = 2;

ArrayList pixelArray;

void setup(){
  img = loadImage("masssm.gif");
  sig = loadImage("sig.gif");
  size(700,342);
  //size(img.width*pixscale+offset, img.height*pixscale+offset);
  noStroke();
  frameRate( 20 );
  

  pixelArray = new ArrayList();
  loadPix();
}

void draw() {
  background(0);
  image(sig,0,0);
  //image(img,0,0);


  for (int i = 0; i < pixelArray.size(); i++){
    Pixel p = (Pixel)pixelArray.get(i);
    float x = offset/2+p.x*pixscale;
    float y =  offset/2+p.y*pixscale;
    float r = sqrt(pow(mouseX-x,2)+pow(mouseY-y,2));

    float dx = 50*(x-mouseX)/pow(r,0.9);
    float dy = 50*(y-mouseY)/pow(r,0.9);
    float w = max(0.7,4/pow(r,0.3));
    fill(p.c);
    rect(x+dx,y+dy, p.s*w, p.s*w);
    pixelArray.set(i,p);
  }
}

void loadPix(){
  pixelArray.clear();
img.loadPixels();
  for (int i = 0; i < img.width; i++){
    for (int j = 0; j < img.height; j ++){
      int loc = i + j*img.width;
      //println(img.loaded);
      if (alpha(img.pixels[loc] )==255)
        pixelArray.add(new Pixel(i,j,img.pixels[loc] ));
    }
  }
}

class Pixel {
  int x,y,c;
  float s;
  Pixel(int i, int j, int col){
    x = i;
    y = j;
    c = col;
    s = pixscale;
  }
}

