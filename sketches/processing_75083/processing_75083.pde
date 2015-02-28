
PImage img;
int frame = 0;
int numFrames =2; 

void setup() {
  size(278,415);
 
  img = loadImage("pic3.png");
  background(155);
  noStroke();
}

void draw() {
  image(img, 0, 0);
   for (int x = 290; x<380; x+=1) {
      for (int y = 100; y<211; y+=1) {
        stroke(random(255));
        point(x, y);
      }
    }
 
    frame = frame + 1;
    if (frame>=numFrames) {
      frame=0;
    }


  int xa = 0;
 int ya = 0;
  for(int i = 255; i > 0; i -= 25){
   fill(250 - i, 10 + i, 255 + i, 50);
  rect(xa, ya, 50, 500);
  xa = xa + 50;
  }
   
  int xb = 0;
  int yb = 0;
  for(int i = 255; i > 0; i -= 25){
  fill(250 - i, 10 + i, 255 + i, 50);
  rect(xb, yb, 500, 50);
  yb = yb + 50;
   
  }
}



