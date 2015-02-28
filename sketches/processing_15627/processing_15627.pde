
// Project 5 "Transform"
// Zach Spitulski, November 16th, 2010
// DESMA 28, UCLA

// GLOBAL VARIABLES
float slider = 0;
float easing = 0.1;
float targetX, stemY, flowerY, flowerDimension, leafDimension, dirtDimension;
PImage stem, land, bg, flower, leaf, dirt;

void setup() {
   size(640,460);
   background(255);
   imageMode(CENTER);
   smooth();
   
   stem = loadImage("stem.png");
   land = loadImage("land.png");
   bg = loadImage("bg.png");
   flower = loadImage("flower.png");
   leaf = loadImage("leaf.png");
   dirt = loadImage("dirt.png");
}

void draw() {
// APPLY EASING TO SLIDER VARIABLE (SMOOTHS MOTION)
  float dx = mouseX - slider;
  if(abs(dx) > 1) {
    slider += dx * easing;
  }
  
  drawBG();
  drawLeaf();
  drawStem();
  drawLand();
  drawDirt();
  drawFlower();
}



void drawBG(){
  image(bg, 320,240);
}

void drawLeaf(){
  if (slider >= 340 && slider <= 640) {
leafDimension = -70+slider*.24;
}
else if (slider <= 400){
 leafDimension = 0;}
  image(leaf, 422,240, leafDimension, leafDimension);
}


void drawStem(){
    if (slider >= 350) {
      stemY = 233; }
  else {
  stemY = 450-slider*.62; }
  image(stem, 430,stemY);
}

void drawLand(){
  image(land, 320,350);
}


void drawDirt(){
  if (slider >= 300) {
 dirtDimension = 120;}
else if (slider >= 55) {
 dirtDimension = slider * .4; 
}
else {
 dirtDimension = 0;}
  image(dirt, 435,285, dirtDimension, dirtDimension);
}


void drawFlower(){
    if (slider >= 300 && slider <= 450) {
    
      flowerY = 220-slider*.18;
      flowerDimension = -170+slider*.60;
  }
    else if (slider >= 450 && slider <= 560) {
          flowerDimension = -170+slider*.60; 
       }     
    else if (slider >= 560) {
          flowerDimension = 166;}
   else {
      flowerDimension = 0; }
  image(flower, 442,flowerY, flowerDimension, flowerDimension);
}


