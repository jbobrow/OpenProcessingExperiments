

void setup() {
  size(600,600);
  noStroke();
  frameRate(1);

}

void draw() {
    background(0);
    handleBox(0,0,600,600,color(128,128,128));
}

color changeColor(color c, float low, float hi) {
  color newColor=color(red(c)+random(low,hi),
                      green(c)+random(low,hi),
                      blue(c)+random(low,hi));
  return newColor;
}
void handleBox(float ulx, float uly, float wid, float hgt, int colr) {
  fill(colr);
  rect(ulx,uly,wid,hgt);  
  int minSide=20;
  if ((wid<minSide) || (hgt<minSide)) {
    return;
  }
  if (wid>hgt) {
    //float wid2=wid/2.0;
    //handleBox(ulx,uly,wid2,hgt,grayness-10);
    //handleBox(ulx+wid2,uly,wid2,hgt,grayness+10);
    float leftWid=wid*random(0.25,0.75);
    handleBox(ulx,uly,leftWid,hgt,changeColor(colr,-20,-10));
    handleBox(ulx+leftWid,uly,wid-leftWid,hgt,changeColor(colr,10,20));
  } else {
    //float hgt2=hgt/2.0;
    //handleBox(ulx,uly,wid,hgt2,grayness-10);
    //handleBox(ulx,uly+hgt2,wid,hgt2,grayness+10);
    float topHgt= hgt*random(0.25,0.75);
    handleBox(ulx,uly,wid,topHgt,changeColor(colr,-20,-10));
    handleBox(ulx,uly+topHgt,wid,hgt-topHgt,changeColor(colr,10,20));
  }

}


