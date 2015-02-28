
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/61317*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//project 1 rwandrew
//copyright russell andrews 2012

//slider code is adapted from Jim Roberts

int sliderX, sliderY, sliderWidth, sliderHeight;
int threshHold;

PImage fish;

void setup(){
  size(400, 400);
  smooth();
  fish = loadImage("fish.jpg");
  
  sliderX = 40;
  sliderY = height-40;
  sliderWidth = width-2*sliderX;
  sliderHeight = 10;
  
  threshHold = 100;
}

void draw(){
  background(0);
  
  circles();
  slider();
}

void circles(){
  for(int i = 0; i < width; i += threshHold){
    for(int j = 0; j < height; j += threshHold){
      int k = fish.width*j + i;
      
      color target = fish.pixels[k];
      noStroke();
      rectMode(CENTER);
      fill(target);
      rect(i, j, threshHold, threshHold);
    }
  }
}

void slider(){
  fill(200);
  rectMode(CORNER);
  rect(sliderX, sliderY, sliderWidth, sliderHeight);
  
//  ellipseMode(CORNER);
//  ellipse(sliderX-5, sliderY, sliderHeight, sliderHeight);
//  ellipse(width-45, sliderY, sliderHeight, sliderHeight);
  
  int barX = int(map(threshHold, 0, 100, sliderX, sliderX + sliderWidth));
  
  rectMode(CENTER);
  fill(30, 165, 150);
  rect(barX, sliderY + sliderHeight/2, 10, 10);
}

void mouseDragged(){
  threshHold = int(constrain(map(mouseX, sliderX, sliderX + sliderWidth, 1, 100), 1, 100));
}

