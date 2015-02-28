
float max_distance;
int blocksize;
void setup() {
    size(500,500);
    blocksize = 10;
    noStroke();
    max_distance = dist(0,0,width,height);
}

void draw() {
  background(50);
    for(int y=0; y<= width; y+=blocksize) {
      for(int x=0; x<width;x+=blocksize) {
        float size = dist(mouseX, mouseY, y, x);
        size = size/max_distance * 120;

        ellipse(x,y,size,size);
      }
    }
      int specialX = mouseX - (mouseX % blocksize);
      int specialY = mouseY - (mouseY % blocksize);
      fill(25);
      ellipse(specialX, specialY, blocksize,blocksize);
}


