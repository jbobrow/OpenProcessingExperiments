
/* simple code by Justin McKeown for working out age in milliseconds with modifcations by Clare Nattress */

PFont font;
long mls;
long secs;
long mins;
long hrs;
long days;
long months;
long yrs;

long claresAge;


void setup()
{
  size(600, 300);
  font = loadFont("Monospaced-48.vlw");
  textFont(font);
  frameRate(600);
}

void draw()
{
  long ageNow = howOldisClare();
  println(ageNow);


  background(0);
  textSize(60);
  fill(255);
  String s =""+ ageNow; //print current age
  text(s, width/7, height/2.2);
}


long howOldisClare()
{
  mls = millis(); // this passes the value of the internal clocks milisecond count to the varibale mls
  secs = second();
  mins = minute()-45;
  hrs = hour()-23;
  days = day()-17;
  months = month()-10;
  yrs = year()-1988;

  long age = (yrs*31556926L*1000)+(days*86400L*1000)+(hrs*3600L*1000)+(mins*60L*1000)+(secs*100L)+(mls);

  return age;
}


