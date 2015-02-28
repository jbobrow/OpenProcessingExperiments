


void setup() {
  size(350,500);
  PImage robotbody = loadImage("body.png");
  PImage robotarm = loadImage("arm.png");
  PImage robotarm2 = loadImage("arm2.png");
}
void draw() {
  background(255);  
  PImage robotbody = loadImage("body.png");
  PImage robotarm = loadImage("arm.png");
  PImage robotarm2 = loadImage("arm2.png");
  PImage thing = loadImage("thing.png");
  PImage thing2 = loadImage("thing.png");

  PFont num = loadFont("Helvetica95-Black-100.vlw");
  PFont num2 = loadFont("Helvetica43-ExtendedLight-100.vlw");
  textFont(num);


  int s = second();
  int m = minute();
  int h = hour();
  int d = day();
  int y = year();
  int t = month();

  float siz1 = map(s,0,60,130,0);
  float mov1 = map(s,0,60,240,370);
  float siz2 = map(m,0,60,150,0);
  float mov2 = map(m,0,60,220,370);
  float siz3 = map(s,0,60,83,0);
  float mov3 = map(s,0,60,180,370);
  float siz4 = map(m,0,60,83,0);
  float mov4 = map(m,0,60,180,370);

  String HOUR = nf(h,2);
  String MINUTE =nf(m,2);
  String MONTHANDDAY = nf(t,2) +"/"+nf(d,2);
  String YEAR=nf(y,2);

  fill(190,18,17);
  textSize(48);
  text(HOUR,75,180,100,50);

  fill(190,18,17);
  textSize(48);
  text(MINUTE,205,180,100,50);

  fill(250,204,73);
  textSize(100);
  text(YEAR,70,130);
  
  
  textFont(num2); 
  fill(238,84,34);
  textSize(25);
  text(MONTHANDDAY,75,160);


  image (robotbody,100,300,150,200);
  image (robotarm,205,mov1,90,siz1);
  image (robotarm2,35,mov2,154,siz2);
  image (thing,205,mov3,80,siz3);
  image (thing2,75,mov4,80,siz4);
  
  
  

  
  
  smooth();
  
}


