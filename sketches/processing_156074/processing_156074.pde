
PFont font;
PFont font2;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
 
int count;
int imageNumber;

void setup(){
  background(255);
  size(800, 800);
  
  font=loadFont("ACaslonPro-SemiboldItalic-48.vlw");
  fill(230, 30, 30, 83);
  textFont(font, 50);
  textAlign(CENTER);
  font2=loadFont("AdobeHebrew-Regular-48.vlw");

  
  img1=loadImage("Cage1.jpg");
  img2=loadImage("Cage2.jpg");
  img3=loadImage("dance.jpg");
  
  img4=loadImage("bird.png");
  
  imageMode(CENTER);
}

void draw(){
  
    int property=(mouseX+mouseY)%255;
    image(img4, mouseX, mouseY, property, property);
  
    if (count == 0){
    switch(imageNumber){
      case 0:
        image(img1, 250, 390, 670, 1029);
        text("Feeling...", width/2, 300, 300, 150);
        break;
      case 1:
        image(img2, 550, 390, 670, 1029);
        text("Feeling...", width/2, 300, 300, 150);
        break;
      case 2:
        image(img3, 400, 400, 800, 800);
        text("Trapped???", 400, 500, 600, 250);
        break;
    }
    imageNumber=(imageNumber+1)%5;
  }
  count=(count+1)%1;
}
 


