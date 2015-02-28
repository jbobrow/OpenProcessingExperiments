
float seconds, minutes, hours, days, years;
String[] months = new String [13];
int reds, green, blue;
PImage hr1, hr2, hr3, hr4, hr5, hr6, hr7, hr8, hr9, hr10, hr11, hr12;
PImage man, sun, moon, water, earth, fire, air;
PFont font;
void setup() {
  size (500, 500);
  months[1]="January";
  months[2]="February";
  months[3]="March";
  months[4]="April";
  months[5]="May";
  months[6]="June";
  months[7]="July";
  months[8]="August";
  months[9]="September";
  months[10]="October";
  months[11]="November";
  months[12]="December";
  hr1=loadImage("1.png");
  hr2=loadImage("2.png");
  hr3=loadImage("3.png");
  hr4=loadImage("4.png");
  hr5=loadImage("5.png");
  hr6=loadImage("6.png");
  hr7=loadImage("7.png");
  hr8=loadImage("8.png");
  hr9=loadImage("9.png");
  hr10=loadImage("10.png");
  hr11=loadImage("11.png");
  hr12=loadImage("12.png");
  man=loadImage("Man.png");
  sun=loadImage("Sun.png");
  moon=loadImage("moon.png");
  earth=loadImage("Earth.png");
  air=loadImage("Air.png");
  water=loadImage("Water.png");
  fire=loadImage("Fire.png");
  font = createFont("Hell.ttf", 32);
}


void draw () {

  seconds= second();
  minutes = minute();
  hours= hour();
  days= day ();
  years= year();

  ///////////////////Seconds change color every 10 seconds
  pushMatrix();
  background(reds, green, blue);
  if (second() >= 0 && second ()<=9) {///red
    green=0;
    blue=0;
    reds++;
  }
  else if (second() >= 10&& second ()<= 19) {//////pink
    reds=132;
    blue++;
  }
  else if (second() >= 20 && second ()<= 29) {///blue
    green=0;
    reds--;
    blue=132;
  }
  else if (second() >= 30 && second ()<=39) {////green
    green++;
    reds=0;
    blue--;
  }
  else if (second() >= 40&& second ()<=49) {///yellow
    blue--;
    reds++;
  }
  else if (second() >= 50 && second ()<=59) {//orange
    green--;
    blue++;
  }
  popMatrix();
  pushMatrix();
  image(man, 0, 0);
  popMatrix();
  //////////////////////////////////////////////////////////////HOURS
  pushMatrix();
  if (hour()==13 || hour()==1) {
    image(hr1, 230, 113);
  }
  if (hour()==14 || hour()==2) {
    image(hr2, 230, 113);
  }
  if (hour()==15 || hour()==3) {
    image(hr3, 230, 113);
  }
  if (hour()==16 || hour()==4) {
    image(hr4, 230, 113);
  }
  if (hour()==17 || hour()==5) {
    image(hr5, 230, 113);
  }
  if (hour()==18 || hour()==6) {
    image(hr6, 230, 113);
  }
  if (hour()==19 || hour()==7) {
    image(hr7, 230, 113);
  }
  if (hour()==20 || hour()==8) {
    image(hr8, 230, 113);
  }
  if (hour()==21 || hour()==9) {
    image(hr9, 230, 113);
  }
  if (hour()==22 || hour()==10) {
    image(hr10, 230, 113);
  }
  if (hour()==23 || hour()==11) {
    image(hr11, 230, 113);
  }
  if (hour()==0 || hour()==12) {
    image(hr12, 230, 113);
  }
  popMatrix();
  //////////////////////////////////////////////////////////////MINUTE
  pushMatrix();
  float minuteRot = map(minutes, 0, 59, 0, 360);
  translate(width/2, height/2);
  rotate(radians(minuteRot));
  image(sun, -100, -300);

  popMatrix();
////////////////////////////////////////////////////////MONTHS
  pushMatrix();
  float monthsRot = map(month(), 0, 11, 0, 360);
  translate(width/2, height/2);
  rotate(radians(monthsRot));
  image(moon, -100, -300);
  popMatrix();
  pushMatrix();
  textSize(28);
  fill(190);
  /////////Water
  if (month() == 12 ||month() ==1 || month() ==2) {   
    image(water, 0, 0);
    text(""+ months[month()], 10, 40);
  }
  else {
    image(water, -30, -30);
  }
  /////Air
  if (month() == 3 ||month() ==4 || month() == 5) {
    image(air, 370, 0); 
    text(""+ months[month()], 350, 40);
  }
  else {
    image(air, 370, -40);
  }
  /////Earth
  if (month() == 6 ||month() ==7 || month() == 8) {
    image(earth, 340, 340);
    text(""+ months[month()], 350, 480);
  }
  else {
    image(earth, 340, 340);
  }
  /////////Fire
  if (month() == 9 ||month() ==10 || month() == 11) {
    image(fire, 0, 370);
    text(""+ months[month()], 10, 480);
  }
  else {
    image(fire, -20, 400);
  }
  popMatrix();

  ///////////////////////////////////////////DAYS
  pushMatrix();
  fill(0);
  textFont(font, 40);
  text((int)days, 140, 270);
  text((int)years, 320, 270);
  popMatrix();

  /////////////////////////////PRINTLN
  pushMatrix();
  println("HR"+ (int)hours);
  println("sec"+ (int)seconds);
  popMatrix();
}



