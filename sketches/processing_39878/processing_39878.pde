
PImage img1, img2, bg;

float tMap[];

void setup() {
  size(270,270);
   frameRate(1);
  
  tMap = new float[width*height];
  int i;
  for (i = 0; i < width*height; i++) {
    tMap[i] = 0;
  }
  
  img1 = loadImage("image_1.png");
  img2 = loadImage("image_2.png");
  
  img1.loadPixels();
  for (i = 0; i < img1.width*img1.height; i++ ) {
    tMap[i] += (alpha(img1.pixels[i]) < 10) ? 1 : 0;
  }
  
  bg = loadImage("bg.jpg");
  draw();
}

void draw() {
  image(bg,0,0);
  
  imageMode(CENTER);
  translate(width/2, height/2);
  image(img1, 0, 0);
  
  
  pushMatrix();
    float a = random(0, TWO_PI);
    rotate(a);
    int x = round(random(-20, 20) + width/2  - (img2.width+100)/2);
    int y = round(random(-20, 20) + height/2 - (img2.height+100)/2);
    
    PGraphics buf = createGraphics(img2.width+100,img2.height+100,JAVA2D);
    buf.beginDraw();
    buf.imageMode(CENTER);
    buf.pushMatrix();
    buf.translate(buf.width/2,buf.height/2);
    buf.rotate(a);
    buf.image(img2,0,0);
    buf.popMatrix();
    buf.endDraw();
    
    buf.loadPixels();
    for (int i = 0; i < buf.width*buf.height; i++ ) {
      tMap[i] += (alpha(buf.pixels[i]) < 10) ? 1 : 0;
    }
    
    blend(buf, 0, 0, img2.width+100, img2.height+100, x, y, img2.width+100, img2.height+100, MULTIPLY);
  popMatrix();    
    
  /*loadPixels();
  for (int i=0; i < width*height; i++) {
    if (tMap[i] == 1) {
      pixels[i] = color(255,0,255);
    }
  }
  updatePixels();
  */
}

