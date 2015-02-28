
PImage img01;
PImage img02;
PImage img03;
PImage img04;
PImage img05;

int grenze01 = 444;
int grenze02 = 555;
int grenze03 = 300;

void setup () {

  size(666, 450);
  smooth();
  imageMode(CENTER);
  img01 = loadImage("hauptbild.jpg");
  img02 = loadImage("02.jpg");
  img03 = loadImage("03.jpg");
  img04 = loadImage("04.jpg");
  img05 = loadImage("alles.jpg");
}

void draw () {
  background(img01);

  if (mouseX >= grenze02)
    image(img02, width/2, height/2);
  if (mouseX <= grenze01)
    image(img04, width/2, height/2);  
  if (mouseY >= grenze03)
    image(img03, width/2, height/2);


  if (mousePressed) {
    image(img05, width/2, height/2);
  }
}


