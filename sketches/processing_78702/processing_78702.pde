
/* Processing
 October 8th 2012
 Micaelee Hanson
 mhanson@ecuad.ca */

PFont font;// declare font


void setup() {
  size(600, 600); //set size of working area
  background (255); //set background colour to white
  smooth(); // smooth lines
  font = loadFont("GeezaPro-48.vlw"); //set font to Geeza Pro
  textFont(font); // set up font
}

void drawGreyArea() {
  fill(240); //fill dark grey circle area
  noStroke(); //no stroke around circle
  ellipse(width/2, height/2, 597, 597); // draw an ellipse
}

void setCirclesAccordingToHour() { //setup procedure to draw hour circles

  fill(191, 242, 164); //fill with green colour
  int m = minute(); // declare a variable of type integer named m and assign it the value minute
  int h = hour(); //declare a variable of type integer named h and assign it the value hour
  int r =50; //declare a variable of type integer named r and assign it the value 50-- set value for radius
  float w, n; // declare a variable of type float named w and n
  w= width; // assign the float named w the value of width
  n= height; // assign the float named n the value of height

    if (h==1 || h==13) { // if the hour is 1:00 or 13:00
    ellipse(w/2, n/2, r, r); //draw an ellipse
  }
  if (h==2|| h==14) { // if the hour is 2:00 or 14:00
    ellipse(w/2, n/2, r*2, r*2);//draw an ellipse
  }
  if (h==3|| h==15) { // if the hour is 3:00 or 15:00
    ellipse(w/2, n/2, r*3, r*3);//draw an ellipse
  }
  if (h==4|| h==16) {// if the hour is 4:00 or 16:00
    ellipse(w/2, n/2, r*4, r*4);//draw an ellipse
  }
  if (h==5|| h==17) { // if the hour is 5:00 or 17:00
    ellipse(w/2, n/2, r*5, r*5);//draw an ellipse
  }
  if (h==6|| h==18) { // if the hour is 6:00 or 18:00
    ellipse(w/2, n/2, r*6, r*6);//draw an ellipse
  }
  if (h==7|| h==19) { // if the hour is 7:00 or 19:00
    ellipse(w/2, n/2, r*7, r*7);//draw an ellipse
  }
  if (h==8|| h==20) { // if the hour is 8:00 or 20:00
    ellipse(w/2, n/2, r*8, r*8);//draw an ellipse
  }
  if ( h==9|| h==21) { // if the hour is 9:00 or 21:00
    ellipse(w/2, n/2, r*9, r*9);//draw an ellipse
  }
  if (h==10|| h==22) { // if the hour is 10:00 or 22:00
    ellipse(w/2, n/2, r*10, r*10);//draw an ellipse
  }
  if (h==11|| h==23) { // if the hour is 11:00 or 23:00
    ellipse(w/2, n/2, r*11, r*11);//draw an ellipse
  }
  if (h==12|| h==24) { // if the hour is 12:00 or 24:00
    ellipse(w/2, n/2, r*12, r*12);//draw an ellipse
  }
}

void drawMinuteHand() { //setup procedure for how the minutes will be displayed
  strokeCap(SQUARE); //square Cap on the end of the arc
  strokeWeight(20); // adjust the width of the line
  stroke(252, 74, 101); // change the colour to pink/red
  hand(new PVector(width/2, height/2), 160, radians(minute()*6)); //adjust where minutes will be displayed
}

void hand(PVector loc, float radius, float angle) {// setup a procedure-- minutes will be displayed in different circles depending on the hour
  int h = hour(); // declare a variable of type integer named h and assign it the value of hour
  float w, n;// declare a variable of type float named w and n
  w= width; // assign the float named w the value of width
  n= height; // assign the float named n the value of height

    if ( h==1||h==13) { // if the hour is 1:00 or 13:00
    arc(w/2, n/2, 25, 25, -PI/2, angle-PI/2); //draw an arc
  }
  if (h==2||h==14) { // if the hour is 2:00 or 14:00
    arc(w/2, n/2, 75, 75, -PI/2, angle-PI/2); //draw an arc
  }
  if (h==3||h==15) { // if the hour is 3:00 or 15:00
    arc(w/2, n/2, 125, 125, -PI/2, angle-PI/2); //draw an arc
  }

  if (h==4||h==16) { // if the hour is 4:00 or 16:00
    arc(w/2, n/2, 175, 175, -PI/2, angle-PI/2); //draw an arc
  }

  if (h==5||h==17) { // if the hour is 5:00 or 17:00
    arc(w/2, n/2, 225, 225, -PI/2, angle-PI/2);//draw an arc
  }

  if (h==6||h==18) { // if the hour is 6:00 or 18:00
    arc(w/2, n/2, 275, 275, -PI/2, angle-PI/2);//draw an arc
  }

  if (h==7||h==19) { // if the hour is 7:00 or 19:00
    arc(w/2, n/2, 325, 325, -PI/2, angle-PI/2);//draw an arc
  }

  if (h==8||h==20) { // if the hour is 8:00 or 20:00
    arc(w/2, n/2, 375, 375, -PI/2, angle-PI/2);//draw an arc
  }

  if (h==9||h==21) {// if the hour is 9:00 or 21:00
    arc(w/2, n/2, 425, 425, -PI/2, angle-PI/2);//draw an arc
  }

  if (h==10||h==22) { // if the hour is 10:00 or 22:00
    arc(w/2, n/2, 475, 475, -PI/2, angle-PI/2);//draw an arc
  }

  if (h==11||h==23) { // if the hour is 11:00 or 23:00
    arc(w/2, n/2, 525, 525, -PI/2, angle-PI/2);//draw an arc
  }

  if (h==12||h==24) { // if the hour is 12:00 or 24:00
    arc(w/2, n/2, 575, 575, -PI/2, angle-PI/2);//draw an arc
  }
}


