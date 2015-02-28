
int wCen,hCen,
wCen2,hCen2, 
wCen3,hCen3, 
wCen4,hCen4,
wCen5,hCen5,

myCir,myCirr,myCirrr,

myR1, myR2, myR3,
mmyR1, mmyR2, mmyR3,
mmmyR3,  mmmyR2,  mmmyR1;

PImage a,c,d,e,g;
PFont f,f2; 


void setup() {
  size(360,600);
  a = loadImage("bg.jpg");
  c = loadImage("alice.png");
  d = loadImage("mouse.png");
  e = loadImage("rabbit.png");
  g = loadImage("s.png");

  f =  loadFont ("MSReferenceSansSerif-11.vlw");
  f2 =  loadFont ("MSReferenceSansSerif-10.vlw");
}



void draw() {

  wCen = 145; 
  hCen = 160; 

  wCen2 = 295; 
  hCen2 = 298; 

  wCen3 = 65; 

  hCen3 = 410; 
  hCen4 = 465; 
  hCen5 = 520; 


  myCir = 200; 
  myR1 = myCir/2 -2;
  myR2 = myCir/2 - 20;
  myR3 = myCir/2 -40;

  myCirr = 100; 
  mmyR1 = myCirr/2 -10;
  mmyR2 = myCirr/2 - 20;
  mmyR3 = myCirr/2 -30;

  //small clock
  myCirrr = 60;
  mmmyR1 = myCirrr/2 -15;




  //movement 
  background(0);
  image(a,180,300);
  float sln = map(second(), 0, 60, 110, 320);
  float mln = map(minute(), 0, 60, 110, 320);
  float hln = map(hour(), 0, 24, 110, 320);
  strokeWeight(2);


  imageMode(CENTER);
  //h alice
  image(e,hln,410,35,55);
  //m mouse
  image(d,mln,465,40,47);
  //s alice
  image(c,sln,520,35,50);







  //calander
  fill(0,191,219);
  int d = day();
  int mt = month();
  int y = year();

  textFont(f);
  String t  = nf(y, 2)+ "." + nf( mt, 2) +"." + nf(d, 2);
  textAlign(CENTER);
  text(t,80,310);

  if (d == 31) {
    println("Welcome to a new month.");
  }

  //auto clock
  int as = second();
  int am = minute();
  int ah = hour();
  String time = nf(ah,2) + ":" + nf(am,2) + ":" +nf(as,2);
  text(time,180,310);




  //clock1
    image(g,wCen,hCen);
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;  
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float h= map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;
  stroke(106,206,248);
  strokeWeight(1);
  line (wCen, hCen,cos(s) * myR1 +wCen, sin(s) * myR1+hCen);
  imageMode(CENTER); image(g, cos(s) * myR1 +wCen, sin(s) * myR1+hCen,20,26);
  strokeWeight(2);
  line (wCen, hCen,cos(m) * myR2 +wCen, sin(m) * myR2+hCen);
  strokeWeight(3);
  line (wCen, hCen,cos(h) * myR3 +wCen, sin(h) * myR3+hCen);



  //clock2

  float s2 = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;  
  float m2 = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float h2= map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;
  stroke(1,173,185);
  strokeWeight(1);
 line (wCen2, hCen2,cos(s) * mmyR1 +wCen2, sin(s) * mmyR1+hCen2);
  imageMode(CENTER); image(g, cos(s) * mmyR1 +wCen2, sin(s) * mmyR1+hCen2,17,22);
  line (wCen2, hCen2,cos(m) * mmyR2 +wCen2, sin(m) * mmyR2+hCen2);
  line (wCen2, hCen2,cos(h) * mmyR3 +wCen2, sin(h) * mmyR3+hCen2);




  //small auto clock h-m-s
  fill(255);
  textFont(f2);
  int sah = hour();
  String stimeh = nf(sah,2);
  text(stimeh,30,415);

  int sam = minute();
  String stimem = nf(sam,2);
  text(stimem,30,470);

  int sas = second();
  String stimes = nf(sas,2);
  text(stimes,30,525);







  //smallclock

  //circle
  fill(0);
  smooth();
  stroke(30);
  strokeWeight(1);
  ellipse(65, 410, 40,40);
  ellipse(65, 465, 40,40);
  ellipse(65, 520, 40,40);


  //clock3 h mmmyR3
  stroke(255);
  strokeWeight(1);

  float h3= map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;
  line (wCen3, hCen3,cos(h) * mmmyR1 +wCen3, sin(h) * mmmyR1+hCen3);



  //clock4  mmmyR2

  float m3 = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  line (wCen3, hCen4,cos(m) * mmmyR1 +wCen3, sin(m) * mmmyR1+hCen4);


  //clock5  mmmyR1
  float s3 = map(second(), 0, 60, 0, TWO_PI) - HALF_PI; 
  line (wCen3, hCen5,cos(s) * mmmyR1 +wCen3, sin(s) * mmmyR1+hCen5);
}


