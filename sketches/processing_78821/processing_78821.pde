
int lastSecond;
void setup () {
  size (400, 400);
}

void draw () {
  background (200);
  if (second () == 0)
  if (hour () == 0) {
  }
  //  if (lastSecond != second()) {
  //    println (lastSecond + " "+ second());
  //    fill (255,0,0);
  //    ellipse (random (width), random (height), 20, 20);
  //    lastSecond = second ();
  //  }
  //}
  fill (255);
  text (hour(), 10, 30);
  text (minute(), 30, 30);
  text (second(), 50, 30);
  ellipse (hour (), 80, 20, 20);
  ellipse (minute (), 110, 20, 20);
  ellipse (second (), 140, 20, 20);
  
  fill (255,0,0);
  ellipse (200, 80, second (), second ());
  fill (0, 0, 0, 180);
  ellipse (200, 80, minute (), minute ());
}

// http://www.youtube.com/watch?v=8rJR4ExTsQs&feature=related

//int m = minute
//int s = second
//
//void setup () {
//  size (400, 400);
//}
//
//void draw () {
//  if (second () == 0 {
//  background (200);
//  text (m, 10, 30);
//  text (s, 10, 50); 
//  
//}


