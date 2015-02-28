
int diameter = 50;
int numBlobs = 20;
int h = 640;
int w = 480; 
Blob[] blobs = new Blob[numBlobs];
void setup() {
  size(640,480);
  //smooth();
  noStroke();
  colorMode(RGB,numBlobs,numBlobs,numBlobs,numBlobs);
  
  for (int i = 0; i < blobs.length; i++) {
    
  int[] f = {int(i),int(random(numBlobs)),int(random(numBlobs)),int(random(numBlobs))};  
  //int[] f = {i,i,i,50};
  float x = random(width);
  float y = random(height);
  int rd = int(random(diameter)); //
 //println(r); 
  blobs[i] = new Blob (x, y, rd, f);
  }
}
void draw() {
  for (int i = 0; i < blobs.length; i++) {
    blobs[i].move();
    blobs[i].display();    
    if (mousePressed){
      blobs[i].changeAlpha();
      blobs[i].changeDiameter();
    }
  }
}
void mouseReleased(){
  //diameter = mouseY/2;
  //blobs[current].changeDiameter(diameter);  
  
  //println(diameter);
}
class Blob {
  float x;
  float y;
  int diameter1;
  int r;
  int g;
  int b;
  int a;
  float speed = 10;
  
  Blob(float tempX, float tempY, int tempDiameter, int tempfill[]) {
    x = tempX;
    y = tempY;
    diameter1 = tempDiameter;
    //println(diameter1);
    r = tempfill[0];
    g =tempfill[1];
    b = tempfill[2];
    a= tempfill[3];
  }
  void move() {
    x += random(-speed, speed);
    y += random(-speed, speed);
    x = min(x,width);
    y = min(y, height);
    x = max(x,0);
    y = max(y, 0);
  }
  void display() {
    fill(r,g,b,a);
    ellipse(x, y, diameter1, diameter1);
  }
  void changeDiameter() {
    diameter1 = int(map(mouseY, 0, height, 0, diameter));
  }
  void changeAlpha() {
    a = int(map(mouseX, 0, width, 0, numBlobs));
  }
}


