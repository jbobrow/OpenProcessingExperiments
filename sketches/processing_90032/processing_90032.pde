
PImage M ;
PImage CBC;
PImage DEAD;

void setup(){
  size(600, 600);
  M = loadImage("M.png");
  CBC = loadImage("CBC.png");
  DEAD = loadImage("DEAD.png");
}

void draw (){
  background(34, 167, 170);
  int s = second();
  int m = minute();
  int h = hour();
image(M, h, 400, 200, 200);
image(M, m, 250, 150, 150);
image(M, s, 100, 100, 100);
image (M, s * 10 ,100, 50, 50);
image (M, m * 10 , 30, 50, 50);
image (M, s ,350, 50, 50);
image (M, s * 10 ,450, 50, 50);
image (M, s * 15 ,500, 50, 50);

if (mousePressed == true){
  image(CBC, 0, 0, 600, 600);
  image(DEAD, 10, 500 - s * 10, 200, 200);
}
}
// original cat picture http://www.publicdomainpictures.net/view-image.php?image=25445&picture=cat&large=1




