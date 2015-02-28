
float c1x, c1y, c2xNoResponse, c2yNoResponse, c2xNotEmploying, c2yNotEmploying, c2xInterviews, c2yInterviews, c2xTNoResponse, c2yTNoResponse, c2xTNotEmploying, c2yTNotEmploying, c2xTInterviews, c2yTInterviews, interviewsDeclinedAngle, interviewsNoAngle, interviewsNoResponseAngle;
int radius, radius2;
float arcAngle1, arcAngle4;
float angleInRadians, angleInDegrees, angleInRadians2, angleInDegrees2;
float averageAngleNoResponse, averageAngleNotEmploying, averageAngleInterviews ;
boolean c2Interviews, c2NoResponse, c2NotEmploying, c2InterviewsDeclined, c2InterviewsNo, c2InterviewsNoResponse = false;

float numNoResponse = 23;
float numNotEmploying = 3;    
float numInterviews = 5;   
float numInterviewsNo = 2;
float numInterviewsNoResponse = 2;
float numInterviewsDeclined = 1;

float totalFirms = (numNoResponse+numNotEmploying+numInterviews); 
float degPerFirm =360/(numNoResponse+numNotEmploying+numInterviews);
float arcAngle2 = degPerFirm*numNoResponse;
float arcAngle3 = (arcAngle2+(degPerFirm*numNotEmploying));

String firmsNoResponse = "10 DESIGN, KPF, TFP, OVAL, FOSTERS, ROCCO, RONALDLU, RAD, IDA, NBBJ,CHUNGWANNAN, HLW, LDASIA, PDPEAST, PHILIPLIAO, COMPASS, YI&ASSOC, SENIORMAN, UNSTUDIO, RSH+P, TRAHAN, GRAVITY";
String firmsNotEmploying = "RMJM, AEDAS, ARQUITECTONICA";
String firmsInterviews = "OMA, HEAD, LWK, DAVIDCLOVERS, CL3";
String firmsInterviewsNo = "OMA, HEAD";
String firmsInterviewsNoResponse = "CL3, LWK";
String firmsInterviewsDeclined = "DAVIDCLOVERS";


void setup() {
  size(700, 400);
  smooth();
  noStroke();
  noCursor();
}

void draw() {
  noStroke();
  interviewsDeclinedAngle = degPerFirm*1;
  interviewsNoAngle = degPerFirm*2;
  interviewsNoResponseAngle = degPerFirm*2;
  float averageAngleDeclined, averageAngleNo, averageAngleNoResponse, c3xDeclined, c3yDeclined, c3xNo, c3yNo, c3xNoResponse, c3yNoResponse;
  averageAngleDeclined = radians((arcAngle4+(arcAngle4-interviewsDeclinedAngle))/2);
  averageAngleNo = radians(((arcAngle3+interviewsNoResponseAngle)+(arcAngle4-interviewsDeclinedAngle))/2);
  averageAngleNoResponse = radians((arcAngle3+arcAngle3+interviewsNoResponseAngle)/2);
  c3xDeclined =c2xInterviews+(radius * cos(averageAngleDeclined))*.75;
  c3yDeclined =c2yInterviews+(radius * sin(averageAngleDeclined))*.75;
  c3xNo =c2xInterviews+(radius * cos(averageAngleNo))*.75;                                  
  c3yNo =c2yInterviews+(radius * sin(averageAngleNo))*.75;
  c3xNoResponse =c2xInterviews+(radius * cos(averageAngleNoResponse))*.75;
  c3yNoResponse =c2yInterviews+(radius * sin(averageAngleNoResponse))*.75;


  background(100);
  textSize(100);
  fill(200, 200, 200, 50);
  text("UNEMPL   YED", 10, height/2+30);
  textSize(13);
  c1x = width/2+95;
  c1y = height/2-5;

  radius = 80;
  arcAngle1 = 0;
  arcAngle4 = 360;

  fill(200, 200, 200, 50);                                  
  ellipse (c1x, c1y, radius, radius);
  fill(100);                                    
  ellipse (c1x, c1y, radius-20, radius-20);


  arc1(c1x, c1y, arcAngle1, arcAngle2, arcAngle3, arcAngle4);

  if (c2Interviews) {
    Interview(arcAngle3, arcAngle4, averageAngleDeclined, averageAngleNo, averageAngleNoResponse, c3xDeclined, c3yDeclined, c3xNo, c3yNo, c3xNoResponse, c3yNoResponse);
  }

  plusMinus(c1x, c1y, arcAngle1, arcAngle2, arcAngle3, arcAngle4);
  textOver(c1x, c1y, c3xNo, c3yNo, c3xNoResponse, c3yNoResponse, c3xDeclined, c3yDeclined, arcAngle1, arcAngle2, arcAngle3, arcAngle4);

  x();
}

