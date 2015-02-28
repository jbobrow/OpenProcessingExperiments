
size (720, 600);
PImage img;
img = loadImage("snowflakes.jpg");
/* @pjs preload="snowflakes.jpg"; */
//imgTwo = loadImage("snowflakes-on-wood");
for (float x = 0; x <10 ; x++){
  float n = pow (x, 3);
  //float y = pow (x, 0.5);
  //y *= 600;
  tint(230, 21, 60);
  image (img, n ,0, 600 , 600);
  tint (125, 110, 23);
  image (img, n, 200,600,600);
  noTint();
  image (img, n, 400, 600, 600);
}



