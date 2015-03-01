
float[] myNumbers;
int bt1X, bt2X, bt1Y, bt2Y, btWidth, btHeight, btGreen, btBlue, btTextColor;
String label1, label2;
boolean isVertical, isGreen, isHovering1, isHovering2;

void setup() {
  size(450, 450);
  bt1X=250;
  bt1Y=10;
  btWidth=150;
  btHeight=20;
  bt2X=bt1X;
  bt2Y=bt1Y+btHeight+10;
  btGreen=255;
  btBlue=0;
  btTextColor=255;
  label1="Change to Vertical";
  label2="Change to Green";
  isVertical=false;
  isGreen=false;
  isHovering1=false;
  isHovering2=false;

  myNumbers=new float[15];
  for (int i=0; i<myNumbers.length; i++) {
    myNumbers[i]=random(5, 200);
    //    println(myNumbers[i]);
  }
}

void draw() {
  background(255);
  if (isVertical) {
    label1="Change to Horizontal";
    drawVerticalBar();
  } else {
    label1="Change to Vertical";
    drawHorizontalBar();
  }
  if (isGreen) {
    label2="Change to Green";
    btGreen=255;
    btBlue=0;
    btTextColor=0;
  } else {
    label2="Change to Blue";
    btGreen=0;
    btBlue=255;
    btTextColor=255;
  }
  //drawing button 1
  fill(0, 50, 250);
  rect(bt1X, bt1Y, btWidth, btHeight, 10);
  fill(255);
  textSize(12);
  textAlign(CENTER, CENTER);
  text(label1, bt1X, bt1Y, btWidth, btHeight);

  //drawing button 2
  fill(0, btGreen, btBlue);
  rect(bt2X, bt2Y, btWidth, btHeight, 10);
  fill(btTextColor);
  textSize(12);
  textAlign(CENTER, CENTER);
  text(label2, bt2X, bt2Y, btWidth, btHeight);
}

void drawHorizontalBar () {
  for (int i=0; i<myNumbers.length; i++) {
    float barHeight=25;
    fill(0, btBlue, btGreen);
    rect(0, i*30, myNumbers[i], barHeight);
    fill(0, 0, 255);
    textSize(10);
    textAlign(LEFT);
    text(nf(myNumbers[i], 0, 1), myNumbers[i]+2, i*30+barHeight/2);
  }
}

void drawVerticalBar() {
  for (int i=0; i<myNumbers.length; i++) {
    float barWidth=25;
    fill(0, btBlue, btGreen);
    rect(i*30, 450, barWidth, -myNumbers[i]);
    fill(0, 0, 255);
    textSize(10);
    textAlign(LEFT);
    text(nf(myNumbers[i], 0, 1), i*30, 450-myNumbers[i]-3);
  }
}


void mouseMoved() {
  if (mouseX>=bt1X && mouseX<=btWidth+bt1X && mouseY >=bt1Y && mouseY<=btHeight+bt1Y) {
    isHovering1=true;
  } else {
    isHovering1=false;
  }

  if (mouseX>=bt2X && mouseX<=btWidth+bt2X && mouseY >=bt2Y && mouseY<=btHeight+bt2Y) {
    isHovering2=true;
  } else {
    isHovering2=false;
  }
}


void mouseReleased() {
  if (isHovering1) {
    if (!isVertical) {
      isVertical=true;
    } else {
      isVertical=false;
    }
  }
  if (isHovering2) {
    if (!isGreen) {
      isGreen=true;
    } else {
      isGreen=false;
    }
  }
}



