
int state = 0;
int breakfast = 1;
int lunch = 2;
int dinner = 3;
int dessert = 4;
int count = 5;
boolean justChanged = false;

void setup() {
  size(500, 500);
  background(255);
  fill(0);
  ellipse(250,250,490,490);
  fill(255);
  ellipse(250,250,380,380);
  count = 0;
  frameRate = 30;
  state = breakfast;
}

void draw() {
  if (state == breakfast) {
    eatbreakfast();
  }
  if (state == lunch) {
    eatlunch();
  }
  if (state == dinner) {
    eatdinner();
  } 
  if (state == dessert) {
    eatdessert();
  }

  if (count == 500) {
    if (state == breakfast  && !justChanged) {
      state = lunch;
      count = 0;
      justChanged = true;
    }
    if (state == lunch  && !justChanged) {
      state = dinner;
      count = 0;
      justChanged = true;
    }
    if (state == dinner  && !justChanged) {
      state = dessert;
      count = 0;
      justChanged = true;
    }
    justChanged = false;
  }

  count ++;
}

void eatbreakfast() {
  background(255);
  fill(0);
  ellipse(250,250,490,490);
  fill(45);
  ellipse(250,250,380,380);
  fill(255);
  ellipse(250, 240, 318, 170);
  fill(#f0e92d);
  ellipse(190, 250, 70, 74);
  fill(#f0e92d);
  ellipse(327, 246, 71, 70);
}

void eatlunch() {
  background(255);
  fill(0);
  ellipse(250,250,490,490);
  fill(45);
  ellipse(250,250,380,380);
  fill(#c8861f);
  arc(250, 250, 200, 200, -PI, 0, CHORD);
  fill(#f25a61);
  rect(152,252,195,20);
  fill(#452727);
  rect(150,274,200,40);
  fill(#c8861f);
  rect(150,317,200,40);
}

void eatdinner() {
  background(255);
  fill(0);
  ellipse(250,250,490,490);
  fill(45);
  ellipse(250,250,380,380);
  fill(#e6ab0c);
  ellipse(250, 250, 300, 300);
  fill(#eec24d);
  ellipse(250, 250, 260, 260);
  fill(#af450c);
  ellipse(168, 200, 40, 40);
  ellipse(198, 269, 40, 40);
  ellipse(310, 299, 40, 40);
  ellipse(238, 169, 40, 40);
  ellipse(252, 233, 40, 40);
  ellipse(331, 249, 40, 40);
  ellipse(312, 187, 40, 40);
  ellipse(244, 336, 40, 40);
  ellipse(176, 322, 40, 40);
  ellipse(249, 283, 40, 40);
  ellipse(147, 254, 40, 40);
  line(100,255,400,255);
  line(250,100,250,399);
}

void eatdessert() {
  background(255);
  fill(0);
  ellipse(250,250,490,490);
  fill(45);
  ellipse(250,250,380,380);
  fill(#a77c38);
  arc(250, 250, 230, 230, 0, PI+QUARTER_PI, PIE);
  fill(#402803);
  rect(284, 277, 20, 19);
  rect(190, 272, 18, 20);
  rect(237, 256, 17, 20);
  rect(247, 310, 20, 17);
  rect(164, 197, 16, 19);
  rect(153, 245, 15, 13);
  rect(193, 237, 12, 15);
  rect(197, 320, 19, 18);
  rect(157, 293, 14, 11);
  rect(323, 250, 14, 11);
  rect(293, 322, 14, 11);
  rect(238, 341, 14, 11);
  rect(221, 293, 14, 11);
  rect(196, 211, 14, 11);
  rect(319, 290, 18, 13);
}



