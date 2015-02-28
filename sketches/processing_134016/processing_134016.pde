
void setup() {
  background(255);
  size(600, 600);
 colorMode(HSB,100);
  noFill();
}

float r=0;
float disfusion=1;

void draw() {

  float w=600;
  float h=600;

  //how thick the line is   
  strokeWeight(random(0.1, 0.2));
 
  //hues of red
  stroke(random(0,10), 100, 100, 30);
 
  // one half of the heart
  // anchor, control point 1, control point 2, anchor
  // docs here http://www.processing.org/reference/bezier_.html
  bezier(
  w/2, (h/4)+random(10),
  w/3+random(disfusion), h/8+random(disfusion),
  15+random(disfusion), 80+random(disfusion),
  w/2, (h/3)*1.8);
  
  // other half of the heart
  bezier(
  w/2, (h/4)+random(10),
  ((w/3)*2)-random(disfusion), (h/8)+random(disfusion),
  (w-15)-random(disfusion), 80+random(disfusion),
  w/2, (h/3)*1.8);
  
  
  //diuffusion is the varioabe that gets larger and makes the curves more
  //chaotic whent this is greater than width we woudl be drawweing things off
  //the canvis so we stop!
  if (disfusion<width) {
    //if it is smaller than the width we step it on by 1 
    disfusion+=1;
  }else{
    noLoop();
  }
}

