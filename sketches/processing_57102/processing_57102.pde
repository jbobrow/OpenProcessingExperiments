
PImage img;
PImage img1;
PImage img2;
PImage img3;

int transparency1;
int transparency2;
int transparency3;

void setup(){
  size(640,480);
  transparency1 = 255;
  transparency2 = 0;
  transparency3 = 0;
  img = loadImage("gbr.jpg");
  img1 = loadImage("gambar.jpg");
  img2 = loadImage("gbr_01.jpg");
  img3 = loadImage("gbr_02.jpg");
}

void draw(){
  background(255);
  tint(255,255,255,transparency1);
  image(img, 0, 0);
  if(transparency1 > 0){
    transparency1--;
  }
  tint(255,255,255,255-transparency1);
  image(img1, 0, 0);
  
  tint(255,255,255,transparency2);
  image(img2, 0, 0);
  if((transparency1 == 0) && (transparency2 < 255)){
    transparency2++;
  }
  
  tint(255,255,255,transparency3);
  image(img3, 0, 0);
  if((transparency2 > 0)&&(transparency2==255)){
    transparency3++;
  }

}

