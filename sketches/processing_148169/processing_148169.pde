
//Kevin Kuntz
//Project 1

int timeHt = 50;
float x1,y1;
boolean overLine1 = false;
boolean locked1 = false;
int barPosition = 0;
int [] beanX = { 60, 130, 200, 270, 340, 420, 490, 560, 60, 130, 200, 270, 340, 420, 490, 560, 60, 130, 200, 270, 340, 420, 490, 560, 60, 130, 200, 270, 340 };
int [] beanY = { 250, 250, 250, 250, 250, 250, 250, 250, 320, 320, 320,320, 320, 320, 320, 320, 390, 390, 390, 390, 390, 390,390, 390, 390, 390, 390, 390, 390, 390, 390, 390 };
int [] numberOfBeans = { 21, 23, 16, 19, 21, 24, 21, 23, 28, 24, 20, 26, 29, 27 };
float xOffset = 0;

void setup() {
  size(600,600);
  background(0);
  
  x1 = 5;
  y1 =height * .1;
  
}

void draw() {
  background(0);
  timeLine();
  slider();
  showYears();

  for (int i=0; i < numberOfBeans[barPosition]-1; i++) {
    drawBean(i);
  }
  if(mouseX > x1-(timeHt/2) && mouseX < (x1 + timeHt/2) &&
     mouseY > y1 && mouseY < y1+(1.5*timeHt))
     {
       overLine1 = true;
     }
     else{
       overLine1 = false;
     }
}

void timeLine() {
  noStroke();
  fill(255);
  rect(0, height * .1, width, timeHt);
}

void slider(){
  strokeWeight(10);
  stroke(0);
  line(x1, y1, x1, y1+timeHt);
}

void showYears()
{
  textSize(12);
  fill(255);
  text("1990", .07* width,height* .21);
  text("1992", .14 * width, height* .21);
  text("1994", .21 * width, height* .21);
  text("1996", .28 * width, height* .21);
  text("1998", .35* width, height* .21);
  text("2000", .42* width, height* .21);
  text("2002", .49* width, height* .21);
  text("2004", .56* width, height* .21);
  text("2006", .63* width, height* .21);
  text("2008", .70* width, height* .21);
  text("2010", .77* width, height* .21);
  text("2012", .84* width, height* .21);
  text("2014", .91* width, height* .21);
  text(" 1 Bean = 1,000,000 60 lbs bags" , 80,height - 40);
  textSize(24);
  textMode(CENTER);
  text("Coffee Consumed in the US since 1990", 80, 40);

}

void drawBean(int i) {
  strokeWeight(2);
  stroke(85,45,0);
  smooth();
  fill(85,45,0);
  ellipseMode(CENTER);
  ellipse(beanX[i],beanY[i],60,40);
  strokeWeight(3);
  stroke(0);
  line(beanX[i]-30,beanY[i],beanX[i]+30,beanY[i]);
  
}

void mousePressed(){
  if(overLine1){
    locked1 = true;
   }
  else{
    locked1 = false;
  }
  xOffset = mouseX-x1;
}
 
void mouseDragged(){
  if(locked1)
  {
    x1 = mouseX-xOffset;
  }
  if ( x1 >0 && x1 < width * .07){
    barPosition = 0;
  }
  else if (x1 > width * .07 && x1 < width * .14) {
    barPosition = 1;
  }
  else if (x1 > width * .14 && x1 < width * .21) {
    barPosition = 2;
  }
  else if (x1 > width * .21 && x1 < width * .28) {
    barPosition = 3;
  }
  else if (x1 > width * .28 && x1 < width * .35) {
    barPosition = 4;
  }
  else if (x1 > width * .35 && x1 < width * .42) {
    barPosition = 5;
  }
  else if (x1 > width * .42 && x1 < width * .49) {
    barPosition = 6;
  }
  else if (x1 > width * .49 && x1 < width * .56) {
    barPosition = 7;
  }
  else if (x1 > width * .56 && x1 < width * .63) {
    barPosition = 8;
  }
  else if (x1 > width * .63 && x1 < width * .70) {
    barPosition = 9;
  }
  else if (x1 > width * .70 && x1 < width * .77) {
    barPosition = 10;
  }
  else if (x1 > width * .77 && x1 < width * .84) {
    barPosition = 11;
  }
  else if (x1 > width * .84 && x1 < width * .91) {
    barPosition = 12;
  }
  else {
    barPosition = 13;
  }
}
 
void mouseReleased(){
  locked1 = false;
}



