
//Code modified from Anna Pateras
//http://www.openprocessing.org/visuals/?visualID=21916
int numFrames = 24;
int frame = 0;
int count = 0;
PImage[] images = new PImage[numFrames];
 
void setup() {
  size(800, 600);
  frameRate(3.5);
  noLoop();
   
images[0] = loadImage("IMG_2308.JPG");
images[1] = loadImage("IMG_2309.JPG");
images[2] = loadImage("IMG_2310.JPG");
images[3] = loadImage("IMG_2311.JPG");
images[4] = loadImage("IMG_2312.JPG");
images[5] = loadImage("IMG_2313.JPG");
images[6] = loadImage("IMG_2314.JPG");
images[7] = loadImage("IMG_2315.JPG");
images[8] = loadImage("IMG_2316.JPG");
images[9] = loadImage("IMG_2317.JPG");
images[10] = loadImage("IMG_2318.JPG");
images[11] = loadImage("IMG_2319.JPG");
images[12] = loadImage("IMG_2320.JPG");
images[13] = loadImage("IMG_2322.JPG");
images[14] = loadImage("IMG_2323.JPG");
images[15] = loadImage("IMG_2324.JPG");
images[16] = loadImage("IMG_2325.JPG");
images[17] = loadImage("IMG_2326.JPG");
images[18] = loadImage("IMG_2327.JPG");
images[19] = loadImage("IMG_2328.JPG");
images[20] = loadImage("IMG_2329.JPG");
images[21] = loadImage("IMG_2330.JPG");
images[22] = loadImage("IMG_2331.JPG");
images[23] = loadImage("IMG_2332.JPG");
 
}
 
void draw () {
 frame++;
  if (frame == numFrames) {
    frame = 0;
  
}
     
image(images[frame], 0, 0);
   
}
 
void mousePressed(){
  if(mousePressed &&(mouseButton == LEFT)){
  loop();
  count=1;
  }
   if (mousePressed &&(mouseButton == RIGHT)){
    noLoop(); 
    count=1;
}
}


