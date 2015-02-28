
int state = 0;    // state
int x1 = 0;
int x2 = 0;
int x3 = 0;
int x4 = 0;

PImage img1;      //images
PImage img2;
PImage img3;
PImage img4;
PImage img5;

void draw(){
 if (state  == 0){
image (img1, 0, 0);
 }
if(state == 1){
 image (img2, 0, 0);
  x1++;

 }
if(state == 2){
image (img3, 0, 0);
 } 
    x2++;
if (state >= 3){
image (img4, 0, 0);
}
 x3++;
if (state >= 4){
image (img5, 0, 0);
}
}
void mousePressed(){
  state = state + 1;
  }
void setup() {
  size(450, 377);
  background(0);
  
  img1 = loadImage ("sipario1.jpg");
  img2 = loadImage ("mani.jpg");
  img3 = loadImage ("mani2.jpg");
  img4 = loadImage ("mani3.jpg");
  img5 = loadImage ("sipario2.jpg");
}



