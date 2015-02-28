
//SHAPES
float rect_height=45;
float increment= 0.5;
//y height of eyelid/rectangle
float y_pos=60; // y pos of clock button
int minutes=5;
int seconds=0;
boolean lose = false;
PFont hlvtca;
PFont gulim;
float f;
float testing;


void setup() {
  background(255);
  size(700,400);
  stroke(2);
  fill(0);


  hlvtca = loadFont("Helvetica-Bold-120.vlw");
  textFont(hlvtca);
  gulim = loadFont("Gulim-120.vlw");





  // boy TRYNA SLEEEP

  smooth();
}

void draw() {
  background(255);
  fill(255,227,188);
  noStroke();
  rect(350,0,350,400);
  fill(255,255,255);
  ellipse(460,195,107,107);
  ellipse(586,195,107,107);
  fill(175,175,176);
  ellipse(460,195,36,36);
  ellipse(586,195,36,36);

  //eyelids
  rect_height+=increment; //value to increment the height of the rectangle
  if (rect_height > 155) {
    lose = true;
    rect_height = 155;
  }
  fill(255,227,188);
  rect(383,100, 265, rect_height); //(x,y,w,h);

  increment+=0.015;



  fill(230,61,111);

  //if press = button/reset game
  if (mousePressed == true) {
    y_pos= 85;
    // reset the time
    rect_height = 45;
    increment = random(0.5,100);
  }
  else {
    y_pos = 60;
  }

  rect(140,y_pos,80,40);







  //clock base
  fill(222,240,231);
  beginShape();
  noStroke();

  line(77,200,75, 43);
  line(289,200,290,43);

  bezier(77,200,75,50,290,50,289,200);
  rect(77,260,212,90);





  endShape();

  fill(0,0,0);
  //text("11:11",110,300);

  float t = map(rect_height, 45, 155, 5*60, 0);

  minutes = floor(t/60);
  seconds = floor(t - minutes * 60);
  String secondsString = seconds + "";
  if (seconds < 10) {
    secondsString = "0" + seconds;
  }
  textFont(gulim,55);
  text(minutes+":"+secondsString, 125, 250);


  //if time runs out, YOU LOSE
  textFont(hlvtca, 100);



  if (lose == true) { //LOSE PAGE
    fill(255,150);
    rect(0,0,width,height);
    println("YOU LOSE");
    fill(255);
    ellipse(460,195,107,107);
    ellipse(586,195,107,107);
    fill(176);
    

    float s = 0.2;
    f += s;
    pushMatrix();
    translate(460, 195);
    rotate(((sin(f)/2)+1));
    ellipse(10,0,36,36);
    popMatrix();
    ellipse(586,195,36,36);
    fill(0);
    rotate(0);
    text ("YOU LOSE", 110, 235);
    if (mousePressed) {
      lose = false;
    }

  }
}

void mousePressed() {
}


