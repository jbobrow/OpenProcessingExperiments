
//Jill Goodwyn
//Clock homework
//Carnegie Mellon University
//Electronic Media Studio II
//Section D

void setup()
{
  size(500,500);
  smooth();
}

void draw()
{
  background(150);

  drawComponents();

  // This was to test if the time was outputting correctly
  //
  //  text(seconds,width/2,height/2);
  //  text(minutes,width/3,height/3);
  //
  //  if(hours > 12)
  //  {
  //    text(hours-12,width/4,height/4);
  //  }
  //  else
  //  {
  //    text(hours,width/4,height/4);
  //  }
}

// draws the funky waves pattern in the background.
// these represent the seconds.
void drawComponents()
{
  int seconds = second();
  int minutes = minute();
  int hours = hour();

  // nested for loops to draw those suckers all over the place.
  for(int a=0; a<=width; a+=100)
    for(int b=0; b<=height; b+=100)
    {
      {
        // make the waves white and slightly transparent
        fill(255,255,255,150);
        stroke(0,0,0,150);
        strokeWeight(6);
        // the waves' x and y positions change based on the seconds
        ellipse(a-seconds,b-seconds, 200,200);
        ellipse(a+seconds,b+seconds, 200,200);
      }
    }

  // draw the bar that represents the minutes.
  // it's kind of like a loading bar that goes to 60.
  noStroke();
  fill(0);
  rect(460,0, 25,(height*minutes)/60);
  
  // draw the horizontal line of circles that represents the hours.
  // this is still a little buggy and doesn't always fill the screen correctly.
  // I also want to eventually change this so that it is NOT in military time.
    for(int a=0; a<hours; a++)
  {
    ellipse(((width/hours)/2)+(width/hours)*a,height/2, width/hours,height/hours);
  }
}


