
PFont font;


void setup()
{
  font = loadFont("AmericanTypewriter-Light-48.vlw"); 
  textFont(font);
  size(400, 400);
  smooth();
}

void draw()
{
  for(int x = 0; x < width; x++)
  {
    line(x, 0, x, height);
    stroke(x, 0, 0);
  }
  stroke(0);
  strokeWeight(1);
  for(int y = 40; y < 400; y += 4)
  {
    line(0, y, width, y);
  }
    
  float hourlineY = map(hour()%12, 0, 12, 40, height);
  float minutelineY = map(minute(), 0, 60, 40, height);
  float secondlineY = map(second(), 0, 60, 40, height);

  //secondline
  strokeWeight(5);
  stroke(0, 0, 0, 255-second()*4);
  line(275, secondlineY, 345, secondlineY);
  textSize(15);
  text(second() + "s", 350, secondlineY+5);
  fill(255-second()*4);
  textSize(20);
  text("Seconds", 285, 20);
  
  //in between min and sec line
  strokeWeight(2);
  stroke(0);
  
  line(225, minutelineY, 275, secondlineY);
  
  //minuteline
  strokeWeight(5);
  stroke(0, 0, 0, 255-minute()*4);
  line(155, minutelineY, 225, minutelineY);
  textSize(20);
  fill(255-minute()*4);
  text("Minute", 165, 20);
  fill(255);
  textSize(15);
  text(minute() + "m", 230, minutelineY+5);
  
  //in bet hour and min line
  strokeWeight(2);
  stroke(0);
  line(120, hourlineY, 155, minutelineY);
  
  //hourline
  strokeWeight(5);
  stroke(255, 0, 0, 255-(hour()%12)*30);
  line(50, hourlineY, 120, hourlineY);
  fill(255-hour()*10);
  textSize(20);
  text("Hour", 65, 20);
  fill(255);
  textSize(15);
  text((hour()%12) + "h", 125, hourlineY+5);
  
}




