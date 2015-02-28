
float seconds, minutes, hours;
String[] monthData = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};


void setup() {
  size(360, 360);
  smooth();
}

void draw() {
  background(90, 140, 170);
  seconds= second();
  minutes=minute();
  hours=hour();
  float a;
  float b;

  float hoursRot= map(hours, 0, 24, 0, height);
  ///////////////////////////////////////////////////

  float secondRot= map(seconds, 0, 59, 0, width);
  noStroke();
  fill(255, 129, 8, 60);
  ellipse(width/2, hoursRot, secondRot/2, secondRot/2);

  float secondRot2= map(seconds, 0, 59, 0, width);
  noStroke();
  fill(255, 99, 8, 60);
  ellipse(width/2, hoursRot, secondRot2/3, secondRot2/3);

  fill(255, 3, 3, 40);
  noStroke();
  ellipse(width/2, hoursRot, 20, 20);
  ///////////////////////////////////////////


  float minutesRot= map(minutes, 0, 59, 0, height);
  noStroke();
  fill(0, 255, 160, 50);
  rectMode(CORNERS);
  a=360-minutesRot;
  rect(0, a, 360, 360);
  ////////////////////minute


  noStroke();
  fill(255, 100);
  triangle(hoursRot/2, height, width/2, hoursRot, width-hoursRot/2, height);
  /////////////////////////////////hour

  noStroke();
  fill(255, 100);
  triangle(0, 360, 15, 300, 100, 360);
  triangle(200, 360, 240, 300, 360, 360);
  triangle(70, 360, 120, 240, 180, 360);
  triangle(230, 360, 320, 320, 360, 360);
  triangle(130, 360, 200, 320, 260, 360);
  triangle(30, 360, 100, 320, 160, 360);
  //////////////////////////////////////////////////////////////////

  int n=1;
  strokeWeight(0.5);
  stroke(255);
  for (int i=0;i<23;i++) {
    String s= String.valueOf(n); 
    textAlign(CENTER, CENTER);
    text(s, width/2, 15*n);
    n++;
  }
  //////////////////////////////////////////////////////text////hour

  int m=10;
  for (int j=0;j<5;j++) {
    String t= String.valueOf(60-m);
    text(t, 10, width/60*m);
    m=m+10;
  }
  ////////////////////////////////////////////////////text////minutes

  int days = day();    // Values from 1 - 31
  int months = month();  // Values from 1 - 12
  int years = year();   // 2003, 2004, 2005, etc.
  String str1 = String.valueOf(days);
  text(str1, 300, height/2);
  text(".", 295, height/2);
  ///////////////////////////////////////////////////////
  
  String theMonth = monthData[months - 1];
  text(theMonth, 285, height/2);                ////////////text/////month
  
////////////////////////////////////////////
  str1 = String.valueOf(years);
  text(str1, 325, height/2);
}


//  println("The current time is:"+hours+":"+minutes+":"+seconds);



