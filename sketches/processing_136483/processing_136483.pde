
//import java.util.GregorianCalendar;
//import java.util.Calendar;
//import java.util.Date;
int xc,yc;
float angle;
int radiusi, radiuso;
float innerx, innery, outerx, outery;
float frequency;
String days, yester, tom, after, before;
int i, ii;

int framesday;

int weekday, weekdayadd;
float alpha,alpha1,alpha2;
int fade;



void setup() {
  size(200,200);
  xc=width/2;
  yc=height/2;
  radiusi=55;
  radiuso=90;
  angle=3*PI/2;
  alpha = 255;
  alpha1 = 255;
  alpha2 = 0;
  //GregorianCalendar gcal = new GregorianCalendar();  
  //weekday = gcal.get(GregorianCalendar.DAY_OF_WEEK);
  weekday = day() % 7 -1;
  weekdayadd = weekday;
  frameRate(30);
  fade = 0;
  background(50);
  i= 0;
  ii=0;
  framesday = 2592000; //2592000
}

void draw() {
  background(50);
  weekday = day() % 7 - 1;
  //weekdayadd=weekday + 7 % 14;
  //GregorianCalendar gcal = new GregorianCalendar();  
  //weekday = gcal.get(GregorianCalendar.DAY_OF_WEEK);
  if (weekdayadd != weekday) {
    i++;
    i=i % 2;
  }
  
  
  float s;
  s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m;
  m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float h;
  h = map(hour() + norm(minute(), 0, 60) + norm(second(), 0, 3600), 0, 24, 0, TWO_PI) - HALF_PI;
  angle = h;
  
  
  innerx=xc+cos(angle)*(radiusi);
  innery=yc+sin(angle)*(radiusi);
  outerx=xc+cos(angle)*(radiuso);
  outery=yc+sin(angle)*(radiuso);
  if (i % 2 == 0) {  
    stroke(50);
    fill(100); //230
    strokeWeight(3);
    ellipse(xc,yc,2*radiuso+2,2*radiuso+2);
    
    strokeWeight(0);
    stroke(240);
    fill(240);
    arc(xc,yc,2*radiuso,2*radiuso,-PI/2,angle);
  }
  else {
    fill(240);
    strokeWeight(3);
    ellipse(xc,yc,2*radiuso+2,2*radiuso+2);
    
    strokeWeight(0);
    stroke(100); //230
    fill(100); //230
    arc(xc,yc,2*radiuso,2*radiuso,-PI/2,angle);
  }
  stroke(50);
  noFill(); //230
  strokeWeight(3);
  ellipse(xc,yc,2*radiuso,2*radiuso);
  
  stroke(50);
  strokeWeight(3);
  fill(175);
  ellipse(xc,yc,2*radiusi-4,2*radiusi-4);
  
  stroke(50);
  strokeWeight(3.5);
  line(innerx,innery,outerx,outery);
  
  /*
  stroke(230);
  strokeWeight(1);
  line(xc,yc-radiuso+1,xc,yc-radiusi);
  */
  
  switch (weekday) {
    case 1:
      days = "N";
      yester = "S";
      tom = "M";
      after = "T";
      before = "F";
      break;
    case 2:     
      days = "M";
      yester = "N";
      tom = "T";
      after = "W";
      before = "S";
      break;
    case 3:
      days = "T";
      yester = "M";
      tom = "W";
      after = "H";
      before = "N";
      break;
    case 4:
      days = "W";
      yester = "T";
      tom = "H";
      after = "F";
      before = "M";
      break;
    case 5:
      days = "H";
      yester = "W";
      tom = "F";
      after = "S";
      before = "T";
      break;
    case 6:
      days = "F";
      yester = "H";
      tom = "S";
      after = "N";
      before = "W";
      break;
    case 7:
      days = "S";
      yester = "F";
      tom = "N";
      after = "M";
      before = "H";
      break;
  }
  
  
  if (weekdayadd != weekday) {

    fade = 1;
    fill(50);
    stroke(50);
    textSize(84);
    textAlign(CENTER,CENTER);
    text(yester,xc,yc-7);

  }
  
  else if (fade == 1) {
  
  
    alpha1--;
    alpha = alpha1;
    fill(50,alpha);
    stroke(50);
    textSize(84);
    textAlign(CENTER,CENTER);
    text(yester,xc,yc-7);
    if (alpha == 0) {
      fade = 2;
    }
    
  }
  else if (fade == 2) {
    alpha2++;
    alpha = alpha2;
    fill(50,alpha);
    stroke(50);
    textSize(84);
    textAlign(CENTER,CENTER);
    text(days,xc,yc-7);
    if (alpha == 255) {
      fade = 0;
      alpha1 = 255;
      alpha2 = 0;
    }
    
  }
  
  else {
    fill(50);
    stroke(50);
    textSize(84);
    textAlign(CENTER,CENTER);
    text(days,xc,yc-7);
  }
  //println(fade);
  weekdayadd=weekday;
}


