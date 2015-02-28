
int qtyColumn =5; //Having some fun with size variablity
int qtyRow =2; //the qty of riows and columns dictate the window size
int buttonSize = 111; //diameter of buttons in pixels
int gutter = 1; //space between rows and columns

int[] buttonTypeIndex = new int[qtyColumn*qtyRow]; //Array storing the nature of each button
boolean[] buttonToneIndex = new boolean[qtyColumn*qtyRow]; //Array storing the tone of each button
boolean[] deadOn = new boolean[qtyColumn*qtyRow];

int randomTone, randomType, tone; //the type of button and wheatehr it is black or white is randomized
float w, h; // I have a habit of mispelling height. This solves that problem
boolean clickDown, clickUp;
boolean currentEntityPolarity;
int currentEntityType;


boolean clickOnce = false;
boolean click = false;
int coordXClick, coordYClick;

boolean unclickOnce = false;
boolean unClick = false;
int coordXunClick, coordYunClick;


void setup() {
  size(555,222);
  smooth();
  noStroke(); //Strokes are hideous
  colorMode(HSB);

  for (int i = 0; i < qtyColumn*qtyRow; i++) { //pushes random info onto each button, 1d array
deadOn[i] = false;
    buttonTypeIndex[i] = i%5;
    buttonToneIndex[i] =  i>= 5 ? false : true;

    //print(i+" Type:"); //debug
   // print(buttonTypeIndex[i]);
    //println(" Default Color:" +  buttonToneIndex[i]);
  }
}

void draw() {
  background(34, 56, 98);

  for (int column = 0; column < qtyColumn; column++) {//makles all the buttons
    for (int row = 0; row < qtyRow; row++) {
      //i maps to the buttons just as "column+row+row*column" does, I think.
      theWorlddofLonelyButton(column, row, buttonTypeIndex[row*5+column], buttonToneIndex[row*5+column]);
    }
  }
  resetClickys();
}

void theWorlddofLonelyButton(int column, int row, int type, boolean TONE) {
  boolean instaClick = false;
  if (TONE) {
    tone=0;
  }
  else {
    tone=255;
  }


  float xx   = column* (buttonSize+gutter); //maps the column number to the actual pixel coordinates
  float yy   = row  *  (buttonSize+gutter);

  fill(tone); //fills with the value determined above
  ellipseMode(CORNER);                     //Corner+wd/ht ellipse config
  rect(xx, yy, buttonSize, buttonSize); //replace with rect. it'll work fine
  fill(255-tone); //fills with the value determined above


    switch(buttonTypeIndex[row*5+column]) {
  case 0:
    label("⇈", xx, yy);
    if ( unclickOnce && coordXunClick > xx && coordXunClick < xx+buttonSize && coordYunClick > yy && coordYunClick < yy+buttonSize) {
      buttonToneIndex[row*5+column] = !buttonToneIndex[row*5+column];
    }
    break;
  case 1:
    label("⇊", xx, yy);
    if ( clickOnce && coordXClick > xx && coordXClick < xx+buttonSize && coordYClick > yy && coordYClick < yy+buttonSize) {
      buttonToneIndex[row*5+column] = !buttonToneIndex[row*5+column];
    }
    break;
  case 2:
    label("↨", xx, yy);
    if ( clickOnce && coordXClick > xx && coordXClick < xx+buttonSize && coordYClick > yy && coordYClick < yy+buttonSize) {
      buttonToneIndex[row*5+column] = !buttonToneIndex[row*5+column];
    }
    if ( unclickOnce && coordXunClick > xx && coordXunClick < xx+buttonSize && coordYunClick > yy && coordYunClick < yy+buttonSize) {
      buttonToneIndex[row*5+column] = !buttonToneIndex[row*5+column];
    }
    break;
  case 3:
    label("↑", xx, yy);
    if (!deadOn[row*5+column] && unclickOnce && coordXunClick > xx && coordXunClick < xx+buttonSize && coordYunClick > yy && coordYunClick < yy+buttonSize) {
      buttonToneIndex[row*5+column] = !buttonToneIndex[row*5+column];
      deadOn[row*5+column] = true;
    }
    break;
  case 4:
    label("↓", xx, yy);
      if (!deadOn[row*5+column] && unclickOnce && coordXClick > xx && coordXClick < xx+buttonSize && coordYunClick > yy && coordYClick < yy+buttonSize) {
      buttonToneIndex[row*5+column] = !buttonToneIndex[row*5+column];
      deadOn[row*5+column] = true;
    }
    break;
  }
}

void label(String labell, float xx, float yy) {
  text(labell, xx+buttonSize/6, yy+buttonSize/4);
}



void mouseReleased() {//I wanted a one-shot boolean for mousepressed AND released, so I made both.

  if (!clickOnce) {
    coordXunClick =  mouseX;
    coordYunClick =  mouseY;
    unclickOnce = true;
    println("unclicked at:"+ coordXunClick +" , "+ coordYunClick);
  }
}

void mousePressed() {

  if (!clickOnce) {
    coordXClick =  mouseX;
    coordYClick =  mouseY;

    clickOnce = true;
    println("clicked at:"+ coordXClick +" , "+ coordYClick);
  }
}

void resetClickys() {//constantly resteting the click booleans
  if (clickOnce) {
    clickOnce = false;
  }

  if (unclickOnce) {
    unclickOnce = false;
  }
}

