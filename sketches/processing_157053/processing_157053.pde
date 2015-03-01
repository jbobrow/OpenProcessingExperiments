
float xpos;
float ypos;

float pXpos;
float pYpos;

float xstart;
float ystart;

float treeWidth;
float treeHeight;

float xposBr = pXpos;
float yposBr = pYpos;

float brWidth = treeWidth;
float brHeight;

boolean stateAdvance=true;

int branchState = 0;
int uiState = 0;

PFont f;

float uiW = 400;

float startButtonX;
float startButtonY;

int alphaOut;

int praiseSeed = int(random(1, 4));

int treeR;
int treeG;
int treeB;
int treeSR;
int treeSG;
int treeSB;

void setup() {
  size(1200, 800);
  background (128, 196, 191);
}



void draw() {




  //starting position for new tree

  xstart=mouseX;
  ystart=height;

  // Easing for trunk

  float xDistance = (mouseX-xpos);
  float mouseSoft = map(xDistance, -600, 600, -3, 3); 

  //float xMove=sin(xpos*10);
  //  xpos=300+xMove;
  // ypos=ypos-1;

  ui();

  // Conditional to start drawning trunk
  // (222,254,251), stroke (49,97,92)

  if (branchState == 1) {
    xpos=mouseX;
    ypos=height;
    treeWidth = int(random(35, 45));

    treeSR = int(random(180, 203));
    treeSG = int(random(215, 240));
    treeSB = int(random(195, 215));
    treeR = int(random(35, 60));
    treeG = int(random(75, 108));
    treeB = int(random(60, 104));

    trunk();
  } else if (branchState > 1) {

    xpos+= mouseSoft;
    ypos-= random(2.5);

    treeR = treeR;
    treeG = treeG;
    treeB = treeB;
    treeSR = treeSR;
    treeSG = treeSG;
    treeSB = treeSB;

    trunk();
    if (ypos < 0) {
      branchState = 0;
      uiState = 3;
      alphaOut = 0;
    } else {
    }
  } else {
  }

  println (branchState + ", " + uiState);

  if (keyPressed) {
    if (key == 's') {
      saveFrame();
    }
  }

  //trunkStroke ();

  // trunk();


  //branch();



  // randomSeed(12);

  // if (ypos <= random(700, 600)) {


  /* if (frameCount % 90 == 0) {
   xposBr=pXpos;
   yposBr=pYpos;
   
   branch();
   
   } else { 
   xposBr=pXpos-xposBr+random(-8, 8);
   yposBr=yposBr+random(2.5);
   } */


  pXpos = xpos;
  pYpos = ypos;
}



/*
void mouseClicked() {
 trunk ();
 
 if (ypos <= 600) {
 //   branch();
 } else {
 }
 }
 
 */
void trunk () {


  if (treeWidth > 0) {
    treeWidth=treeWidth-(random(0.03, 0.07));
    treeHeight=10;
  } else {
    treeWidth=0;
    treeHeight=0;
  }

  noStroke();
  
  rectMode (CENTER);
  
 // fill(222,254,251);
 fill (treeSR,treeSG,treeSB);
  rect(xpos,ypos, treeWidth+4,treeHeight);
  
 // fill(49,97,92);
 fill(treeR,treeG,treeB);

  // ellipse(xpos, ypos, 8+cos(ypos*(random(0.001,0.003)))*10, 10);


  ellipse(xpos, ypos, treeWidth, treeHeight);

  /*
  xpos+=mouseSoft;
   ypos-=random(2.5);
   */
}


void trunkStroke () {



  noStroke();
  fill(255);

  // ellipse(xpos, ypos, 8+cos(ypos*(random(0.001,0.003)))*10, 10);


  ellipse(xpos-treeWidth/2, ypos, 4, treeHeight);
  
   ellipse(xpos+treeWidth/2, ypos, 4, treeHeight);

  /*
  xpos+=mouseSoft;
   ypos-=random(2.5);
   */
}



// branch

void branch () {

  if (brWidth > 0) {
    brWidth=brWidth-(random(0.03, 0.07));
    brHeight=10;
  } else {
    brWidth=0;
    brHeight=0;
  }



  //xposBr=400;

  fill(100, 60, 0);

  ellipse(xposBr, yposBr, brWidth, brHeight);

  xposBr=xpos-xposBr+random(-8, 8);
  yposBr=yposBr-random(2.5);
}



void mousePressed() {
  if ( mouseX > 0 && mouseX < width-uiW && uiState > 0) {
    branchState++;
  } else if (dist(mouseX, mouseY, startButtonX, startButtonY) < 300/2 && uiState < 3) {
    uiState++;
    alphaOut = 0;
  } else if (dist(mouseX, mouseY, startButtonX, startButtonY) < 300/2 && uiState == 3) {
    uiState=1;
    alphaOut = 0;
  } else {
  }
}

