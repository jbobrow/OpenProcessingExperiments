

PImage a;
PFont f;
PFont FONT;

void setup() {
  size (360,600);
  stroke(255);
  smooth();
  a= loadImage("brookcut.png");
  //f= loadFont("28DaysLater-48.vlw");
  //textFont(f);
  FONT= loadFont("AgencyFB-Reg-48.vlw");
  textFont(FONT);
}


void draw () {
  background(0);


  float s = map(second(),0,60,40,width-40);
  float m = map(minute(),0,60,40,width-40);
  float h = map(hour(),0,24,40,width-40);
  smooth();
    noFill();
  stroke(255);  
strokeWeight(3);
  ellipse(h,100,60,60);

  ellipse(m,100,30,30);

  ellipse(s,100,10,10);

  imageMode(CENTER);
  image(a, 180,163);



  noFill();
  strokeWeight(8);
  stroke(255,0,0);
  rect(2,328,356,240);
textSize(48);
  textAlign(CENTER);
  tint(255,0,0);
  text("TIME is GONE",178,500);

  int d = day();
  int M = month();
  int y = year();

textSize(20);
  String time  = nf(y, 2)+ "." + nf( M, 2) +"." + nf(d, 2);
  textAlign(CENTER);
  text(time, 178,460);
  
   int ss = second();
  int mm = minute();
  int hh = hour();

  String timetime  = nf( hh, 2)+ " : " + nf( mm, 2) +" : " + nf( ss, 2);


  textAlign(CENTER);
  text(timetime, width/2, height/2);
}


