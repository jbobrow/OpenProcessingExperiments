
void setup() { //sets the color and size of the sketch's background
  size(600, 300);
  background(72, 161, 237);
  smooth();
}

float count = 2; //sets the pattern order for the horizontal bars
float num = 160;

void draw() {
  if (count < num) {
    if (random(100) > 80) { //selects 20% of the horizontal bars to be white
      fill(255);
    }
    else {
      fill(0, 0, 255); // the other 80% of bars are blue
    }
    if (count % 4 == 0) { // sets the horizontal bars' dimensions and width, keeping the regular order along the Y-axis
      rect(width, count*width/num, random(-width), width/num);// drawn from the right side
      rect(0,count*width/num, random(width), width/num);// drawn from the left side
    } 
  
  }
  count++;


}


