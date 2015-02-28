
PImage metal; 
PImage maskImg; 
PImage img; 
PImage kvlt; 
PImage kvlt1; 

void setup() {
  size(580, 385); 
  maskImg = loadImage("black1.jpg");
  img = loadImage("norwayglitch.jpg"); 
  metal = loadImage("stavechruchburning.jpg");
  kvlt = loadImage("transilvanian hunger2.jpg");
  metal.mask(maskImg); 
  image(metal, 0, 0);
  image(metal, 0, 0); 
  tint(200, 150, 200, 100);
  for (int i = 0; i<width; i = i+ (int)(random(-20, 20))) {
    int x = int(random(width-400));
    int y = int(random(metal.height));
    int duz = 1; 
    if (i >= 5) { 
      duz = 5; 
    }
    PImage crop = metal.get(x, y, i, i/2);
    image(crop, i / (duz), y);
  }
  blend(metal, 0, 0, 580, 385, 0, 0, 580, 385, BURN); 
  blend(kvlt, 0, 0, 580, 385, 0, 0, 580, 385, LIGHTEST);
  blend(kvlt, -50, 0, 580, 385, 0, 0, 580, 385, DIFFERENCE);
  blend(kvlt, 100, -100, 580, 385, 0, 0, 580, 385, LIGHTEST); 
  blend(img, 0, 0, 580, 385, 0, 0, 580, 385, DARKEST); 
  blend(metal, 0, 0, 580, 385, 0, 50, 580, 385, EXCLUSION); 
}



