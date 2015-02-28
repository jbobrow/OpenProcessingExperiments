
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage dumbo;
PImage shark;
PImage nautilus;
PImage beluga;
PImage whale;
PImage crab;
PImage starfish;
PImage seadragon;
PShape f1;
PShape f2;
PShape f3;
PShape f4;
PShape f5;
PShape f6;
void setup(){
  size(640, 480); 
  noLoop();
  smooth();
  /*
  a = loadImage("background1.png");
  b = loadImage("background2.png");
  c = loadImage("background3.png");
  d = loadImage("background4.png");
  e = loadImage("background5.png");
  f = loadImage("background6.png");
  */
  
  int r = floor(random(1, 7));
  a = loadImage("background" + r + ".png");
  
  
  dumbo = loadImage("dumbo.png");
  shark = loadImage("shark.png");
  nautilus = loadImage("nautilus.png");
  beluga = loadImage("beluga.png");
  whale = loadImage("whale.png");
  crab = loadImage("crab.png");
  starfish = loadImage("starfish.png");
  seadragon = loadImage("seadragon.png");
  
  f1 = loadShape("1.svg");
  f2 = loadShape("2.svg");
  f3 = loadShape("3.svg");
  f4 = loadShape("4.svg");
  f5 = loadShape("5.svg");
  f6 = loadShape("6.svg");

}


void draw() {
int b = floor(random(1, 7));
a = loadImage("background" + b + ".png");
float r = random(0, 100);
image(a, 0, 0);

if(r>50){
pushMatrix();
float x = random(0, width- f6.width);
float y = random(0, height-f1.height);
scale(random(0, 2));
translate(x + f6.width/2, y + f6.height/2);
float angle = random(-50, 80);
rotate(radians(angle));
shape(f6, -f6.width/2, -f6.height/2);
popMatrix();
}else{
pushMatrix();
float x = random(0, width- f2.width);
float y = random(0, height-f2.height);
scale(random(0, 3));
translate(x + f2.width/2, y + f2.height/2);
float angle = random(-360, 360);
rotate(radians(angle));
shape(f2, -f2.width/2, -f2.height/2);
popMatrix();
}

if(r<40){
pushMatrix();
float t = (random(0, 255));
tint(255, t);
float x = random(0, width- whale.width);
float y = random(0, height-whale.height);
translate(x + whale.width/2, y + whale.height/2);
float angle = random(-70, 70);
rotate(radians(angle));
image(whale, -whale.width/2, -whale.height/2);
noTint();
popMatrix();
}else{
pushMatrix();
float t = (random(0, 255));
tint(255, t);
float x = random(0, width- crab.width);
float y = random(0, height-crab.height);
translate(x + crab.width/2, y + crab.height/2);
float angle = random(-400, 400);
rotate(radians(angle));
image(crab, -crab.width/2, -crab.height/2);
noTint();
popMatrix();
}
if(r>30){
pushMatrix();
float x = random(0, width- dumbo.width);
float y = random(0, height-dumbo.height);
translate(x + dumbo.width/2, y + dumbo.height/2);
float angle = random(-50, 50);
rotate(radians(angle));
image(dumbo, -dumbo.width/2, -dumbo.height/2);
noTint();
popMatrix();
}
  if(r>30){
pushMatrix();
float x = random(0, width- f3.width);
float y = random(0, height-f3.height);
scale(random(0, 4));
translate(x + f3.width/2, y + f3.height/2);
float angle = random(-360, 100);
rotate(radians(angle));
shape(f3, -f3.width/2, -f3.height/2);
popMatrix();

}
if(r>10){
pushMatrix();
float t = (random(0, 255));
tint(255, t);
float x = random(0, width- seadragon.width+ 40);
float y = random(0, height-seadragon.height);
translate(x + seadragon.width/2, y + seadragon.height/2);
float angle = random(-70, 70);
rotate(radians(angle));
image(seadragon, -seadragon.width/2, -seadragon.height/2);
noTint();
popMatrix();
}
if(r>70){
pushMatrix();

scale(.5, .5);
float x = random(0, width- nautilus.width- 40);
float y = random(0, height-nautilus.height);
translate(x + nautilus.width/2, y + nautilus.height/2);
float angle = random(-600, 600);
rotate(radians(angle));
image(nautilus, -nautilus.width/2, -nautilus.height/2);

popMatrix();
}

  if(r>40){
pushMatrix();
float x = random(0, width- f4.width);
float y = random(0, height-f4.height);
scale(random(0, 4));
translate(x + f4.width/2, y + f4.height/2);
float angle = random(-360, 360);
rotate(radians(angle));
shape(f4, -f4.width/2, -f4.height/2);
popMatrix();
  }
if(r>70){
pushMatrix();
float x = random(0, width- starfish.width);
float y = random(0, height-starfish.height);
translate(x + nautilus.width/2, y + starfish.height/2);
float angle = random(-90, 200);
image(starfish, -starfish.width/2, -starfish.height/2);
popMatrix();
}
  if(r>60){
pushMatrix();
float x = random(0, width- f5.width);
float y = random(0, height-f5.height);
scale(random(0, 4));
translate(x + f5.width/2, y + f5.height/2);
float angle = random(-360, 360);
rotate(radians(angle));
shape(f5, -f5.width/2, -f5.height/2);
popMatrix();
  }
if(r>50){
pushMatrix();
float t = random(0, 255);
tint(255, t);
float x = random(0, width- shark.width);
float y = random(0, height-shark.height);
translate(x + shark.width/2, y + shark.height/2);
float angle = random(-30, 30);
rotate(radians(angle));
image(shark, -shark.width/2, -shark.height/2);
noTint();
popMatrix();
}
if(r>60){
pushMatrix();
float x = random(0, width- beluga.width);
float y = random(0, height-beluga.height);
translate(x + beluga.width/2, y + beluga.height/2);
float angle = random(-50, 80);
rotate(radians(angle));
image(beluga, -beluga.width/2, -beluga.height/2);
popMatrix();
}
if(r>45){
pushMatrix();
float x = random(0, width- f1.width);
float y = random(0, height-f1.height);
scale(random(0, 2));
translate(x + f1.width/2, y + f1.height/2);
float angle = random(-50, 80);
rotate(radians(angle));
shape(f1, -f1.width/2, -f1.height/2);
popMatrix();
}
}
void mousePressed() {
  redraw();
}


