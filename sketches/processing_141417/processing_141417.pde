
//Rachel Hill, HW #8 images, March 24
//Make a small assignment with loading an image
//retreaving pixels and color changing 

PImage img; //declares

void setup() {
  size(414, 518);
  background(50);
  //http://www.littlecornbb.com/faqs, Little Corn Beach and Bungalow
  img = loadImage("BEACH.jpg");
}

void draw() {
  image(img, 50, 50);
  copy(img, 50, int(random(0, 50)), 50, 50, 50, 50, 50, 50);
  copy(img, 100, int(random(0, 50)), 50, 50, 100, 50, 50, 50);
  copy(img, 150, int(random(0, 50)), 50, 50, 150, 50, 50, 50);
  copy(img, 200, int(random(0, 50)), 50, 50, 200, 50, 50, 50);
  copy(img, 250, int(random(0, 50)), 50, 50, 250, 50, 50, 50);

  copy(img, 50, int(random(50, 100)), 50, 50, 50, 100, 50, 50);
  copy(img, 100, int(random(50, 100)), 50, 50, 100, 100, 50, 50);
  copy(img, 150, int(random(50, 100)), 50, 50, 150, 100, 50, 50);
  copy(img, 200, int(random(50, 100)), 50, 50, 200, 100, 50, 50);

  copy(img, 50, int(random(100, 150)), 50, 50, 50, 150, 50, 50);
  copy(img, 100, int(random(100, 150)), 50, 50, 100, 150, 50, 50);
  copy(img, 150, int(random(100, 150)), 50, 50, 150, 150, 50, 50);

  copy(img, 50, int(random(150, 200)), 50, 50, 50, 200, 50, 50);
  copy(img, 100, int(random(150, 200)), 50, 50, 100, 200, 50, 50);

  copy(img, 50, int(random(200, 250)), 50, 50, 50, 250, 50, 50);

  copy(img, 50, int(random(250, 300)), 50, 50, 50, 300, 50, 50);

  copy(img, 50, int(random(300, 350)), 50, 50, 50, 350, 50, 50);
  copy(img, 100, int(random(300, 350)), 50, 50, 100, 350, 50, 50);

  copy(img, 50, int(random(350, 400)), 50, 50, 50, 400, 50, 50);
  copy(img, 100, int(random(350, 400)), 50, 50, 100, 400, 50, 50);
  copy(img, 150, int(random(350, 400)), 50, 50, 150, 400, 50, 50);

  copy(img, 50, int(random(400, 450)), 50, 50, 50, 450, 50, 50);
  copy(img, 100, int(random(400, 450)), 50, 50, 100, 450, 50, 50);
  copy(img, 150, int(random(400, 450)), 50, 50, 150, 450, 50, 50);
  copy(img, 200, int(random(400, 450)), 50, 50, 200, 450, 50, 50);
}


