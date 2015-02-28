
float hourX;
float minuteY;
float secondX;


void setup() {
  size(800,800);
  noStroke();
}

void draw() {
  background(255, 255, 255);
  PImage myImage = loadImage("redline.jpg");
  imageMode(CENTER);
  
  image(myImage, width/2, height/2);
  
  hourX = map(hour(),0,23,0,(width-10)); //map the current hour to an X position on the screen
  //
  minuteY = map(minute(),0,59,0,(height-10)); //map the current minute to an X position on the screen
  secondX = map(second(),0,59,0,(width-10)); //map the current second to an X position on the screen

  fill(0, 0, 0, 99);
rect(0,0,hourX/2,800); //draws a rectangle on the top of the screen with an X position based on the current hour
  
  fill(0,0,0, 99);
  rectMode(CENTER);
  rect(400, 800,800,minuteY*2); //draws a rectangle in the middle of the screen with an X position based on the current minute
  fill(164,220,240);
rectMode(CORNER);
rect(secondX, 200,10,100); //draws a rectangle on the bottom of the screen with an X position based on the current second
  println(hourX);

}




