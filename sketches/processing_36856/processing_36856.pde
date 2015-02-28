
boolean mouseIsDown = false;
void setup() {
  setupAudio();
  size(500, 500);
}

void draw() {
  background(149, 214, 194);
  smooth();
  noStroke();
  //scenery
  fill(170, 193, 131);
  ellipse(100, 350, 800, 100);
  fill(152, 193, 59);//hill
  ellipse(500, 350, 400, 70);
  fill(130, 165, 72);
  quad(0, 350, 0, 500, 500, 500, 500, 350);
  fill(67, 66, 65, 90);
  ellipse(59, 390, 90, 12);
  fill(129, 104, 72);
  rect(95, 200, 15, 200);
  fill(85, 134, 66);
  ellipse(100, 200, 120, 150);
  arc(100, 400, 90, 20, PI, TWO_PI);

  getVolume();
  // float Y = map(volume, 0,100, 2,100);  // now we can use it for something!
  //shoulders
  fill(84, 155, 146);
  ellipse(250, 500, 200, 200);

  //main face 
  fill(219, 183, 146);
  ellipse(180, 270, 20, 60);
  ellipse(320, 270, 20, 60);
  fill(252, 224, 186);
  ellipse(250, 250, 130, 400);

  //hat
  float Y = map(volume, 0, 100, 2, 100);
  fill(184, 126, 69);
  rect(200, 40, 100, 60);

  float hatTassels = Y;
  if (hatTassels >= 20)
  {
    fill(170, 35, 123);
    rect(200, 80, 20, 20);
    fill(87, 150, 173);
    rect(220, 80, 20, 20);
    fill(85, 232, 56);
    rect(240, 80, 20, 20);
    fill(247, 247, 35);
    rect(260, 80, 20, 20);
    fill(247, 63, 35);
    rect(280, 80, 20, 20);
  }
  else
  {
    fill(0, 0, 0);
    rect(200, 80, 100, 20);
  }

  //hat tassels
  stroke(2);
  strokeWeight(3);
  line(152, 110, 152, 170);
  ellipse(152, 170, 10, 10);
  line(170, 110, 170, 180);
  ellipse(170, 180, 10, 10);
  line(200, 110, 200, 170);
  ellipse(200, 170, 10, 10);
  line(230, 110, 230, 190);
  ellipse(230, 190, 10, 10);
  line(260, 110, 260, 170);
  ellipse(260, 170, 10, 10);
  line(300, 110, 300, 190);
  ellipse(300, 190, 10, 10);
  line(320, 110, 320, 165);
  ellipse(320, 165, 10, 10);
  line(347, 110, 347, 175);
  ellipse(347, 175, 10, 10);

  //hat brim
  noStroke();
  fill(184, 126, 69);
  rect(150, 100, 200, 20);

  //eyes
  noStroke();
  //pupils
  // float pupilSize = map(volume, 0, 100, 2, 100);
  //left eye
  float ex = 219;
  float ey = 250;
  fill(255);
  ellipse(ex, ey, 40, 50);
  fill(0);
  float dx = constrain((mouseX-ex)/32, -14, 14);
  float dy = constrain((mouseY-ey)/32, -14, 14);
  ellipse(ex+dx, ey+dy, 15, 35);
  //right eye
  float es = 281;
  float et = 250;
  fill(255);
  ellipse(es, et, 40, 50);
  fill(0);
  float ds = constrain((mouseX-es)/32, -14, 14);
  float dt = constrain((mouseY-et)/32, -14, 14);
  ellipse(es+ds, et+dt, 15, 35);

  //lids
  float lidPlacement = map(volume, 0, 100, 2, 100);
  //fill(191, 206, 96);
  fill(196, 122, 107);
  arc(220, (240 - (lidPlacement/2)), 45, 45, PI, TWO_PI);
  arc(280, (240 - (lidPlacement/2)), 45, 45, PI, TWO_PI);

  //nose
  stroke(4);
  fill(147, 145, 145, 70);
  arc(250, 300, 30, 40, 0, PI);

  //mouth 
  //inner mouth
  noStroke();
  fill(57, 1, 1);
  float lipPlacement = map(volume, 0, 100, 2, 100);
  float mouthLimit = lipPlacement;
  if (lipPlacement >= 20)
  {
    lipPlacement=20;
  }
  ellipse(250, 350, (67-(lipPlacement/4)), (10+(lipPlacement*2)));
  // uppper lip
  fill(214, 69, 86);
  arc(250, (350-(lipPlacement/4)), 69, (20+lipPlacement), PI, TWO_PI);
  //lower lip
  fill(165, 45, 45);
  arc(250, (350+lipPlacement), (60-lipPlacement), (20+lipPlacement), 0, PI);

  if (mouseIsDown == true)
  {
    //glasses
    fill(0, 0, 0);
    rect(180, 235, 140, 8);
    stroke(3);
    noFill();
    arc(220, 240, 60, 80, 0, PI);
    arc(280, 240, 60, 80, 0, PI);
    noStroke();
    fill(222, 171, 121);
    ellipse(270, 300, 30, 30);
    ellipse(230, 300, 30, 30);
    fill(245, 181, 116);
    ellipse(250, 297, 40, 60);
    fill(255, 255, 255, 200);
    ellipse(260, 300, 10, 30);
  }
}

void mousePressed() 
{
  mouseIsDown = true;
}

void mouseReleased() 
{
  mouseIsDown = false;
}


