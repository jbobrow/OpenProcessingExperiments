

float prevMillis;
int myState = 0;
int myCounter = 200;

void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  myCounter = myCounter - 1;
  background(0);

switch(myState) {

  case 0:
fill(255, 255, 0);
ellipse(150, 400, 100, 100);
fill(0);
triangle(200, 390, 150, 410, 200, 430);
ellipse(160, 385, 10, 10);

if (myCounter < 0) {
  myCounter = 200;
  myState = 1;
}
break;

case 1:
fill(255, 255, 0);
ellipse(150, 400, 100, 100);
fill(0);
triangle(200, 390, 150, 410, 200, 430);
ellipse(160, 385, 10, 10);

fill(255, 0, 0);
arc(400, 410, 70, 140, PI, TWO_PI);
rect(365, 410, 12, 12);
rect(395, 410, 12, 12);
rect(423, 410, 12, 12);
fill(0);
ellipse(387, 367, 8, 8);
ellipse(412, 367, 8, 8);

if (myCounter < 0) {
  myCounter = 25;
  myState = 2;
}
break;

case 2:
fill(255, 255, 0);
ellipse(150, 400, 100, 100);
fill(0);
triangle(200, 390, 150, 410, 200, 430);
ellipse(160, 385, 10, 10);

fill(255, 0, 0);
arc(400, 410, 70, 140, PI, TWO_PI);
rect(365, 410, 12, 12);
rect(395, 410, 12, 12);
rect(423, 410, 12, 12);
fill(0);
ellipse(387, 367, 8, 8);
ellipse(412, 367, 8, 8);

fill(255);
ellipse(220, 410, 30, 30);

if (myCounter < 0) {
  myCounter = 25;
  myState = 3;
}
break;

case 3:
fill(255, 255, 0);
ellipse(150, 400, 100, 100);
fill(0);
triangle(200, 390, 150, 410, 200, 430);
ellipse(160, 385, 10, 10);

fill(255, 0, 0);
arc(400, 410, 70, 140, PI, TWO_PI);
rect(365, 410, 12, 12);
rect(395, 410, 12, 12);
rect(423, 410, 12, 12);
fill(0);
ellipse(387, 367, 8, 8);
ellipse(412, 367, 8, 8);

fill(255);
ellipse(200, 410, 30, 30);

if (myCounter < 0) {
  myCounter = 25;
  myState = 4;
}
break;

case 4:
fill(255, 255, 0);
ellipse(150, 400, 100, 100);
fill(0);
ellipse(160, 385, 10, 10);

fill(255, 0, 0);
arc(400, 410, 70, 140, PI, TWO_PI);
rect(365, 410, 12, 12);
rect(395, 410, 12, 12);
rect(423, 410, 12, 12);
fill(0);
ellipse(387, 367, 8, 8);
ellipse(412, 367, 8, 8);



if (myCounter < 0) {
  myCounter = 50;
  myState = 5;
}
break;

case 5:
fill(255, 255, 0);
ellipse(150, 400, 100, 100);
fill(0);
triangle(200, 390, 150, 410, 200, 430);
ellipse(160, 385, 10, 10);

fill(0, 0, 255);
arc(400, 410, 70, 140, PI, TWO_PI);
rect(365, 410, 12, 12);
rect(395, 410, 12, 12);
rect(423, 410, 12, 12);
fill(0);
ellipse(387, 367, 8, 8);
ellipse(412, 367, 8, 8);

if (myCounter < 0) {
  myCounter = 50;
  myState = 6;
}
break;

case 6:
fill(255, 255, 0);
ellipse(150, 400, 100, 100);
fill(0);
triangle(200, 390, 150, 410, 200, 430);
ellipse(160, 385, 10, 10);

fill(255);
arc(400, 410, 70, 140, PI, TWO_PI);
rect(365, 410, 12, 12);
rect(395, 410, 12, 12);
rect(423, 410, 12, 12);
fill(0);
ellipse(387, 367, 8, 8);
ellipse(412, 367, 8, 8);

if (myCounter < 0) {
  myCounter = 50;
  myState = 7;
}
break;

case 7:
fill(255, 255, 0);
ellipse(150, 400, 100, 100);
fill(0);
triangle(200, 390, 150, 410, 200, 430);
ellipse(160, 385, 10, 10);

fill(0, 0, 255);
arc(400, 410, 70, 140, PI, TWO_PI);
rect(365, 410, 12, 12);
rect(395, 410, 12, 12);
rect(423, 410, 12, 12);
fill(0);
ellipse(387, 367, 8, 8);
ellipse(412, 367, 8, 8);

if (myCounter < 0) {
  myCounter = 50;
  myState = 8;
}
break;

case 8:
fill(255, 255, 0);
ellipse(150, 400, 100, 100);
fill(0);
triangle(200, 390, 150, 410, 200, 430);
ellipse(160, 385, 10, 10);


if (myCounter < 0) {
  myCounter = 100;
  myState = 0;
}
break;






}

}


