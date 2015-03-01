
/*
    Outer circle: seconds
    mid circle:   minutes
    inner circle: hours 
    
    Every circle is divided into 6 segments (because 60 = 111100...)
    hours/minutes/seconds are converted to binary numbers
    1 = dark color
    0 = white 
    
    colors grow slightly darker over time
*/
PFont myFont; 

float mx, my; 
float diamHour;
float diamMin;
float diamSec;

String binTime;
float arcTime = radians(60); 
int colTime; 

void setup() {
  size(500, 500); 
  background(220);
  noStroke();
  smooth();

  myFont = loadFont("Bauhaus93-48.vlw");  
  textFont(myFont); 

  mx = width/2; 
  my = height/2; 

  diamHour = 175;  
  diamMin = 275;
  diamSec = 375;
}

void draw() {
  background(220); 

  int h = hour(); 
  int m = minute(); 
  int s = second(); 

  float aStart, aEnd; 

  // map hour to color - the later, the darker 
  colTime = (int) map(h, 0, 24, 100, 0); 
  
  fill(0); 
  textSize(40);
  textAlign(CENTER);   
  text(str(h) + ":"+ nf(m,2) + ":" + nf(s,2), width/2, 35);    
  
  // seconds (outer circle)
  fill(255); 
  ellipse(mx, my, diamSec, diamSec); 
  binTime = binary(s, 6);
  for (int i = 0; i < 6; i++) {       
    if (binTime.charAt(i) == "1") {  // if (binTime.charAt(i) == '1') { //  
      fill(colTime+50);
    } else { 
      fill(255);
    }   
    aStart = -PI/2 + (5 - i) * arcTime; 
    aEnd   = -PI/2 + (5 - i) * arcTime + arcTime; 
    arc(mx, my, diamSec, diamSec, aStart, aEnd);
  }

  // minutes
  fill(255); 
  ellipse(mx, my, diamMin, diamMin);
  binTime = binary(m, 6);
  for (int i = 0; i < 6; i++) {    
    if (binTime.charAt(i) == "1") {  // if (binTime.charAt(i) == '1') {  //
      fill(colTime+25); 
    } else {  
      fill(255);
    }
    aStart = -PI/2 + (5 - i) * arcTime; 
    aEnd   = -PI/2 + (5 - i) * arcTime + arcTime; 
    arc(mx, my, diamMin, diamMin, aStart, aEnd);
  }

  // hours (inner circle)
  fill(255); 
  ellipse(mx, my, diamHour, diamHour); 
  binTime = binary(h, 6);
  for (int i = 0; i < 6; i++) {
    if (binTime.charAt(i) == "1") {  // if (binTime.charAt(i) == '1') {  //
      fill(colTime);  
    } else {  
      fill(255);
    }
    aStart = -PI/2 + (5 - i) * arcTime; 
    aEnd   = -PI/2 + (5 - i) * arcTime + arcTime; 
    arc(mx, my, diamHour, diamHour, aStart, aEnd);    
  }
  
  // binary time... 
  fill(255); 
  textSize(25); 
  textAlign(CENTER); 
  text(binary(h, 6) + " : "+ binary(m, 6) + " : " + binary(s, 6), width/2, height - 15);
  
}; 