//ARC FUNCTION//

void arc1(float c1x, float c1y, float arcAngle1, float arcAngle2, float arcAngle3, float arcAngle4) {
  averageAngleNoResponse = radians((arcAngle1+arcAngle2)/2);
  averageAngleNotEmploying = radians((arcAngle2+arcAngle3)/2);
  averageAngleInterviews = radians((arcAngle3+arcAngle4)/2);
  c2xNoResponse =c1x+(radius * cos(averageAngleNoResponse))*.75;
  c2yNoResponse =c1y+(radius * sin(averageAngleNoResponse))*.75;
  c2xNotEmploying =c1x+(radius * cos(averageAngleNotEmploying))*.75;
  c2yNotEmploying =c1y+(radius * sin(averageAngleNotEmploying))*.75;
  c2xInterviews =c1x+(radius * cos(averageAngleInterviews))*.75;
  c2yInterviews =c1y+(radius * sin(averageAngleInterviews))*.75;


  if ( c2NoResponse) {   
    fill(255, 100, 100);
    arc(c2xNoResponse, c2yNoResponse, radius, radius, radians(arcAngle1), radians(arcAngle2));
  }
  else {
    fill(255);
    arc(c1x, c1y, radius, radius, radians(arcAngle1), radians(arcAngle2));
  }
  if ( c2NotEmploying) {   
    fill(255, 100, 100);
    arc(c2xNotEmploying, c2yNotEmploying, radius, radius, radians(arcAngle2), radians(arcAngle3));
  }
  else {
    fill(255);
    arc(c1x, c1y, radius, radius, radians(arcAngle2), radians(arcAngle3));
  }

  if ( c2Interviews) {   
    fill(255, 100, 100);
    arc(c2xInterviews, c2yInterviews, radius, radius, radians(arcAngle3), radians(arcAngle4));
  }
  else {
    fill(255);
    arc(c1x, c1y, radius, radius, radians(arcAngle3), radians(arcAngle4));
  }
}





void mousePressed() {
  angleInRadians = atan2( mouseY-c1y, mouseX-c1x);
  if (angleInRadians<0) {
    angleInRadians = (2*PI)+ angleInRadians;
  }
  angleInDegrees = degrees(angleInRadians);
  if (dist(c1x, c1y, mouseX, mouseY)<radius/2 && angleInDegrees<arcAngle2 && angleInDegrees>arcAngle1) {
    c2NoResponse = !c2NoResponse;
  }
  if (dist(c1x, c1y, mouseX, mouseY)<radius/2 && angleInDegrees<arcAngle3 && angleInDegrees>arcAngle2) {
    c2NotEmploying = !c2NotEmploying;
  }
  if (dist(c1x, c1y, mouseX, mouseY)<radius/2 && angleInDegrees<arcAngle4 && angleInDegrees>arcAngle3) {
    c2Interviews = !c2Interviews;
  }

  angleInRadians2 = atan2( mouseY-c2yInterviews, mouseX-c2xInterviews);
  if (angleInRadians2<0) {
    angleInRadians2 = (2*PI)+ angleInRadians2;
  }
  angleInDegrees2 = degrees(angleInRadians2);

  if (dist(c2xInterviews, c2yInterviews, mouseX, mouseY)<radius/2 && angleInDegrees2<arcAngle4 && angleInDegrees2>arcAngle4-interviewsDeclinedAngle) {
    c2InterviewsDeclined = !c2InterviewsDeclined;
  }
  if (dist(c2xInterviews, c2yInterviews, mouseX, mouseY)<radius/2 && angleInDegrees2<arcAngle4-interviewsDeclinedAngle && angleInDegrees2>arcAngle3+interviewsNoResponseAngle) {
    c2InterviewsNo = !c2InterviewsNo;
  }
  if (dist(c2xInterviews, c2yInterviews, mouseX, mouseY)<radius/2 && angleInDegrees2<arcAngle3+interviewsNoResponseAngle && angleInDegrees2>arcAngle3) {
    c2InterviewsNoResponse = !c2InterviewsNoResponse;
  }
}





