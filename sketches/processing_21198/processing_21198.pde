
PImage wall;
PFont font;

float r = random(255);
float g = random(255);
float b = random(255);
float a = random(255);

String[] memo = new String[9];



//p_colour(r,g,b,a);

void setup() {
  size(350, 350);
  smooth();
  noLoop();

  font = loadFont("Stencil-48.vlw");
  textFont(font, 13);

  wall = loadImage("bulletinboard.jpg");
  image(wall, 0, 0);
  
  memo[0] = "Sleepy";
memo[1] = "Hungry";
memo[2] = "Tired";
memo[3] = "Brrrr!";
memo[4] = "Achoo!";
memo[5] = "Meh";
memo[6] = "Ohm Nom";
memo[7] = "BAHAHA";
memo[8] = "Zzz...";
}

void draw() {
  PostIt(40, 50, random(40, 100), random(40,150), random(220, 255), random(43, 75), random (1, 23), memo[(int)random(0,8)]); // x, y, postit width, postit height, postit colour, postit pin colour, pin width, pin height
  PostIt(140, 50, random(40, 100), random(40,150), random(220, 255), random(43, 75), random (1, 23), memo[(int)random(0,8)]);
  PostIt(240, 50,random(40, 100), random(40,150), random(220, 255), random(43, 75), random (1, 23), memo[(int)random(0,8)]);
  PostIt(40, 150, random(40, 100), random(40,150), random(220, 255), random(43, 75), random (1, 23), memo[(int)random(1,8)]);
  PostIt(140, 150, random(40, 100), random(40,150), random(220, 255), random(43, 75), random (1, 23), memo[(int)random(1,8)]);
  PostIt(240, 150, random(40, 100), random(40,150), random(220, 255), random(43, 75), random (1, 23), memo[(int)random(1,8)]);
  PostIt(40, 250, random(40, 100), random(40,150), random(220, 255), random(43, 75), random (1, 23), memo[(int)random(1,8)]);
  PostIt(140, 250, random(40, 100), random(40,150), random(220, 255), random(43, 75), random (1, 23), memo[(int)random(1,8)]);
  PostIt(240, 250, random(40, 100), random(40,150), random(220, 255), random(43, 75), random (1, 23), memo[(int)random(1,8)]);
} 

void PostIt(int x, int y, float postitw, float postith, float colour, float pw, float ph, String memo) {

  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(150,255);

  pushMatrix();

  stroke(0);
  fill(colour);
  rect(x+13, y-15, postitw, postith);

  fill(0);
  text(memo, x+20, y+30); 

  fill(r,g,b,a);
  ellipse(x+15, y, pw, ph);
  ellipse(x+7, y, pw-35, ph+20);
  ellipse(x, y, pw-30, ph+30);

  popMatrix();
}


