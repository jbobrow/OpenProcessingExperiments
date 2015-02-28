
//random bricklaying pattern.  vertical spacing and brick size is constant, but horizontal size and spacing is random.
//also, a random amount of different colored bricks are randomly placed and randomly colored (within stated color range).

void setup() {
  size(600, 200);
  background(120, 180, 220);
  smooth();
  fill(100);
  noStroke();
  rect(0,height-30 ,width,30);
}

int num = 0;  //variable controlling number of bricks per row
float rndSpace; //brick spacing
int row = width; 
int brickWidth = 50;
int brickHeight = 20;



void draw() {
  rndSpace = random(width); //random spacing between bricks
  stroke(255);
  strokeWeight(1.5);


  if ( rndSpace >= row) { //stop laying bricks when wider than layout 
    if (random(10) >8) { // 20% chance that brick will be diff color
      fill(random(100, 200), random(0, 50), random(0, 50)); //random shade of darker red brick
    }
    else {  //if not a random color, then brick will be this color
      fill(180, 110, 80);
    }
    if ((num >= 0) && (num <20)) { //add 1 row of bricks randomly spaced until "num" gets to 19
      rect(rndSpace, height - 50, brickWidth, brickHeight);
      num++;
    }
    if ((num >=20 && num <40)) { // start another row randomly spaced when "num" reaches 20 until it reaches 39
      rect(rndSpace, height-(50+brickHeight), brickWidth, brickHeight);
      num++;
    }
    if ((num >=40 && num <60)) { // start another row when "num" reaches 40
      rect(rndSpace, height-(50+brickHeight*2), brickWidth, brickHeight);
      num++;
    }
    if ((num >=60 && num <80)) { // start another row when "num" reaches 60
      rect(rndSpace, height-(50+brickHeight*3), brickWidth, brickHeight);
      num++;
    }
    if ((num >=80 && num <100)) { //start another row when "num" reaches 80
      rect(rndSpace, height-(50+brickHeight*4), brickWidth, brickHeight);
      num++;
    }
    if ((num >=100 && num <120)) {  //start another row when "num" reaches 100
      rect(rndSpace, height-(50+brickHeight*5), brickWidth, brickHeight);
      num++;
    }
    if ((num >=120 && num <140)) {
      rect(rndSpace, height-(50+brickHeight*6), brickWidth, brickHeight);
      num++;
    }
    if ((num >=140 && num <160)) {  //start another row when "num" reaches 120
      rect(rndSpace, height-(50+brickHeight*7), brickWidth, brickHeight);
      num++;
    }
  }
}


