
void setup() {
  size(600, 600);
  noStroke();
}


float count =100;
float sqr;
float rndColor;
float num=100;
float rndSquare;


void draw() {

  if (count > 0) {
    rndColor = random(100);
    if (rndColor > 50) {//splits them in half 50%
      fill(255);//white color
    }
    else {
      fill(0, 50);//if not other half black with transparency
    }

    //makes the random squares    
    sqr = random(10, 40);
    rect(random(width/2), random(height/2), sqr, sqr);//upper left quad
  }
  count--;

  //for the lines that go across the screen
  if (count<num) {
    if (count %4 ==0) {//divisible by 4 it will be 50% black
      fill(0, 50);
      rect(count*width/num, width/2, width/num, height);//starts bottom right draws on half of screen
    }
    if (count %6 ==0) {//white lines divisible by 6
      fill(255);
      rect(count*width/num, width/2, width/num, height);
    }
    if (count %12==0) {//red lines divisible by 12 (part of 4 and 6)
      fill(255, 0, 0, 75);
      rect(count*width/num, width/2, width/num, height);
    }
  }

  if (count<num) {
    if (count %4==0) {
      fill(0, 50);
      rect(600, count*width/num, -width/2, width/num);//starts in same spot goes up
    }
    if (count%6==0) {
      fill(255);
      rect(600, count*width/num, -width/2, width/num);
    }
    if (count %12==0) {
      fill(255, 0, 0, 75);
      rect(600, count*width/num, -width/2, width/num);
    }
  }
}