void mouseReleased() {
    praiseSeed = (praiseSeed+1) % 4;
  if ( mouseX > 0 && mouseX <  width-uiW && uiState > 0) {
    branchState++;
    uiState=2;
    alphaOut = 0;
  } else {
  }
}


// void mousePressed () {

// if boolean true, make false, else make true

void ui() {

  startButtonX = width-uiW/2;
  startButtonY = height/2;


  //ui background

  rectMode(CORNER);

  noStroke();
  fill(49, 97, 92, 20);
  rect(width-uiW, 0, width, height);

  if (uiState > 0) {
    alphaOut = alphaOut+2;
  } else {
    alphaOut = 0;
  }

  if (uiState == 0) {

    // Start button

    strokeWeight(10);
    stroke(222, 254, 251);
    fill(128, 196, 191);
    ellipse(startButtonX, startButtonY, 300, 300);

    //words

    f = createFont("Arial", 24, true); 
    fill(222, 254, 251);
    textFont(f);
    textAlign(CENTER);
    text("Let's grow some vines!", width-uiW/2, height/2);

    f = createFont("Arial", 16, true); 

    textFont(f);
    textAlign(CENTER);
    text("[CLICK HERE TO START]", width-uiW/2, height/2+30);
  } else if (uiState == 1) {

    // button

    strokeWeight(10);
    stroke(222, 254, 251, alphaOut);
    fill(128, 196, 191, alphaOut);
    ellipse(startButtonX, startButtonY, 300, 300);

    //words

    f = createFont("Arial", 24, true); 
    fill(222, 254, 251, alphaOut);
    textFont(f);
    textAlign(CENTER);
    text("Click anywhere on the left", width-uiW/2, height/2);

    textFont(f);
    textAlign(CENTER);
    text("to grow a vine.", width-uiW/2, height/2+30);


    /*fading black circle
     strokeWeight(10);
     stroke(0, alphaOut);
     fill(0, alphaOut);
     ellipse(startButtonX, startButtonY, 300, 300);*/
  } else if (uiState == 2) {

    // button
   // alphaOut = alphaOut+10; 

    strokeWeight(10);
    stroke(222, 254, 251, alphaOut);
    fill(128, 196, 191, alphaOut);
    ellipse(startButtonX, startButtonY, 300, 300);

    //words

    f = createFont("Arial", 24, true); 
    fill(222, 254, 251, alphaOut);
    textFont(f);
    textAlign(CENTER);
    text("Move the mouse to", width-uiW/2, height/2);

    textFont(f);
    textAlign(CENTER);
    text("guide its growth!", width-uiW/2, height/2+30);
  } else if (uiState == 3) {



   // alphaOut = alphaOut+10; 
    // button

    strokeWeight(10);
    stroke(222, 254, 251, alphaOut);
    fill(128, 196, 191, alphaOut);
    ellipse(startButtonX, startButtonY, 300, 300);

    //words

    f = createFont("Arial", 24, true); 
    fill(222, 254, 251, alphaOut);
    textFont(f);
    textAlign(CENTER);

    if (praiseSeed == 1) {
      text("Beautiful!", width-uiW/2, height/2);
    } else if (praiseSeed == 2 && millis() < 120000) {
      text("Gorgeous!", width-uiW/2, height/2);
    } else if (praiseSeed == 3 && millis() >= 120000) {
      text("Feel like Dr. Seuss yet?", width-uiW/2, height/2);
    } else if (praiseSeed == 3 && millis() > 120000) {
      text("Phenomenal!", width-uiW/2, height/2);
    } else if (praiseSeed == 3 && millis() >= 120000) {
      text("Feel like Dr. Seuss yet?", width-uiW/2, height/2);
    } else {
      text("That one kinda sucked.", width-uiW/2, height/2);
    }

    f = createFont("Arial", 16, true); 
    textFont(f);
    textAlign(CENTER);
        if (praiseSeed == 1) {
    text("[MAKE ANOTHER!]", width-uiW/2, height/2+30);
    } else if (praiseSeed == 2) {
    text("[HOW 'BOUT ONE MORE?]", width-uiW/2, height/2+30);
    } else if (praiseSeed == 3) {
    text("[KEEP GOING!]", width-uiW/2, height/2+30);
    } else {
    text("[TRY AGAIN?]", width-uiW/2, height/2+30);
    }


  } else {
  }
}

/*
  if (mousePressed) {
    branchState++;
  } else {
  }
  */
  
    // mouseClicked();
  //if (mouseClicked()) {
  //  trunk ();
  // } else {
  //}
  
  
  //for loop for branching 
  
  //have things rotate by something between 0 and PI tied to integer of foreloop


