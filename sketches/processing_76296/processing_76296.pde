
//Robb Godshaw

float offset=0, offsetindexed, increment; //initialization of things explained below

float skullDia = 50;
color figure = color(255);
color ground = color(0);

boolean clickOnce = false;

void setup() { 
  size(550, 550);
  smooth();
  noStroke();
  colorMode(HSB);
}

void draw() {
  offset = offset + 0.035;
  background(ground);

  translate(mouseX, mouseY);
  skull(0, 0, sine(-PI / 8, PI / 8, .01));

  //RIGHT arm  
  pushMatrix();//a
  translate(50, 12);
  rotate( sine(-PI / 3, 0, 1));
  femur();
  translate(0, 95);
  rotate( sine(-PI / 10, PI / 10, 1));
  femur();
  popMatrix();//a
  
  
  //LEFT ARM
  pushMatrix();//b
  translate(-50, 12);
  rotate( sine(0, PI / 3, 1));
  femur();
  translate(0, 95);
  rotate( sine(-PI / 10, PI / 10, 1));
  femur();
  popMatrix();//b


  pushMatrix();//c
  translate(0, 22);
  for (int i = 0; i<7;i++) {
    translate(0, 10);
    rotate( sine(-PI / 100, PI / 100, .01));
    ribs();
  }
  noStroke();

  popMatrix();//c

  pushMatrix();//d

  for (int i = 0; i<14;i++) {
    translate(0, 10);
    rotate( sine(-PI/100, PI/100, .01));
    vertebrae();
  }

  hips();

  //LEFT LEG///
  pushMatrix();//dd
  translate(-27, 8);
  rotate( sine(-PI / 10, PI / 10, 1));
  femur();
  translate(0, 95);
  rotate( sine(-PI / 10, PI / 10, 1));
  femur();
  popMatrix();//dd


  //RIGHT LEG
  pushMatrix();//ddd
  translate(27, 8);
  rotate( sine(-PI / 10, PI / 10, 1));
  femur();
  translate(0, 95);
  rotate( sine(-PI / 10, PI / 10, 1));
  femur();
  popMatrix();//ddd
  popMatrix();//d
}



void skull(float neckX, float neckY, float theta) {
  pushMatrix();//e
  translate(neckX, neckY);
  rotate(theta);
  fill(figure);
  ellipse(0, -skullDia / 2, skullDia, skullDia);
  fill(ground);
  float eyeDia = 11;
  ellipse(-skullDia / 4, -skullDia / 2, eyeDia, eyeDia);
  ellipse(skullDia / 4, -skullDia / 2, eyeDia, eyeDia);
  float nostrilHd = 5;
  float nostrilPitch = 2;
  strokeCap(ROUND);
  strokeWeight(2);
  stroke(ground);
  line(-nostrilPitch, -skullDia / 3, -nostrilPitch, -skullDia / 3 + nostrilHd);
  line(nostrilPitch, -skullDia / 3, nostrilPitch, -skullDia / 3 + nostrilHd);
  noStroke();
  popMatrix();//e
  fill(figure);
}

void vertebrae() {
  rectMode(CENTER);
  fill(figure);
  rect(0, -2, -10, -4);
  rect(0, -4, -5, -10);
}

void ribs() {
  strokeWeight(5);
  stroke(figure);
  noFill();
  float ribHt = 28;
  float ribWd = 66;
  arc(0, -ribHt / 2, ribWd, ribHt, -PI, 0);
}

void hips() {
  float pitch = 27;
  float ht = 26;
  float wd = 22;
  ellipse(-pitch, -ht / 2, wd, ht);
  ellipse(pitch, -ht  / 2, wd, ht);
}

void femur() {
  float bulb = 9;
  float lt = 80;
  ellipse(-bulb / 2, 0, bulb, bulb);
  ellipse(bulb / 2, 0, bulb, bulb);
  rectMode(CORNER);
  rect(-bulb / 2, 0, bulb, lt);
  ellipse(-bulb / 2, lt, bulb, bulb);
  ellipse(bulb / 2, lt, bulb, bulb);
}



/////// Function to return sine'd values in a manner kinda like random ///////
float sine(float low, float high, float speed) {
  float cooked;

  if (clickOnce) {
    noiseDetail(4);//4 is defailt. Higher is more finely grained. More sparatic.
    cooked = map(noise(offset), 0, 1, low, high);//This scales the noise value to match its application and spits out a neatly packaged float for you. Still warm.
    ground=color(frameCount % 255, 255, 255);
    figure=color(0);
  }

  else {  
    float raw =  sin(map(millis() % 1000, 0, 1000, 0, TWO_PI)); //SINE!!
    cooked = map(raw, -1, 1, low, high);
    ground=color(0);
    figure=color(255);
  }

  return cooked;
}

void mousePressed() { 
  clickOnce = !clickOnce ;
}

