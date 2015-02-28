
//This program draws random rectangles that increase in size to the middle of the sketch and then decrease in size to the end.

void setup() {
  size(300, 600);
  noStroke();
  background(0);
}

float rectSize = 0;  //This controls the size of the rectangle.
float count = 0;     //This controls the counter.
float num = 1200;    //This is the number of rectangles being drawn.

void draw() {
  if (count > height) {  
    rectSize -= 2;             //This determines when the rectangles will decrease in size.
  }
  if (count < num) {
    rectSize += 1;             //This determines when the rectangles will increase in size.
    if (random(100) > 50) {    //This determines the probablity.
      fill(255, 0, 0, 50);     //This makes the red rectangles.
    }
    else {
      fill(0, 255, 255, 50);   //This makes the cyan rectangles.
    }
    //This draws the rectangles with a random x value and an increasing y value. The dimensions are slowed down by dividing each by 16.
    rect(random(width), count/2, rectSize/16, rectSize/16);  
    
  }
  count++;
}


