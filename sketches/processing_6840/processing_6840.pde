

int pxS=3;// pixel size
float[][] hues;// hue
float[][] bris;// brightness

void setup() {
  frameRate(30);
  size(300,300);
  colorMode(HSB);
  hues=new float[width/pxS][height/pxS];
  bris=new float[width/pxS][height/pxS];
  noStroke();
  for (int x=0;x<width/pxS;x++) {
    for (int y=0;y<height/pxS;y++) {
      hues[x][y]=0;
      bris[x][y]=0;
    }
  }
}

void draw() {
  for (int x=0;x<width/pxS;x++) {
    for (int y=0;y<height/pxS;y++) {
      if (mousePressed) {
        bris[x][y]+=max(30-dist(mouseX,mouseY,x*pxS,y*pxS),0)/10;
      }
      else{
        hues[x][y]+=max(30-dist(mouseX,mouseY,x*pxS,y*pxS),0)/10;
      }
      hues[x][y]=(hues[x][y]+0.2)%0xFF;// make it loop
      bris[x][y]=(bris[x][y]+0.3)%(0xFF*2);// make it loop nicely
      fill(hues[x][y],0xFF,abs(bris[x][y]-0xFF));
      rect(x*pxS,y*pxS,pxS,pxS);// draw the pixel
    }
  }
}






