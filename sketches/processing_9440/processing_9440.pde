
PFont m;

PImage bg;
PImage g1;
PImage g2;
PImage g3;
PImage g4;
PImage g5;

PImage banana;
PImage banana2;
PImage banana3;
PImage brillo;
PImage brillo3;
PImage can;
PImage can3;
PImage canside;
PImage spilled;
PImage coke;
PImage dollar;
PImage elvis;
PImage ice;
PImage marilyn;
PImage torn;

////////////////////////////////////////////////////////////////
void setup() {
  size(640, 480);
  smooth();
  
  m = loadFont("Mistral-48.vlw");
  textFont(m);
  
  bg = loadImage("bg2.png");
  
  g1 = loadImage("AndyGrocery1.png");
  g2 = loadImage("AndyGrocery2.png");
  g3 = loadImage("AndyGrocery3.png");
  g4 = loadImage("AndyGrocery4.png");
  g5 = loadImage("AndyGrocery5.png");
  
  banana = loadImage("banana.png"); 
  banana2 = loadImage("banana2.png");
  banana3 = loadImage("banana3.png");
  brillo = loadImage("Brillo.png");
  brillo3 = loadImage("Brillo3.png");
  can = loadImage("can.png");
  can3 = loadImage("can3.png");
  canside = loadImage("canside.png");
  coke = loadImage("coke.png");
  dollar = loadImage("dollar.png");
  elvis = loadImage("elvis.png");
  ice = loadImage("ice.png");
  marilyn = loadImage("marilyn.png");
  torn = loadImage("torn.png");
  spilled = loadImage("spilled-can1.png");
  
  noLoop();
  
}

////////////////////////////////////////////////////////////////

void draw(){
    background(255);
    
//text Andy Warhol --------------------------------------------
  pushMatrix();
  float x = random(0, 50);
  float y = random(0, 100);
  translate(x , y);
    rotate(radians(10));
    
    scale(1.2);
  
  float ra = random(0, 6);
  if (ra < 1){
    fill(130, 88, 160);
    text("Andy Warhol", 0, 0);
  }else if(ra < 2){  
    fill(251, 212, 21);
    text("Andy Warhol", 0, 0);
  }else if(ra < 3){
    fill(194, 44, 56);
    text("Andy Warhol", 0, 0);
  }else if(ra < 4){
    fill(77, 183, 169);
    text("Andy Warhol", 0, 0);
  }else if (ra < 5){
    fill(62, 62, 62);
    text("Andy Warhol", 0, 0);
  }else{
    fill(249, 186, 195);
    text("Andy Warhol", 0, 0);
  }  
  popMatrix(); 
  
  
//other Texts--------------------------------------------------
  pushMatrix();
  float a = random(-500, 150);
  translate(a, 200);
  scale(2);
    fill(251, 212, 21);
    text("Cambell's Soup Cans", 10, 10);
  popMatrix();
  
  pushMatrix();
  float b = random(150, 230);
  translate(b, 120);
  rotate(radians(-15));
  scale(1.6);
    fill(249, 186, 195);
    text("Marilyn Monroe", 0, 0);
  popMatrix();
  
  pushMatrix();
  float c = random(430, 540);
  translate(c, 323);
  rotate(radians(20));
    fill(77, 183, 169);
    text("Elvis Presley", 0, 0);
  popMatrix();
  
  pushMatrix();
  float d = random(420, 540);
  translate(d, 150);
  rotate(radians(-5));
    fill(130, 88, 160);
    text("Andy Warhol", 0, 0);
  popMatrix();
  
  pushMatrix();
  float e = random(50, 160);
  translate(e, 250);
  scale(1.2);
    fill(130, 88, 160);
    text("Brillo Box", 0, 0);
  popMatrix();
  
  pushMatrix();
  float f = random(100, 144);
  translate(f , 275);
     fill(194, 44, 56);
    text("Banana", 0, 0);
  popMatrix();
  
  pushMatrix();
  float g = random(160, 270);
  translate(g, 70);
  rotate(radians(-15));
  scale(.7);
     fill(77, 183, 169);
    text("One Dollar Bills", 0, 0);
  popMatrix();
  
  pushMatrix();
  float h = random(400, 540);
  translate(h, 240);
  rotate(radians(10));
  scale(1.5);
    fill(62, 62, 62);
    text("Ice Cream", 0, 0);
  popMatrix();
  
  pushMatrix();
  float i = random(0, 50);
  translate(i, 108);
  rotate(radians(10));
    fill(62, 62, 62);
    text("Coca Cola", 0, 0);
  popMatrix();
  
  pushMatrix();
  float j = random(250, 540);
  translate(j, 200);
  rotate(radians(-5));
  scale(1.2);
    fill(194, 44, 56);
    text("Big Torn Cambell's Soup Can", 0, 0);
  popMatrix();


//shelves--------------------------------------------------------
  image(bg, 0, 0);
  
  
//random images on shelf-----------------------------------------
  float ran = random(0, 100);
  if (ran < 20){
    image(dollar, 413, 93);
    image(coke, 507, 124);
    image(marilyn, 479, 137);
    image(ice, 509, 257);
    image(brillo, 538, 350); 
    image(banana2, 407, 377); 
  }else if(ran < 40){
    image(torn, 473, 352);
    image(brillo3, 432, 311);
    image(marilyn, 570, 352);
    image(dollar, 413, 93);
    image(coke, 507, 124);
    image(banana, 486, 258);
    image(canside, 430, 258);
  }else if(ran < 60){
     pushMatrix();
       translate(470, 105);
       rotate(radians(45));
       image(dollar, 0,0);
     popMatrix();
    image(marilyn, 479, 137);
    image(elvis, 453, 230);
     pushMatrix();
        translate(486, 255);
        rotate(radians(20));
        image(banana, 0, 0);
      popMatrix();
    image(can, 500, 325);
    image(brillo3, 432, 311);
    image(banana3, 539, 375);
    image(can3, 516, 364);
  }else if(ran < 80){
     pushMatrix();
       translate(440, 93);
       rotate(radians(45));
       image(dollar, 0, 0);
     popMatrix();
    image(dollar, 460, 120);
    image(can, 420, 350);
    image(can, 500, 325);
    image(torn, 473, 352);
    image(can3, 516, 364);
    image(canside, 430, 258);
    image(can3, 525, 225);
  }else{
    image(spilled, 370, 418);
  } 
 
//Warhol with Grocery Bag----------------------------------------
  float r = random(0, 100);
  if (r < 20) {
    image(g1, 245, 80);
  }else if (r < 40){
    image(g2, 35, 115);
  }else if (r < 60){
    image(g3, 175, 144);
  }else if (r < 80){
    image(g4, 107, 98);
  }else{
  image(g5, 0, 100);
  }
}

////////////////////////////////////////////////////////////////

void mousePressed(){
 redraw(); 
}

