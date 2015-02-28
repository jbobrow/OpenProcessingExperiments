
PImage doggy;
PImage sky;
PImage grassy;

void setup() {
   size(795,664);
   doggy = loadImage("doggy1.gif");
   sky = loadImage("http://missusboom.files.wordpress.com/2013/05/wpid-clean-pixel-landscape1.jpg");
   grassy = loadImage("grassy1.png");
}


void draw() {
  background(255);
  int r = round( map(mouseX, 0,width, 0,255) );
  fill(r,0,0);
  float backgroundX=map(mouseX, 0, 1000, 0, 1000);
  float yay=map(mouseX, -100, 1000, 100, -1000);
  image(sky, yay/8, 0);
  image(grassy, yay/2, 600);
  image(doggy,backgroundX, 550);
  dog.resize(100,100);
 
}



