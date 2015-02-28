
////THIS IS A TEST RUN FOR THE UPLOADING A SKETCH
////original sketch by Barton Poulson; http://www.openprocessing.org/user/11241
////as part of hi lynda.com tutorial
/////lyndaLecture_14_01
////PUBLISHING AND SHARING: sharing via OpenProcessing and other sites


color[] beach = {#D9C6B0, #314650, #2D4761, #45718C, #B6E1F2};
color[] palette = beach;

int s = 50;

void setup(){
  size(600, 200);
  background(palette[0]);
  smooth();
  noStroke();
  frameRate(13);
  
  for(int x = 0; x < width; x += s){
    for(int y = 0; y < height; y += s) {
      fill(palette[int(random(1, 5))]);
      rect(x, y, s, s);
    }
  }
}

void draw(){ 
  fill(palette[int(random(1, 5))]);
  int x = int(random(width/s))*s;
  int y = int(random(height/s))*s;
  rect(x, y, s, s);
}