void whiteOutline() { //setup a procedure to draw the white circle outlines
  int w= width; //declare a variable of type integer named w and assign it the value of width
  while (w>0) { // while the width is greater than zero
    strokeWeight(5); //weight of the white line
    stroke(255); //white color for lines
    noFill(); //don't fill in the background area with colour
    ellipse(width/2, height/2, w, w);// draw ellipses
    w=w-50; // repeat every 50 pixels
  }
}

void drawMonth() {
  int m = month();  //declare a variable of type integer named m and assign it the value of month
  float a, b; // declare variables of type float named a and b
  a= 50;// assign float a the value of 50
  b=50;// assign float b the value of 50
  fill(240);// fill with light grey
  noStroke(); //do not draw an outline 
  strokeWeight(1); //think stroke
  smooth();//smooth shapes
  textAlign(CENTER);// allign text to center
  textSize(20);//change text size
  ellipse(a, b, 95, 95);//draw an ellipse
  fill(169, 232, 240);// fill with light blue colour
  if (m>=1) {// if the month is january
    arc(a, b, 95, 95, 3*PI/2, 5*PI/3); //draw an arc
  }
  if (m==1) {// if it is january
    fill(0);//change text colour to black
    text("January", 50, 55);//write the word january
  }
  if (m>=2) { // if the month is february
    fill(169, 232, 240);// fill with light blue colour
    arc(a, b, 95, 95, 5*PI/3, 11*PI/6);//draw an arc
  }
  if (m==2) {// if it is February
    fill(0); //change text to black
    text("February", 50, 55);//write February
  }
  if (m>=3) { // if the month is march
    fill(169, 232, 240);// fill with light blue colour
    arc(a, b, 95, 95, 11*PI/6, 2*PI);//draw an arc
  }
  if (m==3) {//if it is march
    fill(0); //change text to black
    text("March", 50, 55);//write the word March
  }
  if (m>=4) {// if the month is april
    fill(169, 232, 240);// fill with light blue colour
    arc(a, b, 95, 95, 0, PI/6);//draw an arc
  } 
  if (m==4) { // if the month is april
    fill(0); //change text to black
    text("April", 50, 55);//write the word april
  }
  if (m>=5) {// if the month is may
    fill(169, 232, 240);// fill with light blue colour
    arc(a, b, 95, 95, PI/6, PI/3);//draw an arc
  }
  if (m==5) {// if the month is may
    fill(0); //change text to black
    text("May", 50, 55);//write the word may
  }
  if (m>=6) {// if the month is june
    fill(169, 232, 240);// fill with light blue colour
    arc(a, b, 95, 95, PI/3, PI/2);//draw an arc
  }
  if (m==6) {//if the month is june
    fill(0); //change text to black
    text("June", 50, 55);//write the word june
  }
  if (m>=7) {// if the month is july
    fill(169, 232, 240);// fill with light blue colour
    arc(a, b, 95, 95, PI/2, 2*PI/3);//draw an arc
  }
  if (m==7) {// if the month is July
    fill(0); //change text to black
    text("July", 50, 55);//write the word july
  }
  if (m>=8) {// if the month is august
    fill(169, 232, 240);// fill with light blue colour
    arc(a, b, 95, 95, 2*PI/3, 5*PI/6);//draw an arc
  }
  if (m==8) {// if the month is august
    fill(0); //change text to black
    text("August", 50, 55);//write the word august
  }
  if (m>=9) {// if the month is september
    fill(169, 232, 240);// fill with light blue colour
    arc(a, b, 95, 95, 5*PI/6, PI);//draw an arc
  }
  if (m==9) {// if the month is september
    fill(0); //change text to black
    text("September", 50, 55);//write the word september
  }
  if (m>=10) {// if the month is october
    fill(169, 232, 240);// fill with light blue colour
    arc(a, b, 95, 95, PI, 7*PI/6);//draw an arc
  }
  if (m==10) {// if the month is october
    fill(0); //change text to black
    text("October", 50, 55);//write the word september
  }
  if (m>=11) {// if the month is november
    fill(169, 232, 240);// fill with light blue colour
    arc(a, b, 95, 95, 7*PI/6, 4*PI/3);//draw an arc
  }
  if (m==11) {// if the month is november
    fill(0); //change text to black
    text("November", 50, 55);//write the word november
  }
  if (m>=12) {// if the month is december
    fill(169, 232, 240);// fill with light blue colour
    arc(a, b, 95, 95, 4*PI/3, 3*PI/2);//draw an arc
  }
  if (m==12) {// if the month is december
    fill(0); //change text to black
    text("December", 50, 55);//write the word december
  }
  textSize(10);//change size of text
  fill(0);//black text
  text("Month", 50, 65);// write the word month
}