//MOUSE OVER ARC//

boolean arcWithin(float cx, float cy, float arcAngleFirst, float arcAngleSecond) {
  angleInRadians = atan2( mouseY-cy, mouseX-cx);
  if (angleInRadians<0) {
    angleInRadians = (2*PI)+ angleInRadians;
  }
  angleInDegrees = degrees(angleInRadians);
  if (dist(cx, cy, mouseX, mouseY)<radius/2&& angleInDegrees>arcAngleFirst && arcAngleSecond>angleInDegrees) {
    return true;
  }
  else {
    return false;
  }
}






void Interview(float arcAngle3, float arcAngle4, float averageAngleDeclined, float averageAngleNo, float averageAngleNoResponse, float c3xDeclined, float c3yDeclined, float c3xNo, float c3yNo, float c3xNoResponse, float c3yNoResponse) {

  if (c2InterviewsDeclined) {
    arc(c3xDeclined, c3yDeclined, radius, radius, radians(arcAngle4-interviewsDeclinedAngle), radians(arcAngle4));
  }
  if (c2InterviewsNo) {
    arc(c3xNo, c3yNo, radius, radius, radians(arcAngle3+interviewsNoResponseAngle), radians(arcAngle4-interviewsDeclinedAngle));
  }
  if (c2InterviewsNoResponse) {
    arc(c3xNoResponse, c3yNoResponse, radius, radius, radians(arcAngle3), radians(arcAngle3+interviewsNoResponseAngle));
  }
}









//TEXT OVER

void textOver(float c1x, float c1y, float c3xNo, float c3yNo, float c3xNoResponse, float c3yNoResponse, float c3xDeclined, float c3yDeclined, float arcAngle1, float arcAngle2, float arcAngle3, float arcAngle4) {
  textLeading(14);
  if (c2NoResponse == false&&c2NotEmploying == false&&c2Interviews == false)
    if (arcWithin(c1x, c1y, arcAngle1, arcAngle4)) {
      String c1totalFirms = (totalFirms+" FIRMS APPLIED TO");
      fill(200, 200, 200, 100);
      rect (mouseX+7, mouseY+7, textWidth(c1totalFirms), 12);
      fill(100);
      text (c1totalFirms, mouseX+7, mouseY+18);
    }

  if (c2NoResponse) {
    if (arcWithin(c2xNoResponse, c2yNoResponse, arcAngle1, arcAngle2)) {
      String c2NoResponseText = (numNoResponse+" NO RESPONSE");
      fill(200, 200, 200, 100);
      rect (mouseX+7, mouseY+7, textWidth(c2NoResponseText), 230);
      fill(100);
      text ( c2NoResponseText, mouseX+7, mouseY+18);
      text (firmsNoResponse, mouseX+7, mouseY+28, textWidth(c2NoResponseText), 250);
    }
  }
  if (c2NotEmploying) {
    if (arcWithin(c2xNotEmploying, c2yNotEmploying, arcAngle2, arcAngle3)) {
      String c2NotEmploying = (numNotEmploying+" NOT EMPLOYING");
      fill(200, 200, 200, 100);
      rect (mouseX+7, mouseY+7, textWidth(c2NotEmploying), 50);
      fill(100);
      text (c2NotEmploying, mouseX+7, mouseY+18);
      text (firmsNotEmploying, mouseX+7, mouseY+28, textWidth(c2NotEmploying), 200);
    }
  }
  if (c2Interviews && !c2InterviewsNo && !c2InterviewsDeclined && !c2InterviewsNoResponse) {
    if (arcWithin(c2xInterviews, c2yInterviews, arcAngle3, arcAngle4)) {
      String c2Interviews = (numInterviews+" INTERVIEWS");
      fill(200, 200, 200, 100);
      rect (mouseX+7, mouseY+7, textWidth(c2Interviews), 80);
      fill(100);
      text (c2Interviews, mouseX+7, mouseY+18);
      text (firmsInterviews, mouseX+7, mouseY+28, textWidth(c2Interviews), 200);
    }
  }
  if (c2InterviewsNo) {
    if (arcWithin(c3xNo, c3yNo, arcAngle3+interviewsNoResponseAngle, arcAngle4-interviewsDeclinedAngle)) {      //FIX THIS LOCATION    arc(c3xNo, c3yNo, radius, radius, radians(arcAngle3+interviewsNoResponseAngle), radians(arcAngle4-interviewsDeclinedAngle));
      String c2Interviews = (numInterviewsNo+" SAID NO");
      fill(200, 200, 200, 100);
      rect (mouseX+7, mouseY+7, textWidth(c2Interviews), 37);
      fill(100);
      text (c2Interviews, mouseX+7, mouseY+18);
      text (firmsInterviewsNo, mouseX+7, mouseY+28, textWidth(c2Interviews), 200);
    }
  }
  if (c2InterviewsNoResponse) {
    if (arcWithin(c3xNoResponse, c3yNoResponse, arcAngle3, arcAngle3+interviewsNoResponseAngle)) {      //FIX THIS LOCATION    
      String c2Interviews = (numInterviewsNoResponse+" NO RESPONSE");
      fill(200, 200, 200, 100);
      rect (mouseX+7, mouseY+7, textWidth(c2Interviews), 37);
      fill(100);
      text (c2Interviews, mouseX+7, mouseY+18);
      text (firmsInterviewsNoResponse, mouseX+7, mouseY+28, textWidth(c2Interviews), 200);
    }
  }
  if (c2InterviewsDeclined) {
    if (arcWithin(c3xDeclined, c3yDeclined, arcAngle4-interviewsDeclinedAngle, arcAngle4)) {      //FIX THIS LOCATION  
      String c2Interviews = (numInterviewsDeclined+" DECLINED OFFER");
      fill(200, 200, 200, 100);
      rect (mouseX+7, mouseY+7, textWidth(c2Interviews), 37);
      fill(100);
      text (c2Interviews, mouseX+7, mouseY+18);
      text (firmsInterviewsDeclined, mouseX+7, mouseY+28, textWidth(c2Interviews), 200);
    }
  }
}


