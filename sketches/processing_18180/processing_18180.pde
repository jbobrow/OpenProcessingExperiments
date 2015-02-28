
boolean myHour = true;

void setup() {
   size(320,320); 
   frameRate(30);
   
}

void draw() {
   // set background to black
  background(255);
  
  // get my current time values
  int mySecond = second();  // Values from 0 - 59
  int myMinute = minute();  // Values from 0 - 59
  int myHour = hour();    // Values from 0 - 23
  
  
  // draw the minutes line
  noStroke();
  fill(255, 0, 0);
  ellipse(164, 165, myMinute*5, myMinute*5);
  
  
  // set drawing color to white
  noStroke();
  fill(0, 25, 200, 80);
  // draw the seconds line
  rect(0, 0, 320, mySecond*5);
 
  
  
  
  
    //Hours
  noStroke();
  fill(255, 51, 255, 85);
  //rect(160, 56, 10, 10);
   if(myHour > 0) {
    ellipse (211, 70, 30, 30);   
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }

  noStroke();
  fill(255, 51, 255, 85);
  if(myHour > 1) {
    ellipse (211, 70, 30, 30);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
    noStroke();
  fill(255, 51, 255, 85);
  if(myHour > 2) {
    ellipse (251, 105, 30, 30);
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  noStroke();
  fill(255, 51, 255, 85);
  if(myHour > 3) {
     ellipse (265, 160, 30, 30);   
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);  
  }
  
  noStroke();
  fill(255, 51, 255, 85);
  if(myHour > 4) {
   ellipse (251, 213, 30, 30);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  noStroke();
  fill(255, 51, 255, 85);
  if(myHour > 5) {
    ellipse (213, 251, 30, 30);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  noStroke();
  fill(255, 51, 255, 85);
  if(myHour > 6) {
 ellipse (160, 265, 30, 30);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  noStroke();
  fill(255, 51, 255, 85);
  if(myHour > 7) {
    ellipse (103, 251, 30, 30);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  noStroke();
  fill(255, 51, 255, 85);
  if(myHour > 8) {
   ellipse (66, 213, 30, 30);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  noStroke();
  fill(255, 51, 255, 85);
  if(myHour > 9) {
   ellipse (55, 160, 30, 30);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  noStroke();
  fill(255, 51, 255, 85);
  if(myHour > 10) {
    ellipse (66, 105, 30, 30);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  noStroke();
  fill(255, 51, 255, 85);
  if(myHour > 11) {
   ellipse (105, 70, 30, 30);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  
  
  
  
  
  
  
  //Minutes
  noStroke();
  fill(0);
  rect(160, 56, 10, 10);
   if(myMinute > 1) {
    rect (211, 70, 10, 10);   
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }

  noStroke();
  fill(0);
  if(myMinute > 5) {
    rect (50, 55, 10, 10);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
    noStroke();
  fill(0);
  if(myMinute > 10) {
    rect (251, 105, 10, 10);
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  noStroke();
  fill(0);
  if(myMinute > 15) {
    rect (265, 160, 10, 10);   
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);  
  }
  
  noStroke();
  fill(0);
  if(myMinute > 20) {
    rect (251, 213, 10, 10);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  noStroke();
  fill(0);
  if(myMinute > 25) {
    rect (213, 251, 10, 10);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  noStroke();
  fill(0);
  if(myMinute > 30) {
    rect (160, 265, 10, 10);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  noStroke();
  fill(0);
  if(myMinute > 35) {
    rect (103, 251, 10, 10);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  noStroke();
  fill(0);
  if(myMinute > 40) {
    rect (66, 213, 10, 10);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  noStroke();
  fill(0);
  if(myMinute > 45) {
    rect (55, 160, 10, 10);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  noStroke();
  fill(0);
  if(myMinute > 50) {
    rect (66, 105, 10, 10);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }
  
  noStroke();
  fill(0);
  if(myMinute > 55) {
    rect (105, 70, 10, 10);  
  } else {
    //fill(0, 26, 51);
    fill(255, 0, 0);
  }

  // useful function
  // lerp
  // lerpColor
  // map


}

