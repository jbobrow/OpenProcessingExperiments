
float barOne;
float barTwo;
float barThree;
float barFour;
float barFive;
float barSix;
float barSeven;
 
 
 
void setup() {
  size(700, 350);
  smooth();
}
 
 
 
void draw() {
      background(255, 197, 170);
 
 
  fill(0);
  text("U.S. Abortion Rate by Religion (Rates are per 1,000 women aged 15-44 years)", 150, 30);
  text("No Religion 36.2", 300, 80);
  text("Mainstream Protestant 24.2", 300, 125);
  text("Catholic 23.8", 300, 170);
  text("Other Religion 16.0", 300, 215);
  text("Evangelical Christian 13.4", 300, 260);
 
 
 
  
   fill(205,250,105);
  rect(90, 60, barOne, 25);
  noStroke();
  barOne+=.50;
  if ( barOne > 130) {
    barOne=0;
  }
   
  fill(20,40,150);
  noStroke();
  rect(90, 105, barTwo, 25);
  barTwo+=.40;
  if (barTwo>100) {
    barTwo=0;
  }
  fill(120,200,206);
  noStroke();
  rect(90, 150, barThree, 25);
  barThree+=.30;
  if (barThree>80) {
    barThree=0;
  }
  fill(255,198,255);
  noStroke();
  rect(90, 195, barFour, 25);
  barFour+=.20;
  if (barFour>50) {
    barFour=0;
  }
   
   
  fill(250,0,2);
  rect(90, 240, barFive, 25);
  barFive+=.10;
  if (barFive>15) {
    barFive=0;
  }
   
 
}
