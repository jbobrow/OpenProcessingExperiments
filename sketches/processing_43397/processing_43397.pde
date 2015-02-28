
PImage lava;
PImage alphaVal;
PImage lava2;
int pixelGridX = 10;
int pixelGridY = 10;
float startX;
float startY;
boolean imageShow = false;
boolean test = true;
int modifier = 400/(pixelGridX*pixelGridY);
color pix;

void setup(){
  lava = loadImage("lava.jpg");
  lava2 = loadImage("lava.jpg");
  alphaVal = loadImage("alpha.jpg");
  size(400,400);
  lava.mask(alphaVal);
  //println(modifier);
  
 

}




void draw(){
  background(255);
  
   /*int lw = lava.width;
  int lh = lava.height;
  int ln = lw*lh;

  lava.loadPixels();
  int laps[] = lava.pixels;
  
  int alph = mouseX << 24;
  for (int i=0; i<ln; i++){
    int c = laps[i];
    int r = (c & (255<<16));
    int g = (c & (255<<8));
    int b = (c & (255));
    lava.pixels[i] = alph + r + g + b;
  }*/
  
  lava.updatePixels();

  if(true){//test){
    //println("test");
    // startX = mouseX - pixelGridX/2;
    //startY = mouseY - pixelGridY/2;

    for(int x=0; x<pixelGridX; x++){
      for(int y=0; y<pixelGridY; y++){
        //background(lava);
        pix = lava2.get(((mouseX - pixelGridX/2)+x),((mouseY - pixelGridY/2)+y));

        //noStroke();
        fill(pix);
        
        float rw = modifier*pixelGridX;
        float rh = modifier*pixelGridY;
        rect(pixelGridX*x*modifier,pixelGridY*y*modifier,rw,rh);
        //println(pixelGridX*x +" " + pixelGridY*y);

      }
    }
  }
  if(imageShow){

    image(lava,0,0);
  }
}

void mousePressed(){
  imageShow = !imageShow;

}

