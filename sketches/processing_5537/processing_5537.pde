
PImage[] images = new PImage[10]; 
float x,y;
float rot;


void setup() {
  size(800,600);
  images[0] = loadImage ("balloon5.gif");
  images[1] = loadImage ("balloon2.gif");
  images[2] = loadImage ("balloon3.gif");
  images[3] = loadImage ("balloon4.gif");
  images[4] = loadImage ("balloon1.gif");
  images[5] = loadImage ("balloon2.gif");
  images[6] = loadImage ("balloon3.gif");
  images[7] = loadImage ("balloon4.gif");
  images[8] = loadImage ("balloon1.gif");
  images[9] = loadImage ("balloon2.gif");
  
  x = 1.0;
  y = width/2.0;
  rot = 0.0;
}

void draw() {
  background(73,168,229);
// balloons!
  translate(x,y);
  rotate(rot);
  image(images[0],0,0);
  translate(x,y);
  rotate(rot);
  image(images[1],100,250);
  translate(x,y);
  rotate(rot);
  image(images[2],300,100);
  translate(x,y);
  rotate(rot);
  image(images[3],50,100);
  translate(x,y);
  rotate(rot);
  image(images[4],75,600);
  translate(x,y);
  rotate(rot);
  image(images[5],420,420);
  translate(x,y);
  rotate(rot);
  image(images[6],725,300);
  translate(x,y);
  rotate(rot);
  image(images[7],550,500);
  translate(x,y);
  rotate(rot);
  image(images[8],100,400);
  translate(x,y);
  rotate(rot);
  image(images[9],200,90);

  
  x += 1.0;
  rot += 0.01;
  if (x > width) {
    x = 0;
  }
}


