
void setup() {

  size(540,334);
  noStroke();
  smooth();
  handleBox(0,0,600,400,128);
}

void handleBox(float ulx,float uly,float wid,float hgt,int gray) {

  fill(gray);
  rect(ulx,uly,wid,hgt);

  //最小サイズ
  int minSide = 2;
  if((wid < minSide) || (hgt < minSide)) {
    return;
  }

  if(wid > hgt) {

    float leftWid = wid * random(0.25,0.75);
    handleBox(ulx,uly,leftWid,hgt,gray - 10);
    handleBox(ulx + leftWid, uly, wid-leftWid,hgt,gray + 10);
  }
  else {
    float topHgt = hgt * random(0.25,0.75);
    handleBox(ulx,uly,wid,topHgt,gray - 10);
    handleBox(ulx,uly + topHgt,wid,hgt- topHgt, gray + 10);
  }  
  /* 
   float wid2 = wid/2.0;
   handleBox(ulx,uly,wid2,hgt,gray-10);
   handleBox(ulx + wid2, uly , wid2, hgt, gray+10);
   */
}
