
int  iw= 0;
int  ih= 0;
float bright = 0.0;

PImage B;

void setup(){
  B = loadImage ("seurat-sm[final].gif");
  B.loadPixels();
  size (500, 340);
  iw = B.width;
  ih = B.height;
  
}

void draw(){

  if (keyPressed == true) {

    background (B);

  } 

  for (int i=0; i<10000; i++){
    int rx = (int)random (iw-1);
    int ry = (int)random (ih-1);
    color c = B.pixels[mouseY*iw +mouseX];

    if (mousePressed == true) {

      float bright = (red(c) + green(c) + blue (c))/3.0/255.0;
      if ( B.pixels[mouseY*iw +mouseX]< bright){
        stroke(c);
        point (rx,ry);

      }
    }
  }
}

