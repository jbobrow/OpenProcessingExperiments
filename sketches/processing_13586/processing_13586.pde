

PImage bg, che, weed, heart, star, flower;
PFont font;

int main, secondary, words;

void setup()  {
  size (640,480);  
  smooth();
  fill(0,175);
  
  //Load font
  font = loadFont("LucidaBlackletter-48.vlw");
  textFont(font,72);
  
  //Load Images
  bg = loadImage("skin.jpg");
  che = loadImage("che.png");
  weed = loadImage("weed.png");
  heart = loadImage("heart.png");
  star = loadImage("star.png");
  flower = loadImage("flower.png");
  
  //Pick random images and text
  main = int(random(3));
  secondary = int(random(3));
  words = int(random(4));
}

void draw()  {
  background(bg);
  
  //main image
  switch (main)  {
    case 0:
      tint(255,175);
      image(che, 160, 40);
      break;
    case 1:
      tint(255,175);
      image(weed, 165, 50);
      break;
    case 2:
      tint(255,175);
      image(heart, 170, 80);
      break;
  }
  
  //secondary images
  switch (secondary)  {
    case 0:
      tint(255,175);
      
      pushMatrix();
      rotate(PI/4);
      image(star, 200, 40);
      popMatrix();
     
      pushMatrix();
      translate(-10,35);
      rotate(-PI/4);
      image(star, 135, 475);
      popMatrix();
      
      break;

    case 1:
      tint(255,175);
      
      pushMatrix();
      translate(420,0);
      rotate(PI/4);
      image(weed, 200, 40, 150, 150);
      popMatrix();
      
      pushMatrix();
      translate(-435,30);
      rotate(-PI/4);
      image(weed, 135, 475, 150, 150);
      popMatrix();
      
      break;

    case 2:
      tint(255,175);
      
      pushMatrix();
      translate(0,-25);
      rotate(PI/4);
      image(flower, 200, 40);
      popMatrix();
      
      pushMatrix();
      translate(-10,10);
      rotate(-PI/4);
      image(flower, 135, 475);
      popMatrix();
      
      break;
  }
  
  //text
  //rotate(PI/8);
  switch (words)  {
    case 0:
      text("REGRET", 160, 440);
      break;
    case 1:
      text("BADASS", 175, 440);
      break;
    case 2:
      text("SHAME", 180, 440);
      break;
    case 3:
      text("FUCK YA", 155, 440);
  }
  
}

