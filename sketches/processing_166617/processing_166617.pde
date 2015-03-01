
PImage img;

int transparency1;
void setup() {
  size(500,304);
  transparency1 = 225;
img = loadImage("redleafcopy.jpg");
}
void draw () {
  background(255);
  tint(255,255,255-transparency1);
if(transparency1 > 0){
    transparency1--;
  }
  tint(255,255,255,255-transparency1);
  image(img, 0, 0);
   }



