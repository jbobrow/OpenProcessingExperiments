
/*
 Konkuk University
 SOS iDesign
 
 Name:Lim Hyun Seung
 ID: 201420104 Lim Hyun Seung
 
 */

//Seed, float
float x, y, seed=300, f, stepSize=5;
double df=0, ddf=2*PI/seed, dddf=0.000000005; 
int i=3;
int startTime=3600*hour()+60*minute()+second(); 



void setup() { 
  size(600, 600); 
  background(255);
  //Font
  font = createFont("VinerHandITC", 66);
}
PFont font;

void draw() { 
  x=width/2;
  y=height/2;
  textFont(font);
  f=0;
  df=0;
  ddf=2*PI*(startTime+millis()/120.0)/86400.0; 

  //S-M-H Text
  textAlign(CENTER, CENTER);
  fill(255);
  text(second(), 150+(50*cos(x-PI/2)), 150+(50*sin(y-PI/2)));
  text(minute(), 150+(70*cos(x-PI/2)), 90+(70*sin(y-PI/2)));
  text(hour()%12, 150+(90*cos(x-PI/2)), 40+(90*sin(x-PI/2)));

  //Hyun Seung Clock Text   
  fill(50, 255, 220);
  textSize(55);
  text("LHS CLOCK", 320, 500);
  if (mousePressed == true) {
    for (int x = -20; x < width; x += 20) {
      float mx = mouseX / 2;
      float HyunSeungSet = random(-mx, mx);
      textSize(65);
      fill(random(255), random(255), random(255));
      text("01010101", x - HyunSeungSet, 500);
    }
  }


  //LINE
  strokeWeight (3);
  //Second
  strokeWeight(3);
  stroke (random(255), random(255), random(255), random(255));
  line (x, y, x+157*sin(second()*TWO_PI/60.0), y-170*cos(second()*TWO_PI/60.0));
  //Minute
  strokeWeight(2);
  stroke (128, 255, 0, 8);
  line (x, y, x+120*sin(minute()*TWO_PI/60.0+second()*TWO_PI/3600.0), y-120*cos(minute()*TWO_PI/60.0+second()*TWO_PI/3600.0));
  //Hour
  strokeWeight(2);
  stroke (0, 128, 255, 8);
  line (x, y, x+60*sin(hour()*TWO_PI/12.0+minute()*TWO_PI/3600.0), y-60*cos(hour()*TWO_PI/12.0+minute()*TWO_PI/3600.0));


  //Ellipse
  ellipseMode(CENTER);
  fill(0, 120, 130);
  ellipse (x+557*sin(second()*TWO_PI/60.0), y-170*cos(second()*TWO_PI/60.0), 48, 48);
  fill(255, 120, 0);
  ellipse (x+157*sin(second()*TWO_PI/60.0), y-170*cos(second()*TWO_PI/60.0), 8, 8);
  fill(255, 220, 130);
  ellipse (x+357*sin(second()*TWO_PI/60.0), y-270*cos(second()*TWO_PI/60.0), 48, 48);
  fill (120, 255, 130);
  ellipse(x+120*sin(minute()*TWO_PI/60.0+second()*TWO_PI/3600.0), y-120*cos(minute()*TWO_PI/60.0+second()*TWO_PI/3600.0), 12, 12);
  fill(0, 220, 255);
  ellipse(x+60*sin(hour()*TWO_PI/12.0+minute()*TWO_PI/3600.0), y-60*cos(hour()*TWO_PI/12.0+minute()*TWO_PI/3600.0), 32, 32);
  println(hour()+":"+minute()+":"+second());
  println(sin(hour()*TWO_PI/12.0));
  println(cos(hour()*TWO_PI/12.0));
  fill(0, 6);
  stroke(255);
  rect(0, 0, width, height);
  for (i=3; i<360; i+=2) {
    stroke (sq(i+100)/180, 122-(sq(i-200)/180), i);
    f+=df;
    df+=ddf;
    x+=stepSize*cos(f);
    y+=stepSize*sin(f);
    point(x, y);
  }
}

