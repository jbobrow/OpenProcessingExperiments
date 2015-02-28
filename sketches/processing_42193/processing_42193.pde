
int slide = 0;
boolean paused = false;
PImage[] images = new PImage[139];  // an array holding 5 images

void setup() {
  frameRate(10);
  size(253, 179);
  background(200);
  for (int i=0; i<139; i++) {
    images[i] = loadImage((i+1)+".jpg");
    //println(i+1+".jpg");
  }
}


void draw() { 
  background(200);
  imageMode(CENTER);
   if (slide > 137) {
    slide=0;
  }
   if (slide < 0) {
    slide=137;
  }
  image(images[slide], 126.5, 89.5);
   if (paused==false) {
    slide++;
  }
}

void mousePressed() {
  if (paused==true) {
    paused = false;
  }
  else
    paused = true;
}

void keyPressed(){
 if (paused==true){
    if(keyCode == LEFT){
       slide--; 
    }
    if(keyCode == RIGHT){
       slide++; 
    }
 } 
}


