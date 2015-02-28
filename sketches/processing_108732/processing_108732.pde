
color[][] palette = {
  { #46718C, #235466, #0E2827, #142426, #90372B },
  { #6D90A6, #3F85A1, #142D31, #4F5951, #364742 },
  { #3B4F4E, #619FB8, #385245, #8C8579, #8C6D46 },
  { #4E483B, #89D0E0, #4E7352, #F2EADF, #F0AD44},
  { #F2F2F2, #F2F2F2, #739270, #BFB3A8, #F0AD44} };

int s = 5 ;
int d = 6 ;
int m = 0 ;


void setup() {
  size(1280, 720);
  noStroke();
  smooth();
  frameRate(10);

  //// Background Pixel Pallete /////////////////////////////

  for (int x=0 ; x < width ; x += s) {
    for (int y=0 ; y < height ; y += s) {
      fill(palette[int(random(palette.length))][4]);
      rect(x, y, s, s);
    }
  }
  ///////////////////////////////////////////////////////////
}

void drawRect(int n ) {  

  float d2 = mouseY*2 ; // d2 ==> Offset between RectWaves

  for (int j=0 ; j < n ; j++ ) {

    for (int i = 0; i<width; i+=s) {
      float noiseVAL = noise(i*0.01f, frameCount*0.003f)*d2;
      for (int y = 0 ; y < height ; y+=s ) {
        if ( y < int(noiseVAL) ) {
          fill( palette[int(random(palette.length))][m] );        
          rect(i, y, s, s);
        }
      }
    }
  }
}


void draw() {

  drawRect(3);
}


void keyPressed() {

  if (key=='s') {
    save("alless.jpg") ;
    println("Image Saved !");
  }
  if (key=='4') {
    m = 0;
    println("palette 0!");
  }

  if (key=='1') {
    m = 1;
    println("palette 1!");
  }

  if (key=='2') {
    m = 2;
    println("palette 2!");
  }

  if (key=='3') {
    m = 3;
    println("palette 3!");
  }
}
