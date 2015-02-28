
int x = 0;
PFont font;
PImage boring;
PImage aunt;
PImage totem;
PImage flower;
PImage slide;
PImage monkey;
PImage playground;
PImage les;
PImage farmer;
PImage happy;
void setup(){
  size(600,600);
  font = loadFont("Serif.plain-48.vlw");
  textFont(font, 32);
  boring = loadImage("boring.jpg");
  aunt = loadImage("kristy.jpg");
  totem = loadImage("totem2.png");
  flower = loadImage("flower.jpg");
  slide = loadImage("slide.jpg");
  monkey = loadImage("monkey.jpg");
  playground = loadImage("playground.jpg");
  les = loadImage("les.jpg"); 
  farmer = loadImage("farmer.png");
  happy = loadImage("happy.jpg");
}
void draw(){
  background(255, 255, 255);
  textFont(font, 32);
  fill(162);
  float sec = millis() / 1000.0;
  if (sec > 1.0){
    x++;
    text("You are", 100, 100);
  }
   textFont(font, 50);
   fill(87);
  float a = millis() / 1000.0;
  if (a > 2.0){
    x++;
    text("boring...", 250, 100);
  }
  textFont(font, 70);
  fill(50);
  float b = millis() / 1000.0;
  if (a > 3.0){
    x++;
    text("boring...", 200, 200);
  }
  textFont(font, 100);
  fill(0);
   float c = millis() / 1000.0;
  if (a > 4.0){
    x++;
    text("boring...", 150, 280);
}
float d = millis() / 1000.0;
  if (a > 5.0){
    x++;
    fill(255, 255, 255);
    rect(0, 0, 2000, 2000);
  }
float e = millis() / 1000.0;
  if (a > 5.0){
    x++;
    image(boring, 0, 0);
}
float f = millis() / 1000.0;
  if (a > 7.0){
    x++;
    fill(0, 0, 255);
    rect(0, 0, 2000, 2000);
  }
  textFont(font, 32);
float g = millis() / 1000.0;
  if (a > 7.0){
    x++;
    fill(0, 255, 0);
    text("Really?", 100, 300);
}
float h = millis() / 1000.0;
  if (a > 8.0){
    x++;
    fill(0, 255, 0);
    text("Do I look Boring?", 200, 300);
  }
  float i = millis() / 1000.0;
  if (a > 10.0){
    x++;
    fill(255, 255, 255);
    rect(0, 0, 2000, 2000);
  }
  float j = millis() / 1000.0;
  if (a > 10.0){
    x++;
    image(aunt, 0, 0);
  }
  float k = millis() / 1000.0;
  if (a > 11.5){
    x++;
    fill(255, 255, 255);
    rect(0, 0, 2000, 2000);
}
float l = millis() / 1000.0;
  if (a > 11.5){
    x++;
   image(totem, 0, 0);
}
float m = millis() / 1000.0;
  if (a > 13.0){
    x++;
    fill(255, 255, 255);
    rect(0, 0, 2000, 2000);
}
float n = millis() / 1000.0;
  if (a > 13.0){
    x++;
   image(flower, -200, 0);
}
float o = millis() / 1000.0;
  if (a > 14.5){
    x++;
    fill(255, 255, 255);
    rect(0, 0, 2000, 2000);
}
float p = millis() / 1000.0;
  if (a > 14.5){
    x++;
   image(slide, 0, 25);
}
float q = millis() / 1000.0;
  if (a > 16.0){
    x++;
    fill(255, 255, 255);
    rect(0, 0, 2000, 2000);
}
float r = millis() / 1000.0;
  if (a > 16.0){
    x++;
   image(monkey, -100, 0);
}
float s = millis() / 1000.0;
  if (a > 17.5){
    x++;
    fill(255, 255, 255);
    rect(0, 0, 2000, 2000);
}
float t = millis() / 1000.0;
  if (a > 17.5){
    x++;
   image(playground, -25, 0);
}
float u = millis() / 1000.0;
  if (a > 19.0){
    x++;
    fill(255, 255, 255);
    rect(0, 0, 2000, 2000);
}
float v = millis() / 1000.0;
  if (a > 19.0){
    x++;
   image(les, 0, 0);
}
float w = millis() / 1000.0;
  if (a > 20.5){
    x++;
    fill(255, 255, 255);
    rect(0, 0, 2000, 2000);
}
float x = millis() / 1000.0;
  if (a > 20.5){
    x++;
   image(farmer, 0, 0);
}
float y = millis() / 1000.0;
  if (a > 22.0){
    x++;
    fill(255, 255, 255);
    rect(0, 0, 2000, 2000);
}
float z = millis() / 1000.0;
  if (a > 22.0){
    x++;
   image(happy, 0, 0);
}
float aa = millis() / 1000.0;
  if (a > 23.5){
    x++;
    fill(0, 0, 255);
    rect(0, 0, 2000, 2000);
  }
 float bb = millis() / 1000.0;
  if (a > 24.0){
    x++;
    fill(0, 255, 0);
    text("What do you think now?", 200, 300); 
}
}

