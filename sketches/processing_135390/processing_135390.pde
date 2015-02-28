
boolean flipFlop = false;
String keyPrompt = "press any key";
float eyeBallDiam[] = { 20, 40};
float pupilDiam[] = { 5, 20};
float eyeBrowLoc[] = {60, 5};
float mouthWidth[] = {40, 33};
float headWidth[] = {125, 200};
float headHeight[] = {175, 225};
float hairColor[] = { 0, 255, 0, 255, 0, 255};
float _hairColorR = 0;
float _hairColorG = 0;
float _hairColorB = 0;
float _eyeBallDiam = 30;
float _pupilDiam = 15;
float _eyeBrowLoc = 5;
float _mouthWidth = 33;
float _headWidth = 150;
float _headHeight = 200;





void setup() {
  size(300, 300);
  background(44, 200, 250);
  textSize(12);
}
void draw() {
  makeFace();
  smooth();
  text(keyPrompt, -145, -135);
}

void keyPressed() {
  _eyeBallDiam = random(eyeBallDiam[0], eyeBallDiam[1]);
  _pupilDiam = random(pupilDiam[0], pupilDiam[1]);
  _eyeBrowLoc = random(eyeBrowLoc[0], eyeBrowLoc[1]);
  _mouthWidth = random(mouthWidth[0], mouthWidth[1]);
  _headWidth = random(headWidth[0], headWidth[1]);
  _headHeight = random(headHeight[0], headHeight[1]);
  _hairColorR = random(hairColor[0], hairColor[1]);
  _hairColorG = random(hairColor[2], hairColor[3]);
  _hairColorB = random(hairColor[4], hairColor[5]);


  keyPrompt = ("");
}


//myfunction

void makeFace() {
  background(240, 237, 194);
  noStroke();
  rectMode(CENTER);
  // this is important - changes zero location for all future coordinates
  translate(150, 150);


  //tails
  fill(_hairColorR, _hairColorG, _hairColorB);
  //fill(225, 225, 0);
  rect(width/3, height/9, 35, 250);
  rect(-width/3, height/7, 35, 250);

  //face
  fill(225, 223, 196);
  stroke(225);
  ellipse(0, 0, 180, 180);
  


  //rectMode(CENTER);
  //fill(30,200,30);
  //noStroke();
  //rect(0,0, 200, 150);



  //eyes
  fill(225);
  stroke(0);
  ellipse(-25, 0, _eyeBallDiam, _eyeBallDiam);
  ellipse(25, 0, _eyeBallDiam, _eyeBallDiam);
  fill(0, 225, 225);
  ellipse(-25, 0, 20, 20);
  ellipse(25, 0, 20, 20);




  //lips
  fill(225, 0, 0);
  ellipse(0, 45, _mouthWidth, _mouthWidth);
  fill(225, 223, 196);
  stroke(225);
  line(45, 45, -25, 45);

  //earsthings
  stroke(225);
  ellipse(-85, 15, 50, 60);
  ellipse(85, 15, 50, -60);
  fill(255, 255, 153);
  ellipse(-100, 30, 30, 20);
  ellipse(100, 30, -30, 20);

  //hair
  fill(_hairColorR, _hairColorG, _hairColorB);
  noStroke();
  ellipse(100, -70, 60, 60);
  ellipse(-90, -70, 60, 60);
  rect(-10, -50, 190, 50);
  ellipse(40, -80, 80, 60);
  ellipse(-30, -80, 80, 60);
  fill(hairColor[1], 223, 196);
  //noStroke();
  ellipse(100, -70, 45, 45);
  ellipse(-90, -70, 45, 45);
  fill(135, 4, 0);
  noStroke();
  ellipse(100, -70, 35, 35);
  ellipse(-90, -70, 35, 35);



  //brows
  //fill(112, 65, 57);
  //noStroke();
 // rect(-80, -40, _eyeBrowLoc, _eyeBrowLoc);
 // rect(10, -40, _eyeBrowLoc, _eyeBrowLoc);
}



