
PImage img;
RainDrop[] rainDrops= new RainDrop[30];
void setup(){
  size (460, 276);
  img = loadImage("djnate.jpg");
  for(int i = 0;i<30;i++){
    rainDrops[i] = new RainDrop();
  }
  smooth();
  background(120);
  strokeWeight(2);
}
void draw(){
  img.loadPixels();
  for(int i=0;i<30;i++){
    rainDrops[i].move();
    int x=int(rainDrops[i].x);
    int y=int(rainDrops[i].y);
    int loc= x+ y*img.width;
    color c = img.pixels[loc];
    stroke(c);
    rainDrops[i].display();
  }
}

