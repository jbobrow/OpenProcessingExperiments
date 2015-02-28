
PImage bground;
Img pic1, pic2, pic3, pic4, pic5, pic6, pic7, pic8, pic9, pic10, pic11, pic12;

void setup() {

  size(1280, 800);
  noCursor();
  imageMode(CENTER);

  bground = loadImage("hoodmountain.jpg");

  pic1 = new Img("hood1.png", width/2, height/2, 1, 1);

  pic2 = new Img("hood2.png", 700, 100, -0.3, 0.55);

  pic3 = new Img("hood3.png", 400, 500, 0.45, 0.25);

  pic4 = new Img("hood4.png", 100, 100, -0.75, -0.45);

  pic5 = new Img("hood5.png", 700, 150, 0.45, -0.25);

  pic6 = new Img("hood6.png", 1100, 150, 0.15, 0.25);

  pic7 = new Img("hood7.png", 200, 600, -0.25, -0.30);

  pic8 = new Img("hood8.png", 70, 700, 0.25, 0.15);

  pic9 = new Img("hood9.png", 200, 200, 0.20, 0.35);

  pic10 = new Img("hood10.png", 1150, 100, 0.55, -0.35);

  pic11 = new Img("hood11.png", 550, 200, -0.45, -0.35);

  pic12 = new Img("hood12.png", 550, 700, 0.55, 0.45);
}

void draw() {

  tint(255);  
  image(bground, width/2, height/2, width, height);

  pic1.update();
  pic1.display();

  pic2.update();
  pic2.display();

  pic3.update();
  pic3.display();

  pic4.update();
  pic4.display();

  pic5.update();
  pic5.display();

  pic6.update();
  pic6.display();

  pic7.update();
  pic7.display();

  pic8.update();
  pic8.display();

  pic9.update();
  pic9.display();

  pic10.update();
  pic10.display();

  pic11.update();
  pic11.display();

  pic12.update();
  pic12.display();
}


