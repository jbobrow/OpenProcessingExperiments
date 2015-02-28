
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65528*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

//Ricky Cheng
//Workshop 6: Motion - the idea is to make a solar system using fruits, with the orange as
//the sun in the center with other fruits rotating around it.

PImage kiwi;
PImage lime;
PImage melon;
PImage orange;
PImage strawberry;
PImage tomato;
PImage basket;
float angle = 0.0;
float strawRotation = 0;
float strawOrbit = 0;
float melonRotation = 0;
float melonOrbit = 0;
float tomatoRotation = 0;
float tomatoOrbit = 0;

float offset = 60;
float scalar = 150;
float speed = 0.01;


 
  
void setup() {
  size(600, 600);
  smooth();
   
  kiwi = loadImage("kiwi.png");
  lime = loadImage("lime.png");
  melon = loadImage("melon.png");
  orange = loadImage("orange.png");
  strawberry = loadImage("strawberry.png");
  tomato = loadImage("tomato.png");
  basket = loadImage("basket.jpg");
   
  imageMode(CENTER);
}
  
void draw() {
  /* float x = random(width);
  float y = random(height);
  float x2 = random(width);
  float y2 = random(height);
  float x3 = random(width);
  float y3 = random(height);
  float z = random(100, 500);
  float r = random(0, 300);
   
  float a = random(100, 300); //kiwi
  float b = random(50, 200); //lime
  float c = random(200, 400); //melon
  float d = random(200, 400); //orange
  float e = random(100, 200); //strawberry */
   
  image(basket, width/2, height/2, width, height);
  //image(melon, x2, y2, c, c);
  //image(orange, 300, 200, d, d);
  //image(kiwi, x3, y3, a, a);
  //image(lime, y+100, r, b, b);
  
  
 
  //orange
  pushMatrix();
    translate(width/2, height/2);
    rotate(angle);
    image(orange, 0, 0, 140, 140);
    angle += speed;
  popMatrix();
  
  //strawberry
  float x = (width/2) + cos(strawOrbit) * scalar;
  float y = (height/2) + sin(strawOrbit) * scalar;
   pushMatrix();
    translate(x, y);
    rotate(strawRotation);
    image(strawberry, 0, 0, 100, 80);
  popMatrix();
  strawRotation += 0.55;
  strawOrbit += 0.1; //orbiting speed
  
  //lime
  pushMatrix();
    translate(width/2, height/2);
    rotate(angle*1.3);
    image(lime, 70, 70, 50, 50);
    angle += speed*1.3;
  popMatrix();
  
  //kiwi
  pushMatrix();
    translate(width/2, height/2);
    rotate(angle);
    image(kiwi, 160, 160, 100, 100);
    angle += speed*1.3;
  popMatrix();
  
  //tomato
  pushMatrix();
    translate(width/2, height/2);
    rotate(angle+140);
    image(tomato, 160, 160, 100, 100);
    angle += speed*1.3;
  popMatrix();
  
  //melon
  float x2 = (width/2) + cos(melonOrbit) * scalar*2.2;
  float y2 = (height/2) + sin(melonOrbit) * scalar*2.2;
  pushMatrix();
    translate(x2, y2);
    rotate(melonRotation);
    image(melon, 0, 0, 150, 150);
    angle += speed;
  popMatrix();
  melonRotation += 1.5;
  melonOrbit += 0.03;
  
}


