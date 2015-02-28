
// Image 1: Display, Tint
// Exercises

/* @pjs preload="oriongirl.jpg"; */

size(800,600);
background(255);

PImage img1;
img1 = loadImage("oriongirl.jpg");
tint(184,222,144,150);
image(img1,0,0,400,300);
tint(91,179,128,100);
image(img1,400,0,400,300);
tint(83,130,126,150);
image(img1,0,300,400,300);
tint(255,200);
image(img1,400,300,400,300);

/* @pjs preload="spock.png"; */

PImage img2;
img2 = loadImage("spock.png");
for (int i = 0; i < 800; i += 80) {
  noTint();
  image(img2,i,i+50,100,96);
  image(img2,i+300,i-50,100,96);
  image(img2,i,500,100,96);
  image(img2,i+80,450,100,96);
  image(img2,i+160,400,100,96);
}

/* @pjs preload="kirk.png"; */

PImage img3;
img3 = loadImage("kirk.png");
for (int a = 0; a < 800; a += 100) {
  tint(255,50);
  image(img3,a,a+50);
  image(img3,a+200,a+150);
  image(img3,a+400,a+200);
}
noTint();
image(img3,300,125);


