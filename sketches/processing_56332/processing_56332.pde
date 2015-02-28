
float sx;
float sy;
float mx;
float my;
float hx;
float hy;
float dx;
float dy;
float r=70;

void setup ()
{
  size (500, 500);
  stroke (0);
  strokeWeight (3);
  smooth ();
}

void draw ()
{
  println(hour());
  println(minute());

  // drawing
  rectMode (CENTER);
  fill (255);

  //sun/ daytime
  if (hour()>7 && hour()<19) {
    background (194, 250, 252);
    fill(255, 0, 0);
    ellipse(100, 400, 60, 60);
    fill (0);
    //sun's sunglasses
    ellipse(85, 395, 20, 20);
    ellipse(115, 395, 20, 20);
    //sun rays
    line (85,390,115,390);
    line (100, 360, 100, 340);
    line (130, 365, 140, 350);
    line (70, 365, 60, 350);
    line (50, 400, 30, 400);
    line (140, 400, 160, 400);
    line (100, 440, 100, 460);
    line (70, 435, 60, 450);
    line (130, 435, 145, 450);
  }
  //moon/ night
  else {
    background (51, 63, 108);
    fill(250, 236, 167);
    ellipse(400, 400, 60, 60);
  }

  //head
  fill(255);
  rect (width/2, height/3, 400, 200);
  //body
  rect (width/2, height*7/10, 100, 150);
  //foot
  ellipse (width*4.5/10, height*9/10, 40, 30);
  ellipse (width*5.5/10, height*9/10, 40, 30);
  //two big eyes (outside)
  ellipse (width/3, height/3, 150, 150);
  ellipse (width*7/10, height/3, 150, 150);

  //initialization of hour, minute, second hand
  float secondHand = map(second(), 0, 60, 0, 2*PI);
  float minuteHand = map(minute(), 0, 60, 0, 2*PI);
  float hourHand = map(hour(), 0, 12, 0, 2*PI);
  float dayHand = map(hour(), 0, 24, 0, 2*PI);

  //rotations of the hour, minute and second hand

  //second hand
  float sx = cos(secondHand-PI/2)*35 + width*5/8;
  float sy = sin(secondHand-PI/2)*35 + height*2/3;
  //minute hand
  float mx = cos(minuteHand-PI/2)*35 + width*7/10;
  float my = sin(minuteHand-PI/2)*35 + height/3;
  //24-hour hand
  float hx = cos(hourHand-PI/2)*35 + width/3;
  float hy = sin(hourHand-PI/2)*35 + height/3;
  //24-hour hand
  float dx = cos(dayHand-PI/2)*35 + width*3/8;
  float dy = sin(dayHand-PI/2)*35 + height*7/10;

  //Drawing the second, minute, 12-hour and 24-hour hand
  //second hand
  fill (0);
  line (width*5/8, height*2/3, sx, sy);
  //minute hand
  ellipse (mx, my, r, r);
  //12-hour hand
  ellipse (hx, hy, r, r);
  //24-hour hand
  line (width*3/8, height*7/10, dx, dy);
}


