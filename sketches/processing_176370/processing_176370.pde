
/* @pjs font="RobotoCondensed-Light.ttf, RobotoCondensed-Regular.ttf, RobotoCondensed-Bold.ttf" ; */

String average = "5,1,0,0,0,0,0,1,1,2,1,2,2,3,4,2,4,6,4,4,5,4,4,3";
String sunday = "4,0,1,0,0,0,0,0,0,0,0,2,0,3,8,4,5,10,7,10,11,8,7,6";
String monday = "10,0,0,0,0,1,2,4,2,1,3,5,4,2,4,4,6,7,6,2,2,4,6,5";
String tuesday = "5,0,0,0,0,0,1,4,3,2,2,2,3,8,5,2,8,9,6,7,4,4,3,2";
String wednesday = "4,2,0,0,0,0,0,0,0,3,1,2,3,5,2,2,4,2,1,1,3,3,3,4";
String thursday = "5,7,0,0,0,0,0,0,3,8,6,2,1,2,6,1,4,6,3,4,4,2,2,2";
String friday = "4,1,0,0,0,0,0,0,0,2,1,2,3,2,0,3,3,7,2,5,2,2,2,5";
String saturday = "4,2,1,0,0,0,0,0,0,0,0,1,2,3,4,4,4,7,3,2,6,6,5,3";

PFont robotolight;
PFont robotoregular;
PFont robotobold;
int number = 23;
int[] averageList = int(split(average, ','));
int[] sundayList = int(split(sunday, ','));
int[] mondayList = int(split(monday, ','));
int[] tuesdayList = int(split(tuesday, ','));
int[] wednesdayList = int(split(wednesday, ','));
int[] thursdayList = int(split(thursday, ','));
int[] fridayList = int(split(friday, ','));
int[] saturdayList = int(split(saturday, ','));
int averageSum = 0;
int sundaySum = 0;
int mondaySum = 0;
int tuesdaySum = 0;
int wednesdaySum = 0;
int thursdaySum = 0;
int fridaySum = 0;
int saturdaySum = 0;
float startX = 145;
float startY = 303;
int myColor1 = #F5624D;
int myColor2 = #34A65F;
int myColor3 = #346F7F;
int phoneColor = #181818;
int textColor = #555555;
int myState = 0;

