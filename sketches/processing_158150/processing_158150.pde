
PImage brain;
PImage bg;
PImage cw;
float alpha;
//PImage light;

void setup(){
  size(720,450);
  brain = loadImage("brain.png");
  bg = loadImage("bg.png");
  cw = loadImage("cw.png");
  colorMode(HSB, 360, 100, 100);
  alpha = 0;
}

void draw(){
  
  noStroke();
  float color1 = map(mouseX, 0, width, 0, 360);
  float color2 = map(mouseY, 0, height, 0, 100);
  float H = map(mouseY, 0, height, 0, 360);
  float B = map(mouseX, 0, width, 0, 100);
  
//  background(color1, color2, 100);
  ellipse(720, 450, 700, 700);
  tint(color1, color2, 100);
  image(bg, 0, 0);
  //tint(B, H, 100);
  //image(light, 262, 450);
  tint(H, B, 100);
  image(brain, 165, 61);
  if(pmouseX != mouseX){
  alpha = 0;
  }else{
  alpha = alpha + 2;
  }
  tint(360, 0, 100, alpha);
  image(cw, 110,187);
  println(alpha);
}


