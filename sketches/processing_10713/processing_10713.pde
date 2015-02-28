
void setup () {
  size (900, 450);
  colorMode(HSB, 500); 
  noStroke();
  noLoop();
}



void draw () {
  float c = random(300);  
  float r = random(1,random(10));
  for (int i = 0; i < height; i = i + 10){
    for (int j = 0; j < width; j = j + 10){
      c = c + random (r*-1,r);
      fill (c,500,500);
      rect(j,i,10,105);
    }  
    filter(ERODE);
  }
  //filter(POSTERIZE, 4);
 filter(DILATE);
  filter(BLUR,5);
  

}