void writeDay() {
  fill(240);//fill with grey
  ellipse(550, 50, 95, 95);//draw an ellipse
  int d= day();// declare a variable of type integer named d and assign it the value of the day
  fill(0); // fill with black
  textAlign(CENTER);// allign text to the center
  textSize(30);//change text size
  text(d, 550, 60); // write the number of the day on the top right corner
  textSize(10);//change text size
  text("Day", 550, 70);//write the word day
}

void writeYear() {
  fill(240);//fill with grey 
  ellipse(50, 550, 95, 95);//draw an ellipse
  smooth();//smooth lines
  int i= year();// declare a variable of type integer named i and assign it the value of year
  fill(0); //fill with black
  textSize(30);//change size of text
  textAlign(CENTER);// align the text to the center
  text(i, 50, 560);// write the year
  textSize(10);//change size of text
  text("Year", 50, 570);// write the word year
}

void drawSeason() {
  int m= month();// declare a variable of type integer named m and assign it the value of month
  float a, b;// declare a variable of type float named a and b
  a=550;// assign float a the value of 550
  b=550;// assign float b the value of 550
  fill(240);// fill with grey
  noStroke();//no outline
  smooth();//smooth lines
  ellipse(a, b, 95, 95);//draw an ellipse

  if (m==12 || m<=2) { //winter months-- if its dec, jan/ feb
    fill(167, 200, 255);// fill with blue
    arc(a, b, 95, 95, 3*PI/2, 2*PI);//draw an art
    textSize(20);// change size of text
    fill(0);//change the text colour to black
    textAlign(CENTER);// align the text to the center
    text("Winter", 550, 552);// write the word winter
  }
  if (m>=3 && m<=5) { //spring months--march/april/may
    fill(254, 255, 57);// fill with yellow
    arc(a, b, 95, 95, 2*PI, PI/2);//draw an arc
    textSize(20);// change the text size
    fill(0);// change the text colour to black
    textAlign(CENTER);// align the text to the center
    text("Spring", 550, 552);// write the word spring
  }

  if (m>=6 && m<=8) { //summer months -- if it's june, july/aug
    fill(255, 250, 149); //fill with light yellow
    arc(a, b, 95, 95, PI/2, PI);// draw an art
    textSize(20);//change the text size
    fill(0);//change text colour to black
    textAlign(CENTER);// align the text to the center
    text("Summer", 550, 560);//write the word summer
  }
  if (m>=9 && m<=11) { //fall months-- if it's sept/oct/nov
    fill(245, 90, 59);//fill with orange
    arc(a, b, 95, 95, PI, 3*PI/2);//draw an arc
    textSize(30);// change the text size
    fill(0);//make text black
    textAlign(CENTER);//align the text to the center
    text("Fall", 550, 560);// write the word fall
  }
  
  textSize(10);//change text size
  fill(0);//make text black
  textAlign(CENTER);// align the text to the center
  text("Season", 550, 570);//write the word season
}


void draw() { 
  drawGreyArea(); //draw the procedure that makes the grey area
  setCirclesAccordingToHour(); // draw the procedure that draws the green circles according to the hour
  whiteOutline();// draw the procedure that makes the white outlines
  drawMinuteHand();// draw the procedure that controls the minute hand 
  drawMonth();//draw the procedure that shows the month
  writeDay(); //draw the procedure that writes the day
  writeYear();//draw the procedure that writes the year
  drawSeason();//draw the procedure that draws the season
}



