

PImage clouds;
PImage c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19;
 
void setup() {
  size(1200, 800);
  background(0,0,0);
  smooth();
  frameRate(random(5));
  imageMode(CENTER);

  clouds = loadImage("clouds.jpg");
   
  //Collage Images
  c1 = loadImage("img1.png");
  c2 = loadImage("img2.png");
  c3 = loadImage("img3.png");
  c4 = loadImage("img4.png");
  c5 = loadImage("img5.png");
  c6 = loadImage("img6.png");
  c7 = loadImage("img7.png");
  c8 = loadImage("img8.png");
  c9 = loadImage("img9.png");
  c10 = loadImage("img10.png");
  c11 = loadImage("img11.png");
  c12 = loadImage("img12.png");
 c13 = loadImage("img13.png");
 c14 = loadImage("img14.png");
 c15 = loadImage("img15.png");
  c16 = loadImage("img16.png");
  c17 = loadImage("img17.png");
  c18 = loadImage("img18.png");

}
 
void draw() {
  
 float x = random(width);
float y = random(height);

  
  image(c1, x, y);
  image(c2, x, y);
  image(c3, x, y);
  image(c4, x, y);
  image(c5, x, y);
  image(c6, x, y);
  image(c7, x, y);
 image(c8, x, y);
 image(c9, x, y);
 image(c10, x, y);
 image(c11, x, y);
 image(c12, x, y);
 image(c13, x, y);
 image(c14, x, y);
 image(c15, x, y);
 image(c16, x, y);
 image(c17, x, y);
 image(c18, x, y);

  //MUST BE LAST THING
  image(clouds, 0, 0,0);
  tint(clouds, 0, 153, 204, 126);
  image(clouds, 50, 0);
}
  



