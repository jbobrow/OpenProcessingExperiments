
//randomly turn on lights in a skyscraper

void setup() {
  size(300, 300);
  background(25, 25, 112);
  noStroke();
  fill(255, 60);
  ellipse (10, 10, 90, 90);
  fill(0);
  rect(width/4, height/4, width, 3*height/4); //base building
}

float window = 5;
float num = 20;

void draw() {


  if (window < num) { //top floor windows
    if (window % 2 == 0) { 
      stroke(0);
      rect(window * width/num, height/4 +5, 10, 20);
    }
    if (random(10)>8) { //random lights turn on
      fill(255, 255, 0);
    }
    else {
      fill(0);
    }
    rect(window * width/num, 3*height/8 +5, 10, 20);//5th floor windows
    if (random(10)>8) { //random lights turn on
      fill(255, 255, 0);
    }
    else {
      fill(0);
    }
    rect(window * width/num, height/2 +5, 10, 20); //4th floor windows
    if (random(10)>8) { //random lights turn on
      fill(255, 255, 0);
    }
    else {
      fill(0);
    }
    rect(window * width/num, 5*height/8 +5, 10, 20);//3rd floor windows
    if (random(10)>8) { //random lights turn on
      fill(255, 255, 0);
    }
    else {
      fill(0);
    }
    rect(window * width/num, 3*height/4 +5, 10, 20); //2nd floor windows
    if (random(10)>8) { //random lights turn on
      fill(255, 255, 0);
    }
    else {
      fill(0);
    }
    rect(window * width/num, 7*height/8 +5, 10, 20);//1st floor windows
    if (random(10)>8) { //random lights turn on
      fill(255, 255, 0);
    }
    else {
      fill(0);
    }
  }
  window++;
}




