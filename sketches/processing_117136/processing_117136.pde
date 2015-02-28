
PFont font1, font2;
PImage img0, img1, img2, img3, img4, img5, img6, img7;
String p0 = "blue is the warmest color.";
String p1 = ", ice cream is melting between teath";
String p2 = ", hair is rolling on fingertips";
String p3 = ", eye is staring you as an alien";
String p4 = ", bolloon is going up to the dark sky";
String p5 = ", screen is shining in a empty room";
String p6 = ", rose is whispering a beautiful lie.";

 

int poem = 0;
//int poem = 1;
//int poem = 2;
//int poem = 3;
//int poem = 4;
//int poem = 5;
//int poem = 6;
//int poem = 7;


//int textX = 580;
//int textY = 430;
 
 
void setup() {
  img0 = loadImage("0.png");
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
  img6 = loadImage("6.png");
  img7 = loadImage("7.png");


 
 
  size(400, 600);
  font1 = loadFont("Futura-Medium-20.vlw");
  font2 = loadFont("AmericanTypewriter-Light-48.vlw");
}
 
void draw() {
  textAlign(CENTER);
  if (poem == 0) {
    image(img0, 0, 0);
    //background(255, 0, 100);
    textFont(font2, 20);
    text(p0, width/2+20, height/2+250);
    /*  
     code here to draw something for the first poem,    
     or create poem funtions such as
     cardOne();
      
     */
  } 
  else if (poem == 1) { 
    image(img1, 0, 0);
    fill(255,255,255);
    textFont(font1, 20);
    text(p1, width/2, height/2-100);
  } 
  else if (poem == 2) { 
    image(img2, 0, 0);
    textFont(font1, 20);
    text(p2, width/2, height/2-100);
  }
  else if (poem  == 3) { 
    image(img3, 0, 0);
    fill(255,255,255);
    textFont(font1, 20);
    text(p3, width/2, height/2-100);
  }
  else if (poem  == 4) {
    image(img4, 0, 0);
    textFont(font1, 20);
    text(p4, width/2, height/2+100);
  }
  else if (poem  == 5) { 
    image(img5, 0, 0);
    fill(255,255,255);
    textFont(font1, 20);
    text(p5, width/2, height/2);
  }
  else if (poem  == 6) { 
    image(img6, 0, 0);
    textFont(font1, 20);
    text(p6, width/2, height/2);
  }

}
 
 
void mousePressed() { 
 
  if (poem == 0) { 
    poem = int(random(1, 2));
  }
  else if (poem == 1) { 
    poem = int(random(3, 4));
  }
  else if (poem == 2) {
    poem = int(random(5, 6));
  }
  else if (poem == 3) {
    poem = int(random(2, 4));
  } 
  else if (poem == 4) {
    poem = 5;
  } 
  else if (poem == 5) {
    poem = 6;
  }
  else if (poem == 6) {
    poem = 0;
  }
 
  println(poem);
}



