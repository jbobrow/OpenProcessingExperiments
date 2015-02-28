
// Gordon Queen - This Way Up

import gifAnimation.*;
float x = 350;
float y = 25;
float w = 100;
float h = 67;
float ranNum;
int ranNumRound;
PImage[] images = new PImage[51]; // image array
PImage Polaroids;
    
Gif loopingGif;
 
void setup() {
  size(800, 400);
  background(255);
  stroke(0);
  frameRate(10);
  loopingGif  = new Gif(this, "http://i.imgur.com/qebohWN.gif");
  Polaroids = loadImage("http://i.imgur.com/2zmklPT.gif");
  images[0] = loadImage("http://i.imgur.com/UN7BfJS.gif");
  images[1] = loadImage("http://i.imgur.com/LDr2Gzn.gif");
  images[2] = loadImage("http://i.imgur.com/TYntISW.gif");
  images[3] = loadImage("http://i.imgur.com/Tc8RAHd.gif");
  images[4] = loadImage("http://i.imgur.com/g5p9teB.gif");
  images[5] = loadImage("http://i.imgur.com/3vMoURW.gif");
  images[6] = loadImage("http://i.imgur.com/9OL3AnU.gif");
  images[7] = loadImage("http://i.imgur.com/ZfahQ4Z.gif");
  images[8] = loadImage("http://i.imgur.com/krxAa75.gif");
  images[9] = loadImage("http://i.imgur.com/77OZwRo.gif");
  images[10] = loadImage("http://i.imgur.com/Px1mDdL.gif");
  images[11] = loadImage("http://i.imgur.com/EMdFi7r.gif");
  images[12] = loadImage("http://i.imgur.com/nP6B8B7.gif");
  images[13] = loadImage("http://i.imgur.com/w2sKurq.gif");
  images[14] = loadImage("http://i.imgur.com/Zq5fnDv.gif");
  images[15] = loadImage("http://i.imgur.com/HYXgVeq.gif");
  images[16] = loadImage("http://i.imgur.com/eBnwyM0.gif");
  images[17] = loadImage("http://i.imgur.com/SnosGVS.gif");
  images[18] = loadImage("http://i.imgur.com/BpyYULs.gif");
  images[19] = loadImage("http://i.imgur.com/egO2RUj.gif");
  images[20] = loadImage("http://i.imgur.com/706Uw2K.gif");
  images[21] = loadImage("http://i.imgur.com/3kH5Mqc.gif");
  images[22] = loadImage("http://i.imgur.com/XaK7fb4.gif");
  images[23] = loadImage("http://i.imgur.com/1KPypA4.gif");
  images[24] = loadImage("http://i.imgur.com/kteIbeA.gif");
  images[25] = loadImage("http://i.imgur.com/z4tScxl.gif");
  images[26] = loadImage("http://i.imgur.com/5YBAJno.gif");
  images[27] = loadImage("http://i.imgur.com/KAsPftn.gif");
  images[28] = loadImage("http://i.imgur.com/jzBuQLi.gif");
  images[29] = loadImage("http://i.imgur.com/Yp6NzcM.gif");
  images[30] = loadImage("http://i.imgur.com/yGInQfl.gif");
  images[31] = loadImage("http://i.imgur.com/SgDoaKu.gif");
  images[32] = loadImage("http://i.imgur.com/3BCHPXe.gif");
  images[33] = loadImage("http://i.imgur.com/UPmRdV5.gif");
  images[34] = loadImage("http://i.imgur.com/gk41a46.gif");
  images[35] = loadImage("http://i.imgur.com/7dlI7l0.gif");
  images[36] = loadImage("http://i.imgur.com/xIbUM5u.gif");
  images[37] = loadImage("http://i.imgur.com/NTn3MyU.gif");
  images[38] = loadImage("http://i.imgur.com/V8xtshQ.gif");
  images[39] = loadImage("http://i.imgur.com/xIVGMG6.gif");
  images[40] = loadImage("http://i.imgur.com/QAlrw1d.gif");
  images[41] = loadImage("http://i.imgur.com/PywhD1A.gif");
  images[42] = loadImage("http://i.imgur.com/hWqsPbU.gif");
  images[43] = loadImage("http://i.imgur.com/S3Hkazb.gif");
  images[44] = loadImage("http://i.imgur.com/cPUURun.gif");
  images[45] = loadImage("http://i.imgur.com/3t8uCp7.gif");
  images[46] = loadImage("http://i.imgur.com/7zPLID0.gif");
  images[47] = loadImage("http://i.imgur.com/5jg8z7M.gif");
  images[48] = loadImage("http://i.imgur.com/kp2fCKU.gif");
  images[49] = loadImage("http://i.imgur.com/jbc224y.gif");
  images[50] = loadImage("http://i.imgur.com/uEQhBXw.gif");
}
 
void draw() {
  image (Polaroids, 0, -100);
  image (loopingGif, x, y);
      translate(0,height);
      scale(1,-1);
}
 
void mouseMoved() {
  if (mouseX>x &&  mouseX <x+w && mouseY>y && mouseY <y+h) {
    loopingGif.play();

    ranNum = random(50);
    ranNumRound = round(ranNum);
    println(ranNumRound);
    
    tint(255,255,255,100);
    image(images[ranNumRound], random(800), random(190), 100, 100); 
}
}


