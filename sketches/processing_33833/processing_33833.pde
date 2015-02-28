
int time_off = 500; //time between flashes
int time_on = 1000; //how much time to stay on
int last_saved_time;//last time the light was on or off 
Boolean light_is_on = false;//boolean to see if the light is on or off

void setup() {
  smooth();
  size(400, 400);
  //when using millis(), the program actually will start timing the milliseconds
  //a few milliseconds after the program starts. Assigning l_s_t here keeps the timer accurate.
  last_saved_time = millis();
  println(last_saved_time);
}

void draw() {
  background(100);
  //I'm drawing the bulb in the middle of the screen, but could draw it anywhere, cause of the handy function I wrote.
  drawBulb(int(width * .5), int(height * .5));
}

void drawBulb(int center_x, int center_y) {
  //draw bulb base first
  fill(0);
  rect(center_x - 25, center_y + 40, 50, 50);
  
  if (light_is_on == true) {
    //draw a yellow circle
    fill(255, 255, 0);
    ellipse(center_x, center_y, 100, 100);
    //test the amount of time the bulb should be on
    //against the last time the bulb got switched on. uncomment the next line to see it happen
    //println("time_on: " + time_on + " mils - l_s_t: " + (millis() - last_saved_time) );
    if (millis() - last_saved_time > time_on) {
        light_is_on = false; 
        last_saved_time = millis();
        println("switched off");
    } 
  } else {
    //with Booleans, all you need is an if/else statement, no second test. 
    //They are ONLY ever true or false. the off bulb is the same color as the bg.
    fill(100);
    ellipse(center_x, center_y, 100, 100);
    //same test for time_off as above
    if (time_off < millis() - last_saved_time) {
      light_is_on = true;
      last_saved_time = millis();
      println("switched on"); 
    }
  }
  // draw fillament
  noFill();
  beginShape();
  vertex(center_x - 10, center_y + 50);
  //this for loop is to draw the jagged part of the fillament
  //using for loops inside of begin and end shape is very powerful
  //and in this case saved me many lines of code
  for (int i = center_x - 20; i <= center_x + 20; i+=5) {
    //This is a bit confusing. I'll explain if necessary. 
    //Put very simply it makes a jagged line 10 px high. -Ben 
    vertex(i, center_x + 10 - i % 2 * 10);
  }
  vertex(center_x + 10, center_y + 50);
  endShape();
  
}

