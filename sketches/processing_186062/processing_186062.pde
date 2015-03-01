
int counter, movement;
bool flag, firstMove;

void setup() {  //setup function called initially, only once
  size(250, 360);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  movement = 0;
  flag = true;
  firstMove = true;
}

void draw() {  //draw function loops 
  if(mousePressed == true) { //add some interaction
    crazy();
  }
  else {
    calm();
  }
}

void crazy() {
  counter++;
  movement++;
  
  if (firstMove) {
    background(255);
    firstMove = false;
  }
  
  noStroke();
  fill(random(255),100,255,50);
  ellipse(width/3, 100, 80*sin(counter), 80*sin(counter));
  ellipse(width/1.5, 100, 80*sin(counter), 80*sin(counter));
  endShape();
  
  fill(0);
  triangle(97, 175, 125, 120, 153, 175);
  endShape();
  
  arc(125, 250, 80, 80, 0, PI+PI);
  endShape();
  
  fill(255, 100, 100);
  
  if (flag) {
    arc(135, 270 + movement, 40, 150, 0, PI);
  } else {
    arc(135, 270 - movement, 40, 150, 0, PI);
  }
  
  if (movement > 10) {
    movement = 0;
    flag = !flag;
  }
  
  translate(width/2, height/2);
}

void calm() {
  firstMove = true;
  movement = 0;
  flag = true;
  
  background(255);
  noFill();
  stroke(155);
  arc(80, 75, 60, 60, QUARTER_PI, HALF_PI+QUARTER_PI);
  arc(170, 75, 60, 60, QUARTER_PI, HALF_PI+QUARTER_PI);
  endShape();
  
  fill(0);
  noStroke();
  triangle(97, 175, 125, 120, 153, 175);
  endShape();
  
  arc(125, 250, 30, 30, 0, PI+PI);
  endShape();
}
