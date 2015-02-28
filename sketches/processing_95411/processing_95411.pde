
PImage img1, img2;

void setup() {
  size(600,600);
background(0);
img1 = loadImage("1_tracy.png");
img2 = loadImage("2_tracy.png");

}

void draw() {
fill(100);
ellipse(350,500,50,50);
ellipse(250,500,50,50);
ellipse(400,280,50,50);
ellipse(200,280,50,50);
rect(280,300,40,100);
rect(285,100,30,100);
quad(220, 200, 380, 200, 320, 340, 280, 340);
ellipse(300,130,100,100);


image(img1, 100, 50);
image(img2, 400, 50);}


