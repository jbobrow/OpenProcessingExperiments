
PFont font;

float hourX;
float minuteX;
float secondX;

void setup() {
  size(300,300);
  noStroke();
  //font = loadFont("Archer-Book-24.vlw");
}

void draw() {
  background(120);
  
  fill(240);
 // textFont(font);
  
  text((hour() + ":" + minute() + ":" + second()), 10, 40); //write the hour, minutes, and seconds on the top-left of the screen
  // maping the hour(), total of 24: 0->23
  hourX = map(hour(),0,35,50,(width-10)); //map the current hour to an X position on the screen
  //
  minuteX = map(minute(),0,59,0,(width-10)); //map the current minute to an X position on the screen
  secondX = map(second(),0,59,0,(width-10)); //map the current second to an X position on the screen
 //top face
  fill(255,200,0);
  ellipse(hourX, 50, 50, 50); //draws a rectangle on the top of the screen with an X position based on the current hour
  fill(0);
  ellipse(hourX, 60, 25, 25);
  rect(hourX-20, 40, 15, 5);
  rect(hourX+10, 40, 15, 5);  
  
  //middle face
  fill(200,135,200);
  ellipse(minuteX,100,70,70); //draws a rectangle in the middle of the screen with an X position based on the current minute
  fill(200, 100, 200);
  ellipse(minuteX+15, 100, 50, 50);
  
  
    //bottom face
  fill(164,220,240);
  ellipse(secondX, 200,100,100); //draws a rectangle on the bottom of the screen with an X position based on the current second
  fill(0);
  rect(secondX-35, 225, 75, 10);
  rect(secondX-50, 165, 100, 10);
  rect(secondX-40, 165, 35, 35);
  rect(secondX+15, 165, 35, 35);

}


