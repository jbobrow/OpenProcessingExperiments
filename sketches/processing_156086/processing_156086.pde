
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
  size(800 , 800);
  font = loadFont("DINCondensed-Bold-200.vlw");
  fill(#000000);
  textFont(font, 200);
  textAlign(CENTER);
  img1 = loadImage("image1.jpg");
  img2 = loadImage("image2.jpg");
  img3 = loadImage("image3.jpg");
  img4 =loadImage("image4.jpg");
   img5 =loadImage("image5.jpg");
  imageMode(CENTER);
}

void draw() {
  if (count == 0) {
    switch(imageNumber) {
    case 0:
      image(img1, width/2, height/2);
    
      text("HEY YOU!", width/2,  height/2);
        break;
    case 1:
      image(img2, width/2, height/2);
      text("PIZZA", width/2,  height/2);
      break;
    case 2:
      image(img3, width/2, height/2);
      text("PARTY!", width/2, height/2);
      break;
    case 3:
      image(img4,width/2,height/2);
      text("IT'S",width/2,1*height/4);
      break;
    case 4:
      text("GOING",width/2,2*height/4);
      break;
    case 5:
      text("TO",width/2,3*height/4);
      break;
    case 7:
      text("BE",width/2,4*height/4);
        break;
    case 8:
      image(img5,width/2,height/2);
      text("CHEESY",width/2,height/2);
        break;
      
      

    }
    imageNumber = (imageNumber+1)%9;
  }
  count = (count + 1)%30;
}



