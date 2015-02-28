
//download libraries from site: hour, minute, second

void setup() {
  size(500,500);
  frameRate(5);
}

void draw() {
  
  background(0); 
  
  // get my current time variables
  int myWidth = 75; //half the width of the ellipses
  
  int myHour = hour();
  float myHourAlpha = map(myHour, 0, 23, 30, 255); //0-23 hours, 15-255 alpha
  
  int myMinute = minute();
  float myMinuteAlpha = map(myMinute, 0, 59, 15, 255); //0-59 minutes, 15-255 alpha
  
  int mySecond = second();
  float mySecondAlpha = map(mySecond, 0, 59, 0, 255); //0-59 seconds, 0-255 alpha
  
  float myHourPosition = map(myHour, 0, 23, 0, 500);//500=stageWidth
  float myMinutePosition = map(myMinute, 0, 59, 0, 500);
  float mySecondPosition = map(mySecond, 0, 59, 0, 500);
  
  //float myStarPosition = map(mySecond*3, 0, 59, 0, 500);
    
  /*fill(200,102,0,myHourAlpha);
  rect(myHourPosition,50,100,200);
  
  fill(200,102,153,myMinuteAlpha);
  rect(myMinutePosition,150,100,200);
  
  fill(200,75,50,mySecondAlpha);
  rect(mySecondPosition,200,100,200);*/
  
  // STARS:
  stroke(255);
  strokeWeight(1);
  
  float x = random(-500,500);
  float y = random(-500,500);
  point(x,y);
  
  point(0+mySecondPosition,mySecondPosition);
  point(15+mySecondPosition,5+mySecondPosition);
  point(200+mySecondPosition,25+mySecondPosition);
  point(25+mySecondPosition,350+mySecondPosition);
  point(375+mySecondPosition,420+mySecondPosition);
  point(115+mySecondPosition,94+mySecondPosition);
  point(mySecondPosition,50+mySecondPosition);
  point(2+mySecondPosition,45+mySecondPosition);
  point(7+mySecondPosition,380+mySecondPosition);
  point(-25+mySecondPosition,350+mySecondPosition);
  point(-375+mySecondPosition,420+mySecondPosition);
  point(-115+mySecondPosition,94+mySecondPosition);
  point((-50)+mySecondPosition,5+mySecondPosition);
  point((-100)+mySecondPosition,100+mySecondPosition);
  point((-175)+mySecondPosition,mySecondPosition);
  point((-15)+mySecondPosition,300+mySecondPosition);
  point((-300)+mySecondPosition,50+mySecondPosition);
  point(30+mySecondPosition,(-50)+mySecondPosition);
  point(50+mySecondPosition,(-190)+mySecondPosition);
  point(300+mySecondPosition,(-300)+mySecondPosition);
  point(175+mySecondPosition,(-80)+mySecondPosition);
  point(400+mySecondPosition,(-400)+mySecondPosition);
  point(-375+mySecondPosition,-420+mySecondPosition);
  point(-115+mySecondPosition,-94+mySecondPosition);
  point(mySecondPosition,-50+mySecondPosition);
  point(-2+mySecondPosition,-45+mySecondPosition);
  point(-7+mySecondPosition,-380+mySecondPosition);
  point(-250+mySecondPosition,-250+mySecondPosition);
  
  point(50,61);
  point(200,200);
  point(90,300);
  point(400,350);
  point(425,20);
  point(375,50);
  point(445,100);
  
  strokeWeight(1.5);
  
  point(250+mySecondPosition,250+mySecondPosition);
  point(-15+mySecondPosition,5+mySecondPosition);
  point(-200+mySecondPosition,25+mySecondPosition);
  point(-15+mySecondPosition,-5+mySecondPosition);
  point(-200+mySecondPosition,-25+mySecondPosition);
  point(-25+mySecondPosition,-350+mySecondPosition);
  
  point(125,475);
  point(320,85);
  point(20,400);
  point(50,470);
  point(85,87);
  point(250,400);
  point(300,415);
  point(275,449);
  
  // PLANETS:
  noStroke();
  fill(255,255,102,mySecondAlpha); //sun
  ellipse(mySecondPosition,250,150,150);
  
  fill(102,102,102,myHourAlpha); //moon
  ellipse(myHourPosition,250,150,150);
  
  fill(102,153,255,myMinuteAlpha); //earth
  ellipse(myMinutePosition,250,150,150);
  

  
  /*fill(0);
  rect(0,0,500/3,500);
  fill(150);
  rect(500/3,0,500/3,500);
  fill(255);
  rect((500/3)*2,0,500/3,500);*/
  
  /*fill(200,102,0,myHourAlpha);
  triangle(250,225,250,200,425,250);
  
  fill(200,102,153,myMinuteAlpha);
  triangle(225,275,250,425,250,250);
  
  fill(200,75,50,mySecondAlpha);
  triangle(275,275,500,0,400,250);*/
  
  
  // draw a line for each variable (x1, y1, x2, y2)
  /*line(mySecond, 0, mySecond, 300);
  line(myMinute, 0, myMinute, 300);
  line(myHour, 0, myHour, 300);*/
  
}


//rectangle: rect(x,y,width,height);
//triangle: triangle(x1,y1,x2,y2,x3,y3);
//circle: ellipse(x,y,width,height);

// look up:
// lerp
// lerpColor
// map

