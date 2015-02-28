
float barOne;
float barTwo;
float barThree;
float barFour;
float barFive;
float barSix; 
float barSeven;



void setup() {
  size(600, 400);
  smooth();
}



void draw() {
      background(255, 255, 255);


  fill(#000000);
  text("People working in the US broken down by age", 40, 20);
  text("1,427 people between Ages 16-20", 200, 50);
  text("1,427 people between ages 20-24", 200, 95);
  text("24,640 people between ages 25-34", 200, 140);
  text("26,766 people between ages 35-44", 200, 185);
  text("24,855 people between ages 45-54", 200, 230);
  text("11,745 people between ages 55-64", 200, 275);
  text("1,341 people between 65-74", 200, 320);


  //1%
   fill(#FF0022);
  rect(40, 30, barOne, 25);
  noStroke();
  barOne+=.10;
  if ( barOne > 17) {
    barOne=0;
  }
  
  fill(#0045FC);
  noStroke();
  rect(40, 75, barTwo, 25);
  barTwo+=.20;
  if (barTwo>30) {
    barTwo=0;
  }
  fill(#00FC62);
  noStroke();
  rect(40, 120, barThree, 25);
  barThree+=.30;
  if (barThree>90) {
    barThree=0;
  }
  fill(#ED00FF);
  noStroke();
  rect(40, 165, barFour, 25);
  barFour+=.40;
  if (barFour>110) {
    barFour=0;
  } 
  
  
  fill(#FF6200);
  rect(40, 210, barFive, 25);
  barFive+=.30;
  if (barFive>90) {
    barFive=0;
  }
  
  fill(#F8FC00);
  noStroke();
  rect(40, 255, barSix, 25);
  barSix+=.20;
  if (barSix>60) {
    barSix=0;
  }
  
  fill(#00FFD2);
  noStroke();
  rect(40, 300, barSeven, 25);
  barSeven+=.10;
  if (barSeven>17) {
    barSeven=0;
  }
}


