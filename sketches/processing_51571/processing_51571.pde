

int maxSlices = 256; 
Slice[] slice = new Slice[maxSlices];
int n = 16;
float step = 2;
PImage img;       

void setup() {
  smooth();  
  background(0);
  // Picture from Sukanto Debnath 
  // http://www.flickr.com/photos/sukanto_debnath/2354607553
  img = loadImage("http://farm3.staticflickr.com/2340/2354607553_9996a0c8fc.jpg"); 
  size(img.width + 2*img.width/3, img.height); 
  for (int i = 0; i < n; i++) {
    slice[i] = new Slice(int(i*img.width/n),int(img.width/n),img);
  }
  println(width);
  println(height);
}

void draw() {
  fill(0);
  rect(0,0,width,height);

  for (int i = 0; i < n; i++) {
    slice[i].update();
    slice[i].checkMove();
    slice[i].paint();
  }
}

void mousePressed() {
  //save("pic.jpg");
  n = int(n*step);
  if(n > maxSlices | n < 4){
    step = 1/step;
    n = int(n*step*step);
  } 
  for (int i = 0; i < n; i++) {
    slice[i] = new Slice(int(i*img.width/n),int(img.width/n),img);
  }
}