void setup() {

  size(750, 400);
  robotolight = createFont("RobotoCondensed-Light.ttf", 30);
  robotoregular = createFont("RobotoCondensed-Regular.ttf", 30);
  robotobold = createFont("RobotoCondensed-Bold.ttf", 30);


  //sunday

  for (int i = 0; i < sundayList.length; i++) {
    sundaySum = sundaySum + sundayList[i];
  }

  println(sundaySum);

  //monday

  for (int i = 0; i < mondayList.length; i++) {
    mondaySum = mondaySum + mondayList[i];
  }

  println(mondaySum);

  //tuesday

  for (int i = 0; i < tuesdayList.length; i++) {
    tuesdaySum = tuesdaySum + tuesdayList[i];
  }

  println(tuesdaySum);

  //wednesday

  for (int i = 0; i < wednesdayList.length; i++) {
    wednesdaySum = wednesdaySum + wednesdayList[i];
  }

  println(wednesdaySum);

  //thursday

  for (int i = 0; i < thursdayList.length; i++) {
    thursdaySum = thursdaySum + thursdayList[i];
  }

  println(thursdaySum);

  //friday

  for (int i = 0; i < fridayList.length; i++) {
    fridaySum = fridaySum + fridayList[i];
  }

  println(fridaySum);

  //saturday

  for (int i = 0; i < saturdayList.length; i++) {
    saturdaySum = saturdaySum + saturdayList[i];
  }

  println(saturdaySum);
  
  //average

  for (int i = 0; i < averageList.length; i++) {
    averageSum = averageSum + averageList[i];
  }

  //side buttons
  
  noStroke();
  fill(#454545);
  rect(125, height-30, 50, 10, 2);
  rect(200, height-30, 40, 10, 7);
  rect(270, height-30, 40, 10, 7);
  rect(20, 80, 50, 60, 2);
  
  //phone
  
  noStroke();
  fill(phoneColor);
  ellipse(75, 75, 100, 100);
  ellipse(75, height-75, 100, 100);
  ellipse(width-75, 75, 100, 100);
  ellipse(width-75, height-75, 100, 100);
  rect(25, 75, 100, height-150);
  rect(width-125, 75, 100, height-150);
  rect(75, 25, width-150, 100);
  rect(75, height-125, width-150, 100);
  rect(75, 75, width-150, height-150);
  
  //front features
  
  fill(phoneColor);
  stroke(#454545);
  ellipse(width-77, height/2, 60, 60);
  stroke(#999999);
  strokeWeight(3);
  rect(width-87, height/2-10, 20, 20, 5);
  stroke(#454545);
  fill(#999999);
  rect(75, height/2-35, 10, 70, 10);
  noStroke();
  fill(#454545);
  ellipse(80, height/2+60, 17, 17);
  fill(#000000);
  ellipse(80, height/2+60, 5, 5);
  
}

void draw() {

  textSize(30);
  
  
  switch(myState) {
    
  case 0:
  //title
  
  //screen
  
  fill(#f5f5f5);
  rect(125, 50, width-250, height-100);
  
  textFont(robotobold, 60);
  fill(myColor1);
  textAlign(CENTER);
  text("Mobile Addiction", width/2, 190);
  
  textFont(robotolight, 25);
  fill(textColor);
  text("or, 'How I Learned to Stop Worrying and", width/2, 225);
  text("Love My Cell Phone'", width/2, 255);
  
  break;
  
  case 1:
  //numbers
  
  //screen
  
  fill(#f5f5f5);
  rect(125, 50, width-250, height-100);
  
  textAlign(CENTER);
  textFont(robotolight, 20);
  fill(textColor);
  text("Throughout 1 week,", width/2-100, 105);
  text("I checked my phone", width/2-100, 130);
  textFont(robotobold, 130);
  fill(myColor2);
  text("58", width/2-100, 245);
  textFont(robotolight, 20);
  fill(textColor);
  text("times per day", width/2-100, 280);
  text("on average.", width/2-100, 305);
  
  textFont(robotolight, 20);
  fill(textColor);
  text("On Sunday, I", width/2+100, 105);
  text("checked it", width/2+100, 130);
  textFont(robotobold, 130);
  fill(myColor2);
  text("86", width/2+100, 245);
  textFont(robotolight, 20);
  fill(textColor);
  text("times. This was", width/2+100, 280);
  text("my week high.", width/2+100, 305);
  
  break;
    
  case 2:
  //average
  
  //screen
  
  fill(#f5f5f5);
  rect(125, 50, width-250, height-100);
  
  //text
  
  textFont(robotolight);
  fill(#333333);
  textSize(15);
  text("Midnight", 170, 332);  
  text("Midnight", width-172, 332);   
  textAlign(CENTER);
  text("Noon", width/2, 332);
  
  fill(myColor3);
  noStroke();
  beginShape();
  vertex(startX, startY);
  vertex(startX, startY - averageList[0]*20);
  vertex(startX+20, startY - averageList[1]*20);
  vertex(startX+40, startY - averageList[2]*20);
  vertex(startX+60, startY - averageList[3]*20);
  vertex(startX+80, startY - averageList[4]*20);
  vertex(startX+100, startY - averageList[5]*20);
  vertex(startX+120, startY - averageList[6]*20);
  vertex(startX+140, startY - averageList[7]*20);
  vertex(startX+160, startY - averageList[8]*20);
  vertex(startX+180, startY - averageList[9]*20);
  vertex(startX+200, startY - averageList[10]*20);
  vertex(startX+220, startY - averageList[11]*20);
  vertex(startX+240, startY - averageList[12]*20);
  vertex(startX+260, startY - averageList[13]*20);
  vertex(startX+280, startY - averageList[14]*20);
  vertex(startX+300, startY - averageList[15]*20);
  vertex(startX+320, startY - averageList[16]*20);
  vertex(startX+340, startY - averageList[17]*20);
  vertex(startX+360, startY - averageList[18]*20);
  vertex(startX+380, startY - averageList[19]*20);
  vertex(startX+400, startY - averageList[20]*20);
  vertex(startX+420, startY - averageList[21]*20);
  vertex(startX+440, startY - averageList[22]*20);
  vertex(startX+460, startY - averageList[23]*20);
  vertex(startX+460, startY);
  vertex(startX, startY);
  endShape();
  fill(#333333);
  textAlign(CENTER);
  textFont(robotobold, 30);
  text("Average Day", width/2, startY-205);
  break;
    
  case 3:
  //sunday
  
  //screen
  
  fill(#f5f5f5);
  rect(125, 50, width-250, height-100);
  
  //text
  
  textFont(robotolight);
  fill(#333333);
  textSize(15);
  text("Midnight", 170, 332);  
  text("Midnight", width-172, 332);   
  textAlign(CENTER);
  text("Noon", width/2, 332);
  
  fill(myColor1);
  noStroke();
  beginShape();
  vertex(startX, startY);
  vertex(startX, startY - sundayList[0]*20);
  vertex(startX+20, startY - sundayList[1]*20);
  vertex(startX+40, startY - sundayList[2]*20);
  vertex(startX+60, startY - sundayList[3]*20);
  vertex(startX+80, startY - sundayList[4]*20);
  vertex(startX+100, startY - sundayList[5]*20);
  vertex(startX+120, startY - sundayList[6]*20);
  vertex(startX+140, startY - sundayList[7]*20);
  vertex(startX+160, startY - sundayList[8]*20);
  vertex(startX+180, startY - sundayList[9]*20);
  vertex(startX+200, startY - sundayList[10]*20);
  vertex(startX+220, startY - sundayList[11]*20);
  vertex(startX+240, startY - sundayList[12]*20);
  vertex(startX+260, startY - sundayList[13]*20);
  vertex(startX+280, startY - sundayList[14]*20);
  vertex(startX+300, startY - sundayList[15]*20);
  vertex(startX+320, startY - sundayList[16]*20);
  vertex(startX+340, startY - sundayList[17]*20);
  vertex(startX+360, startY - sundayList[18]*20);
  vertex(startX+380, startY - sundayList[19]*20);
  vertex(startX+400, startY - sundayList[20]*20);
  vertex(startX+420, startY - sundayList[21]*20);
  vertex(startX+440, startY - sundayList[22]*20);
  vertex(startX+460, startY - sundayList[23]*20);
  vertex(startX+460, startY);
  vertex(startX, startY);
  endShape();
  fill(#333333);
  textAlign(CENTER);
  textFont(robotobold, 30);
  text("Sunday", width/2, startY-205);
  break;
  
  case 4:
  //monday
  
  //screen
  
  fill(#f5f5f5);
  rect(125, 50, width-250, height-100);
  
  //text
  
  textFont(robotolight);
  fill(#333333);
  textSize(15);
  text("Midnight", 170, 332);  
  text("Midnight", width-172, 332);   
  textAlign(CENTER);
  text("Noon", width/2, 332);
  
  fill(myColor2);
  noStroke();
  beginShape();
  vertex(startX, startY);
  vertex(startX, startY - mondayList[0]*20);
  vertex(startX+20, startY - mondayList[1]*20);
  vertex(startX+40, startY - mondayList[2]*20);
  vertex(startX+60, startY - mondayList[3]*20);
  vertex(startX+80, startY - mondayList[4]*20);
  vertex(startX+100, startY - mondayList[5]*20);
  vertex(startX+120, startY - mondayList[6]*20);
  vertex(startX+140, startY - mondayList[7]*20);
  vertex(startX+160, startY - mondayList[8]*20);
  vertex(startX+180, startY - mondayList[9]*20);
  vertex(startX+200, startY - mondayList[10]*20);
  vertex(startX+220, startY - mondayList[11]*20);
  vertex(startX+240, startY - mondayList[12]*20);
  vertex(startX+260, startY - mondayList[13]*20);
  vertex(startX+280, startY - mondayList[14]*20);
  vertex(startX+300, startY - mondayList[15]*20);
  vertex(startX+320, startY - mondayList[16]*20);
  vertex(startX+340, startY - mondayList[17]*20);
  vertex(startX+360, startY - mondayList[18]*20);
  vertex(startX+380, startY - mondayList[19]*20);
  vertex(startX+400, startY - mondayList[20]*20);
  vertex(startX+420, startY - mondayList[21]*20);
  vertex(startX+440, startY - mondayList[22]*20);
  vertex(startX+460, startY - mondayList[23]*20);
  vertex(startX+460, startY);
  vertex(startX, startY);
  endShape();
  fill(#333333);
  textAlign(CENTER);
  textFont(robotobold, 30);
  text("Monday", width/2, startY-205);
  break;
  
  case 5:
  //tuesday
  
  //screen
  
  fill(#f5f5f5);
  rect(125, 50, width-250, height-100);
  
  //text
  
  textFont(robotolight);
  fill(#333333);
  textSize(15);
  text("Midnight", 170, 332);  
  text("Midnight", width-172, 332);   
  textAlign(CENTER);
  text("Noon", width/2, 332);
  
  fill(myColor3);
  noStroke();
  beginShape();
  vertex(startX, startY);
  vertex(startX, startY - tuesdayList[0]*20);
  vertex(startX+20, startY - tuesdayList[1]*20);
  vertex(startX+40, startY - tuesdayList[2]*20);
  vertex(startX+60, startY - tuesdayList[3]*20);
  vertex(startX+80, startY - tuesdayList[4]*20);
  vertex(startX+100, startY - tuesdayList[5]*20);
  vertex(startX+120, startY - tuesdayList[6]*20);
  vertex(startX+140, startY - tuesdayList[7]*20);
  vertex(startX+160, startY - tuesdayList[8]*20);
  vertex(startX+180, startY - tuesdayList[9]*20);
  vertex(startX+200, startY - tuesdayList[10]*20);
  vertex(startX+220, startY - tuesdayList[11]*20);
  vertex(startX+240, startY - tuesdayList[12]*20);
  vertex(startX+260, startY - tuesdayList[13]*20);
  vertex(startX+280, startY - tuesdayList[14]*20);
  vertex(startX+300, startY - tuesdayList[15]*20);
  vertex(startX+320, startY - tuesdayList[16]*20);
  vertex(startX+340, startY - tuesdayList[17]*20);
  vertex(startX+360, startY - tuesdayList[18]*20);
  vertex(startX+380, startY - tuesdayList[19]*20);
  vertex(startX+400, startY - tuesdayList[20]*20);
  vertex(startX+420, startY - tuesdayList[21]*20);
  vertex(startX+440, startY - tuesdayList[22]*20);
  vertex(startX+460, startY - tuesdayList[23]*20);
  vertex(startX+460, startY);
  vertex(startX, startY);
  endShape();
  fill(#333333);
  textAlign(CENTER);
  textFont(robotobold, 30);
  text("Tuesday", width/2, startY-205);
  break;
  
  case 6:
  //wednesday
  
  //screen
  
  fill(#f5f5f5);
  rect(125, 50, width-250, height-100);
  
  //text
  
  textFont(robotolight);
  fill(#333333);
  textSize(15);
  text("Midnight", 170, 332);  
  text("Midnight", width-172, 332);   
  textAlign(CENTER);
  text("Noon", width/2, 332);
  
  fill(myColor1);
  noStroke();
  beginShape();
  vertex(startX, startY);
  vertex(startX, startY - wednesdayList[0]*20);
  vertex(startX+20, startY - wednesdayList[1]*20);
  vertex(startX+40, startY - wednesdayList[2]*20);
  vertex(startX+60, startY - wednesdayList[3]*20);
  vertex(startX+80, startY - wednesdayList[4]*20);
  vertex(startX+100, startY - wednesdayList[5]*20);
  vertex(startX+120, startY - wednesdayList[6]*20);
  vertex(startX+140, startY - wednesdayList[7]*20);
  vertex(startX+160, startY - wednesdayList[8]*20);
  vertex(startX+180, startY - wednesdayList[9]*20);
  vertex(startX+200, startY - wednesdayList[10]*20);
  vertex(startX+220, startY - wednesdayList[11]*20);
  vertex(startX+240, startY - wednesdayList[12]*20);
  vertex(startX+260, startY - wednesdayList[13]*20);
  vertex(startX+280, startY - wednesdayList[14]*20);
  vertex(startX+300, startY - wednesdayList[15]*20);
  vertex(startX+320, startY - wednesdayList[16]*20);
  vertex(startX+340, startY - wednesdayList[17]*20);
  vertex(startX+360, startY - wednesdayList[18]*20);
  vertex(startX+380, startY - wednesdayList[19]*20);
  vertex(startX+400, startY - wednesdayList[20]*20);
  vertex(startX+420, startY - wednesdayList[21]*20);
  vertex(startX+440, startY - wednesdayList[22]*20);
  vertex(startX+460, startY - wednesdayList[23]*20);
  vertex(startX+460, startY);
  vertex(startX, startY);
  endShape();
  fill(#333333);
  textAlign(CENTER);
  textFont(robotobold, 30);
  text("Wednesday", width/2, startY-205);
  break;
  
  case 7:
  //thursday
  
  //screen
  
  fill(#f5f5f5);
  rect(125, 50, width-250, height-100);
  
  //text
  
  textFont(robotolight);
  fill(#333333);
  textSize(15);
  text("Midnight", 170, 332);  
  text("Midnight", width-172, 332);   
  textAlign(CENTER);
  text("Noon", width/2, 332);
  
  fill(myColor2);
  noStroke();
  beginShape();
  vertex(startX, startY);
  vertex(startX, startY - thursdayList[0]*20);
  vertex(startX+20, startY - thursdayList[1]*20);
  vertex(startX+40, startY - thursdayList[2]*20);
  vertex(startX+60, startY - thursdayList[3]*20);
  vertex(startX+80, startY - thursdayList[4]*20);
  vertex(startX+100, startY - thursdayList[5]*20);
  vertex(startX+120, startY - thursdayList[6]*20);
  vertex(startX+140, startY - thursdayList[7]*20);
  vertex(startX+160, startY - thursdayList[8]*20);
  vertex(startX+180, startY - thursdayList[9]*20);
  vertex(startX+200, startY - thursdayList[10]*20);
  vertex(startX+220, startY - thursdayList[11]*20);
  vertex(startX+240, startY - thursdayList[12]*20);
  vertex(startX+260, startY - thursdayList[13]*20);
  vertex(startX+280, startY - thursdayList[14]*20);
  vertex(startX+300, startY - thursdayList[15]*20);
  vertex(startX+320, startY - thursdayList[16]*20);
  vertex(startX+340, startY - thursdayList[17]*20);
  vertex(startX+360, startY - thursdayList[18]*20);
  vertex(startX+380, startY - thursdayList[19]*20);
  vertex(startX+400, startY - thursdayList[20]*20);
  vertex(startX+420, startY - thursdayList[21]*20);
  vertex(startX+440, startY - thursdayList[22]*20);
  vertex(startX+460, startY - thursdayList[23]*20);
  vertex(startX+460, startY);
  vertex(startX, startY);
  endShape();
  fill(#333333);
  textAlign(CENTER);
  textFont(robotobold, 30);
  text("Thursday", width/2, startY-205);
  break;
  
  case 8:
  //friday
  
  //screen
  
  fill(#f5f5f5);
  rect(125, 50, width-250, height-100);
  
  //text
  
  textFont(robotolight);
  fill(#333333);
  textSize(15);
  text("Midnight", 170, 332);  
  text("Midnight", width-172, 332);   
  textAlign(CENTER);
  text("Noon", width/2, 332);
  
  fill(myColor3);
  noStroke();
  beginShape();
  vertex(startX, startY);
  vertex(startX, startY - fridayList[0]*20);
  vertex(startX+20, startY - fridayList[1]*20);
  vertex(startX+40, startY - fridayList[2]*20);
  vertex(startX+60, startY - fridayList[3]*20);
  vertex(startX+80, startY - fridayList[4]*20);
  vertex(startX+100, startY - fridayList[5]*20);
  vertex(startX+120, startY - fridayList[6]*20);
  vertex(startX+140, startY - fridayList[7]*20);
  vertex(startX+160, startY - fridayList[8]*20);
  vertex(startX+180, startY - fridayList[9]*20);
  vertex(startX+200, startY - fridayList[10]*20);
  vertex(startX+220, startY - fridayList[11]*20);
  vertex(startX+240, startY - fridayList[12]*20);
  vertex(startX+260, startY - fridayList[13]*20);
  vertex(startX+280, startY - fridayList[14]*20);
  vertex(startX+300, startY - fridayList[15]*20);
  vertex(startX+320, startY - fridayList[16]*20);
  vertex(startX+340, startY - fridayList[17]*20);
  vertex(startX+360, startY - fridayList[18]*20);
  vertex(startX+380, startY - fridayList[19]*20);
  vertex(startX+400, startY - fridayList[20]*20);
  vertex(startX+420, startY - fridayList[21]*20);
  vertex(startX+440, startY - fridayList[22]*20);
  vertex(startX+460, startY - fridayList[23]*20);
  vertex(startX+460, startY);
  vertex(startX, startY);
  endShape();
  fill(#333333);
  textAlign(CENTER);
  textFont(robotobold, 30);
  text("Friday", width/2, startY-205);
  break;
  
  case 9:
  //saturday
  
  //screen
  
  fill(#f5f5f5);
  rect(125, 50, width-250, height-100);
  
  //text
  
  textFont(robotolight);
  fill(#333333);
  textSize(15);
  text("Midnight", 170, 332);  
  text("Midnight", width-172, 332);   
  textAlign(CENTER);
  text("Noon", width/2, 332);
  
  fill(myColor1);
  noStroke();
  beginShape();
  vertex(startX, startY);
  vertex(startX, startY - saturdayList[0]*20);
  vertex(startX+20, startY - saturdayList[1]*20);
  vertex(startX+40, startY - saturdayList[2]*20);
  vertex(startX+60, startY - saturdayList[3]*20);
  vertex(startX+80, startY - saturdayList[4]*20);
  vertex(startX+100, startY - saturdayList[5]*20);
  vertex(startX+120, startY - saturdayList[6]*20);
  vertex(startX+140, startY - saturdayList[7]*20);
  vertex(startX+160, startY - saturdayList[8]*20);
  vertex(startX+180, startY - saturdayList[9]*20);
  vertex(startX+200, startY - saturdayList[10]*20);
  vertex(startX+220, startY - saturdayList[11]*20);
  vertex(startX+240, startY - saturdayList[12]*20);
  vertex(startX+260, startY - saturdayList[13]*20);
  vertex(startX+280, startY - saturdayList[14]*20);
  vertex(startX+300, startY - saturdayList[15]*20);
  vertex(startX+320, startY - saturdayList[16]*20);
  vertex(startX+340, startY - saturdayList[17]*20);
  vertex(startX+360, startY - saturdayList[18]*20);
  vertex(startX+380, startY - saturdayList[19]*20);
  vertex(startX+400, startY - saturdayList[20]*20);
  vertex(startX+420, startY - saturdayList[21]*20);
  vertex(startX+440, startY - saturdayList[22]*20);
  vertex(startX+460, startY - saturdayList[23]*20);
  vertex(startX+460, startY);
  vertex(startX, startY);
  endShape();
  fill(#333333);
  textAlign(CENTER);
  textFont(robotobold, 30);
  text("Saturday", width/2, startY-205);
  break;
  
  case 10:
  //end
  
  //screen
  
  fill(#f5f5f5);
  rect(125, 50, width-250, height-100);
  
  fill(#333333);
  textAlign(CENTER);
  textFont(robotobold, 30);
  text("In Conclusion:", width/2, startY-205);
  
  textAlign(LEFT);
  textFont(robotolight, 20);
  text("Today's young adults spend the majority of their work", 180, 145);
  text("shifts sending and receiving snapchat selfies", 180, 170);
  
  ellipse(170, 138, 5, 5);
  
  text("If you want someone to stop scrolling through news", 180, 220);
  text("feeds, put a plate of food in front of them", 180, 245);
  
  ellipse(170, 213, 5, 5);
  
  text("The only cure to mobile addiction is being in the", 180, 295);
  text("immediate vicinity of your girlfriend", 180, 320);
  
  ellipse(170, 288, 5, 5);

  
  break;
  }
}

void mousePressed() {
  
  myState = (myState+1) % 11;
  
}




