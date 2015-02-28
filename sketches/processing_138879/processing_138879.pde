
size(1500,700);
background(255);

PImage img;
//color blue = color(0,140, 200);
//img = loadImage("luggage.jpg");
//tint(103); // tint gray
//image(img, 0, 0);
//tint(blue);
//image(img,1000,0);
//noTint(); //disable
//image(img,500, 0);

img = loadImage("luggage.jpg");
background(255);
tint(255, 150);
//image 10x
for(int i=0; i<10; i++) {
  image(img, i*100,0);
}

for(int i=0; i<20; i++) {
  image(img,0,i*10);
}






