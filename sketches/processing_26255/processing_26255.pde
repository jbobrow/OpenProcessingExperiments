
int x;
PFont inkpen;
PFont skia;
PImage milkshake;

void setup(){
  size(600,600);
    background(232,212,201);
  x=0;
  inkpen = loadFont("Inkpen2Script-48.vlw");
  skia = loadFont("Skia-Regular_Light-24.vlw");
  milkshake = loadImage("milkshake.jpg");
}

void draw(){

  tint(227,199,201,20);
  image(milkshake,150,50);
  fill(103,10,10);
  textFont(inkpen);
  text("shake", mouseX, mouseY);
  fill(103,10,10);
  textFont(skia);
  text("shake shake shake", random(600),random(600));
    fill(103,10,10);
  textFont(skia);
  text("shake shake shake", random(600),random(600));
    fill(103,10,10);
  textFont(skia);
  text("shake shake shake", random(600),random(600));
    fill(103,10,10);
  textFont(skia);
  text("shake shake shake", random(600),random(600));
  fill(103,10,10);
  textFont(skia);
  text("shake shake shake", random(600),random(600));
    fill(103,10,10);
  textFont(skia);
  text("shake shake shake", random(600),random(600));
  
    fill(103,10,10);
  textFont(skia);
  text("shake shake shake", random(600),random(600));
  
    fill(103,10,10);
  textFont(skia);
  text("shake shake shake", random(600),random(600));
  
    fill(103,10,10);
  textFont(skia);
  text("shake shake shake", random(600),random(600));
  
    fill(103,10,10);
  textFont(skia);
  text("shake shake shake", random(600),random(600));
  
  
}
  

 

