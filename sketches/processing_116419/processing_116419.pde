
PImage[] img = new PImage[26];

void setup() {
  size(800, 800);


  for (int i=1; i< img.length; i++)
  {
    img[i] = loadImage(i + ".jpg");
    img[i].resize(100, 80);
    tint(255, 126);
  }
}
int currentkey;
int lastkey;

void keyReleased() {
  lastkey = currentkey;
  currentkey = key-48;
}
void draw() {
  background(0);
  for (int i = 1; i<6; i++) {
    for (int j =1; j<6; j++) {
      tint(255, 50);

      if (i==1&&currentkey==j) {
        tint(255, 255);
      }
      else if (j==1&&lastkey==i) {
        tint(255, 255);
      }
      if (i==lastkey&&j==currentkey) {
        tint(255, 255);
      }

      int s = findimg(i, j);
      image(img[s], (i-1)*140+70, (j-1)*140+70);
  
  textSize(30);
  smooth();
  text("Press numbers 2-5 , and see what you get!",20,30);
  fill(255);
  
  framwork(60);
  }
  }
}

void framwork(int r){
  strokeWeight(3);
  noFill();
  stroke(255);
  rect(242,2,r,35,7);
}

int findimg(int i, int j) {
  int s = j+(i-1)*5;
  return s;
}


