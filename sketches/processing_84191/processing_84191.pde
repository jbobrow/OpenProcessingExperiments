
PImage[] myImageArray = new PImage[23];



void setup() {
  size(320, 320);


myImageArray[0] = loadImage("IMG_0679.jpg");
  myImageArray[1] = loadImage("IMG_0680.jpg");
  myImageArray[2] = loadImage("IMG_0681.jpg");
  myImageArray[3] = loadImage("IMG_0682.jpg");
  myImageArray[4] = loadImage("IMG_0683.jpg");
  myImageArray[5] = loadImage("IMG_0684.jpg");
  myImageArray[6] = loadImage("IMG_0685.jpg");
  myImageArray[7] = loadImage("IMG_0686.jpg");
  myImageArray[8] = loadImage("IMG_0687.jpg");
  myImageArray[9] = loadImage("IMG_0688.jpg");
  myImageArray[10] = loadImage("IMG_0689.jpg");
  myImageArray[11] = loadImage("IMG_0692.jpg");
  myImageArray[12] = loadImage("IMG_0693.jpg");
  myImageArray[13] = loadImage("IMG_0694.jpg");
    myImageArray[14] = loadImage("IMG_0695.jpg");
  myImageArray[15] = loadImage("IMG_0696.jpg");
  myImageArray[16] = loadImage("IMG_0699.jpg");
  myImageArray[17] = loadImage("IMG_0700.jpg");
  myImageArray[18] = loadImage("IMG_0701.jpg");
  myImageArray[19] = loadImage("IMG_0702.jpg");
  myImageArray[20] = loadImage("IMG_0703.jpg");
  myImageArray[21] = loadImage("IMG_0704.jpg");
  myImageArray[22] = loadImage("IMG_0705.jpg");
frameRate(20);
}

void draw() {
   if(!mousePressed){  

int p = int(random(23));

image(myImageArray[p],0,0);

}
}



