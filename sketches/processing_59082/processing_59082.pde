
//AlexAdams Assignment 1
//Original jpg images accessed from Google Images, then edited in photoshop.
//Keypressed commands were added, and I chose a, b, c, d because I wanted it
//to be a flowing code i.e. 1, 2, 3, 4 or a, b, c, d. 
//press 'a' for enlarged image of Mona Lisa
//press 'b' for enlarged image of Van Gogh
//press 'c' for enlarged image of Picasso
//press 'd' for enlarged image of Margaret Olley

PShape botShape;
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;

void setup() {
  size(900, 700);
  //frameRate(100);
   botShape = loadShape("person.svg");
  //for (int i = 0; i < 4; i++){
    img = loadImage("monaframe.jpg");
    img1 = loadImage("vangoghframe.jpg");
    img2 = loadImage("picassoframe.jpg");
    img3 = loadImage("olleyframe.jpg");
    img4 = loadImage("Lisaframe.jpg");
    img5 = loadImage("GoghFrame.jpg");
    img6 = loadImage("PicassoWomanFrame.jpg");
    img7 = loadImage("margarettest.jpg");
}
  //}

void draw() {
  //This code was originally sourced from Sarah Profilio, 
  //and then edited to suit my intention and coding. 
 float a = mouseX;

if ((mouseX > -10) && (mouseX < 185)) {

image(img, 0, 0, 900, 700);
     } else if ((mouseX > 185) && (mouseX < 470)) {
      image (img1, 0, 0, 900, 700); 
    } else if ((mouseX > 470) && (mouseX < 670)) {
    image (img2, 0, 0, 900, 700);
    } else if ((mouseX > 670) && (mouseX < 900)) { 
  image (img3, 0, 0, 900, 700); 
    
}
    if (keyPressed) {
    if ((key == 'a')) {
      image(img4, 200, 3); 
    }
    if ((key == 'b')) {
     image(img5, 200, 3);
    }
    if ((key == 'c')) {
     image(img6, 200, 3);
    }
    if ((key == 'd')) {
     image(img7, 200, 3);
    }
  }
  
  //original image of person.svg was sourced from Google and was 
  //edited in traced and edited in Illustrator. 
  shape(botShape, mouseX - 40, 350);
  fill(156, 94, 71);
  noStroke();
  rect(873, 21, 41, 650);
  fill(156, 94, 71);
  noStroke();
  rect(0, 15, 19, 664);
 
}

