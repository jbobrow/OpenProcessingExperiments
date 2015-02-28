
/*****************************************
 * Assignment #    #2
 * Name:         Baijie Lu (Siv)
 * E-mail:      blu@brynmawr.edu
 * Course:       CS 110 - 01
 * Submitted:    9/19/2012
 * 
 * The theme for my scatch is MONEY! The background is generated
by one-hundred dollar bills. Whenever key "a" is pressed, the background
would be changed randomly but still be filled with money. When key
"b" is pressed, a one-arm bandit will show up and a user could play
with it by pressing "b". When the user gets the same color for
the three blocks, a "congratulations" sign will show up. Last but
not least, when mouse is clicked, coins will show up randomly and 
their sizes depend on where you click the screen.
 ***********************************************/



PImage a;
float l = 90.0;
float w = 30.0;
PImage b;
PImage c;

//setup 
void setup() {
  size(800, 600);
  a = loadImage("US_hundred_dollar_bill.png");
  background(0);
}

//draw the dollar bills
void draw() {  
  while (l<180 && w<90 ) {

    image(a, (int)random(0, 600), (int)random(0, 400), l, w);
    l=l+3.5;
    w=w+2;
  }
}


void keyPressed() {
  switch(key)
  {
    //change the dollar bills on the background
  case 'a':
    background(0);
    tint(255);
    while (l>=170 || w>=80 ) {
      image(a, (int)random(0, 600), (int)random(0, 400), l, w);
      l=l-3.5;
      w=w-2;
      l=constrain (l, 60, 200);
      w=constrain (w, 20, 100);
    }
    break;

    //build a one arm bandit  
  case 'b':  
  tint(255);
    b=loadImage("one_arm_bandit.jpg");
    image(b, 150, 125, 500, 350);
    rectMode(CORNER);
    rect(250, 270, 95, 80);
    rect (353, 270, 95, 80);
    rect (458, 270, 95, 80);
    int x=(int)random(99999);
    int y=(int)random(999999);
    int z=(int)random(666666);

    if (x%3==0) {
      fill(255, 0, 0);
      rect(250, 270, 95, 80);
    }
    else if (x%3==1) {
      fill(0, 255, 0);
      rect(250, 270, 95, 80);
    }
    else if (x%3==2) {
      fill(0, 0, 255);
      rect(250, 270, 95, 80);
    }




    if (y%3==0) {
      fill(255, 0, 0);
      rect (353, 270, 95, 80);
    }
    else if (y%3==1) {
      fill(0, 255, 0);
      rect (353, 270, 95, 80);
    }
    else if (y%3==2) {
      fill(0, 0, 255);
      rect (353, 270, 95, 80);
    }



    if (z%3==0) {
      fill(255, 0, 0);
      rect (458, 270, 95, 80);
    }
    else if (z%3==1) {
      fill(0, 255, 0);
      rect (458, 270, 95, 80);
    }
    else if (z%3==2) {
      fill(0, 0, 255);
      rect (458, 270, 95, 80);
    }
    c=loadImage("cong.jpg");
    if (x%3==y%3 && y%3==z%3) {
      tint(255, 80);
      image(c, 200, 200, 400, 200);
    }
  }
}

// draw coins
void mousePressed() {
  float c =50.0;
  noStroke();
  ellipseMode(CENTER);
  rectMode(CENTER);

  if (mouseX>0 && mouseX<200) {
    c=c+5;
  }
  if (mouseX>200 && mouseX<400) {
    c=c-5;
  }
  if (mouseX>400 && mouseX<600) {
    c=c+10;
  }
  if (mouseX>600 && mouseX<=800) {
    c=c-10;
  }
  int count=0;
  while (count<3) {
    count++;
    float x=random(200);
    float y=random(200);

    fill(255, 221, 0);
    ellipse(mouseX+x, mouseY+y, c, c);
    fill(0);
    rect(mouseX+x, mouseY+y, c/3, c/3);
  }
}