//TEXT PLUS AND MINUS SIGN

void plusMinus(float c1x, float c1y, float arcAngle1, float arcAngle2, float arcAngle3, float arcAngle4) {
  averageAngleNoResponse = radians((arcAngle1+arcAngle2)/2);
  averageAngleNotEmploying = radians((arcAngle2+arcAngle3)/2);
  averageAngleInterviews = radians((arcAngle3+arcAngle4)/2);
  c2xTNoResponse =c1x+(radius * cos(averageAngleNoResponse))*.25;
  c2yTNoResponse =c1y+(radius * sin(averageAngleNoResponse))*.25;
  c2xTNotEmploying =c1x+(radius * cos(averageAngleNotEmploying))*.25;
  c2yTNotEmploying =c1y+(radius * sin(averageAngleNotEmploying))*.25;
  c2xTInterviews =c1x+(radius * cos(averageAngleInterviews))*.25;
  c2yTInterviews =c1y+(radius * sin(averageAngleInterviews))*.25;
  if (c2NoResponse) {
    fill(255, 255, 255, 50);
    text("-", c2xTNoResponse-5, c2yTNoResponse);
  } 
  else {
    fill(0, 0, 0, 40);
    text("+", c2xTNoResponse-5, c2yTNoResponse);
  }

  if (c2NotEmploying) {
    fill(255, 255, 255, 50);
    text("-", c2xTNotEmploying-5, c2yTNotEmploying);
  }
  else {
    fill(0, 0, 0, 40);
    text("+", c2xTNotEmploying-5, c2yTNotEmploying);
  }
  if (c2Interviews) {
    fill(255, 255, 255, 50);
    text("-", c2xTInterviews-5, c2yTInterviews);
  }
  else {
    fill(0, 0, 0, 40);
    text("+", c2xTInterviews-5, c2yTInterviews);
  }
  if (c2Interviews && !c2InterviewsNo && !c2InterviewsNoResponse && !c2InterviewsDeclined) {
    fill(255, 255, 255, 100);
    text("+", c2xInterviews+14, c2yInterviews-8);
  }
  if (c2Interviews && c2InterviewsNo || c2InterviewsNoResponse || c2InterviewsDeclined)
  {
    fill(0, 0, 0, 40);
    text("-", c2xInterviews+14, c2yInterviews-8);
  }
}

void x() {
  fill(0);
  stroke(1);
  line(mouseX, mouseY, mouseX+7, mouseY);
  line(mouseX, mouseY, mouseX, mouseY+7);
}


