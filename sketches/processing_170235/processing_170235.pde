
float znoise = 0;
PImage[] img;

void setup() {
  size(600, 600, P3D);
  img = new PImage[5];
  for (int num=0; num<=4; num++){
    img[num]=loadImage((num+1)+".png");
  }
}

void draw() {
  colorMode(HSB, 360, 100, 100);
  background(198,50,98);

// noise water
  float xnoise = 0, ynoise = 0, inc = 0.01;
  for (int y=0; y<height; y++){
    for (int x=0; x<width; x++){
      float r=noise(xnoise,ynoise,znoise)*255;
      stroke(r);
      point(x,y);
      xnoise=xnoise+inc;
    }
    xnoise=0;
    ynoise=ynoise+inc;
  }
  znoise+=0.1;

  //waste
  if (mousePressed) {
    int[] ix = new int[5];
    int[] iy = new int[5];
    for (int i=0; i<=4; i++){
      ix[i] = int(random(10,width-120));
      iy[i] = int(random(20,height/2-40));
      image(img[i], ix[i], iy[i]);
      println("pressed!");
    }
  }
  
  // fishnet
  beginShape();
  stroke(0);
  strokeWeight(5);
  float t=0;
  float tDelta=radians(1);
  float w=-(PI/10); // 0.1~10
  for (int pz=0; pz<50; pz++) {
    for (int x=0; x<width; x++) {
      float y=height/2-100*3*sin(w*t)-100;
      point(x, y, pz);
      t+=tDelta;
    }
  }
  endShape();
}


