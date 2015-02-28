
float boobsizes[]=new float[16];
float nipplesizes[]=new float[16];

void setup () {
  size (480, 320);
  for (int i=0; i<16; i++) {
    boobsizes[i]=random(25, 60);
    nipplesizes[i]=random(5, 15);
  }
}

void draw () {
  smooth ();
  background (32, 122, 245);
  //drawboob (100, 100, 40, 10, 0);
  //drawboob (200, 100, 40, 10, 1);


  for (int i=0; i<4; i++) {
    for (int j=0; j<4; j++) {
      drawboobpair (i*width/4+60, j*height/4 + 40, boobsizes[j+4*i], 
      nipplesizes[j+4*i]+map(random(mouseX),0,480,0,10));
    }
  }
}

void drawboob(
float x, 
float y, 
float boobSize, 
float nippleSize, 
int nipplePlace) {
  fill (239, 208, 207);
  stroke (0);
  strokeWeight (3);
  ellipse (x, y, boobSize, boobSize);

  fill (240, 128, 126);
  stroke (245, 36, 32);
  strokeWeight (1.5);
  if (nipplePlace == 0) {
    // The nipple will be on the left side
    ellipse (x-nippleSize/3, y+nippleSize/2, nippleSize, nippleSize);
  }
  else {
    ellipse (x+nippleSize/3, y+nippleSize/2, nippleSize, nippleSize); 
    // The nipple will be on the right side
  }
}

void drawboobpair(
float x, 
float y, 
float boobSize, 
float nippleSize)

{
  drawboob (x-boobSize/2, y, boobSize, nippleSize, 0);
  drawboob (x+boobSize/2, y, boobSize, nippleSize, 1);
}


