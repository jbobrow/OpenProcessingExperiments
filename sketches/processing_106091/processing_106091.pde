
// mfc_05_sinPhaseLoop Matt Felsen's Math for Code Dorkshop 08-03-13
// merged with
// https://github.com/patriciogonzalezvivo/bootcamp2013_code/tree/master/08_09_Fri/Day10_2_time_map

PFont font;

float hourX;
float minuteX;
float secondX;

float numHCircles = hour();
float numMCircles = minute();
float numSCircles = second();


void setup() {
  size(displayWidth, displayHeight);
  fill(#007DB4, 80);
  noStroke();
  font = loadFont("Calibri-Bold-48.vlw");
}

void draw() {
  background(173, 138, 175);

  fill(240); //time
  textFont(font);  //time

  text((hour() + ":" + minute() + ":" + second()), width/2, height/2); //write the hour, minutes, and seconds on the top-left of the screen
  // maping the hour(), total of 24: 0->23
  fill(215, 242, 15);
  for (int i = 1; i <= numHCircles; i++) {
    float sine = map(sin(hourX + TWO_PI/numHCircles*i), -1, 1, 0, 1);
    ellipse(width/(numHCircles+1)*i, height*sine, 80, 80);

    hourX = map(hour(), 0, 23, 0, (width-10)); //map the current hour to an X position on the screen
    //
  }
  fill(15, 40, 242, 80);
  for (int i = 1; i <= numMCircles; i++) {
    float sine = map(sin(minuteX + TWO_PI/numMCircles*i), -1, 1, 0, 1);
    ellipse(width/(numMCircles+1)*i, height*sine, 60, 60);
    minuteX = map(minute(), 0, 59, 0, (width-10)); //map the current minute to an X position on the screen
  }
  fill(0, 255, 14, 100);
  for (int i = 1; i <= numSCircles; i++) {
    float sine = map(sin(secondX + TWO_PI/numSCircles*i), -1, 1, 0, 1);
    ellipse(width/(numSCircles+1)*i, height*sine, 40, 40);
    secondX = map(second(), 0, 59, 0, (width-10)); //map the current second to an X position on the screen
  }

  //  fill(255,200,0);
  //  rect(hourX,0,10,100); //draws a rectangle on the top of the screen with an X position based on the current hour
  //  fill(200,135,200);
  //  rect(minuteX,100,10,100); //draws a rectangle in the middle of the screen with an X position based on the current minute
  //  fill(164,220,240);
  //  rect(secondX, 200,10,100); //draws a rectangle on the bottom of the screen with an X position based on the current second


  //    float time = millis()/300.0;
  //
  //  for (int i = 1; i <= numCircles; i++) {
  //    float sine = map(sin(time + TWO_PI/numCircles*i), -1, 1, 0, 1);
  //    ellipse(width/(numCircles+1)*i, height*sine, 40, 40);
  //  }
}

boolean sketchFullScreen() {
  return true;
}



