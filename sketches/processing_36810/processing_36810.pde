
void setup() {
  size(300, 300);
  background(255);
  noStroke();
  fill(0);
}

float count = 0;
float num = 50;

void draw() {

    size(300, 300);
  colorMode(RGB,100);
  noStroke();
  smooth();
  background(100);
  //adjustment of color change with RGB
  
  if (count < num) {
    if (random(400) > 50) { // fill and prob. change with number variations
      fill(255, 0, 0,100);
    }
    else {
      fill(6);
    }
    if (count % 4 == 1) {
      // even numbers with random
      rect(count * width/num, height, width/num, random(-height));
    } 
    //change of rectangles
    else {
      // still even on two's
      rect(count * width/3, height/3 + random(-100, 100), width/num, 45);
    }
  }
  count++;
}



