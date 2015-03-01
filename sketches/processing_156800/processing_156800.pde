
PFont font;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
int count;
int imageNumber;
 
void setup() {
  background(0);
  size(550, 415);
  font = loadFont("AppleBraille-Pinpoint6Dot-48.vlw");
  fill(255);
  textFont(font, 75);
  textAlign(CENTER);
  img1 = loadImage("leah1.jpg");
  img2 = loadImage("leah2.jpg");
  img3 = loadImage("leah3.jpg");
  img4 = loadImage("leah4.jpg");
  img5 = loadImage("leah5.jpg");
  imageMode(CENTER);  
}

void draw() {
  if (count == 0) {
    switch(imageNumber) {
    case 0:
      image(img1, width/2, height/2);
      text("BEDTIME", width/2, 9 * height/10);
      break;
    case 1:
      image(img2, width/2, height/2);
      text("BEDTIME", width/2, 9 * height/10);
      break;
    case 2:
      image(img3, width/2, height/2);
      text("BEDTIME", width/2, 9 * height/10);
      break;
    case 3:
      image(img4, width/2, height/2);
      text("BEDTIME", width/2, 9 * height/10);

      break;
    case 4:
      image(img5, width/2, height/2);
      text("BEDTIME", width/2, 9 * height/10);
      break;
    }
    imageNumber = (imageNumber + 1)%5;
  }
  count = (count + 1)%10;
}




