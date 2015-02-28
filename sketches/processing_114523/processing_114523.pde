
/*@pjs preload="music-1.png";*/
PImage img;

size(400,400);
background(0,0,0);
img = loadImage("music-1.png");

tint(255,255,255);
image(img,50,50,50,50);

tint(255,255,255);
image(img,100,100,50,50);

tint(255,255,255);
image(img,150,150,50,50);

tint(255,255,255);
image(img,200,200,50,50);

tint(255,255,255);
image(img,250,250,50,50);

tint(255,255,255);
image(img,200,200,50,50);



PFont aaa = createFont("Vijaya",20);
textFont(aaa);

fill(204,0,0);
text("BxHxC",300,300);

for(int i = 0; i < 100; i++){
  stroke(random(100), random(100), random(100));
  line(random(width), random(height), random(width), random(height));
}



