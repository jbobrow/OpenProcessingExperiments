
void setup() {
  size(600, 300);//width double hieght in order to emphasize grain
  background(14, 20, 34);
  smooth();
  stroke(45, 46, 61);
}

float x = 0;//used to set the increments that comprise the width of the composition
float rndHeight;//defines height of rectangles
float rndWidth;//defines width of rectangles


void draw() {

  float variable = random(0, 100);//variable controlling the frequency of either two colors of the rectangles


  if (x > 0 && x < 100) {//first of six 100pixel increments composing the canvas
    if (variable > 15) {//setting the frequency of the rectangles' color: purple is dominant color in this section
      fill(146, 77, 105);
    }
    else {
      fill(230, 231, 146);
    }
    rndHeight = random(50, 100);//setting rectangles' height boundaries
    rndWidth = random(60, 50);//setting rectangles' width boundaries
    rect(x, random(height), rndWidth, rndHeight);
  }



  if (x > 100 && x < 200) {//second increment
    if (variable > 20) {//color frequency is still mostly purple but more beige appears
      fill(146, 77, 105);
    }
    else {
      fill(230, 231, 146);
    }

    rndHeight = random(25, 75);//rectangles' height boundaries decrease
    rndWidth = random(50, 40);//rectangles' width boundaries decrease
    rect(x, random(35, 265), rndWidth, rndHeight);
  } 




  if (x > 200 && x < 300) {//third increment
    if (variable > 40) {//frequency of purple and beige are almost half and half now
      fill(146, 77, 105);
    }
    else {
      fill(230, 231, 146);
    }

    rndHeight = random(20, 50);//rectangles' height boundaries still decreasing; will decrease until end 
    rndWidth = random(40, 30);//rectangles' width boundaries still decreasing; will decrease until end
    rect(x, random(70, 230), rndWidth, rndHeight);
  }



  if (x > 300 && x < 400) {//fourth increment
    if (variable > 60) {//frequency of beige is now higher than purple
      fill(146, 77, 105);
    }
    else {
      fill(230, 231, 146);
    }

    rndHeight = random(10, 25);
    rndWidth = random(30, 20);
    rect(x, random(105, 195), rndWidth, rndHeight);
  }



  if (x > 400 && x < 500) {//fifth increment
    if (variable > 80) {//beige now largely dominant over purple
      fill(146, 77, 105);
    }
    else {
      fill(230, 231, 146);
    }

    rndHeight = random(5, 15);
    rndWidth = random(20, 10);
    rect(x, random(140, 160), rndWidth, rndHeight);
  }



  if (x > 500 && x < 600) {//sixth increment
    if (variable > 100) {
      fill(146, 77, 105);//now only beige
    }
    else {
      fill(230, 231, 146);
    }

    rndHeight = random(1, 5);
    rndWidth = random(10, 1);
    rect(x, random(145, 155), rndWidth, rndHeight);
  }

  x += 2;//decreases number of rectangles drawn per frame (compared to x ++) in order to decluster composition
}


