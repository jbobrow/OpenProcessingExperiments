
//import java.util.GregorianCalendar;
//import java.util.Calendar;
//import java.util.Date;
int xc,yc;

float xtoday, xyester, xtom, xafter, xbefore;

String days, yester, tom, after, before;
int i;
int framesday;
float daywidth;
float dayangle;
int weekday, weekdayadd;
color daycolor, yestercolor,stroke1,stroke2,stroke3;
int fade;
float alpha,alpha1,alpha2;

void setup() {
  size(200,200);
  xc=width/2;
  yc=72;
  daywidth = 160;
  fade = 0;
  //GregorianCalendar gcal = new GregorianCalendar();
  //weekday = gcal.get(Calendar.DAY_OF_WEEK);
  weekday = day() % 7 - 1;
  weekdayadd=weekday;
  alpha=255;
  alpha1=255;
  alpha2=0;
  stroke1=daycolor;
  stroke2=daycolor;
  stroke3=daycolor;
  
  framesday = 2592000; //2592000
  i = 0;
  frameRate(30);

  background(50);
  
}

void draw() {    
  //GregorianCalendar gcal = new GregorianCalendar();
  //weekday = gcal.get(Calendar.DAY_OF_WEEK);
  weekday = day() % 7 - 1;
  if (weekdayadd != weekday) {
    i++;
    i=i % 2;
  }
  
  float s;
  s = map(second(), 0, 60, 0, daywidth);
  float m;
  m = map(minute() + norm(second(), 0, 60), 0, 60, 0, (daywidth));
  float h;
  h = map(hour() + norm(minute(), 0, 60) + norm(second(), 0, 3600), 0, 24, 0, (daywidth));
  float hours;
  hours = map(hour() + norm(minute(), 0, 60) + norm(second(), 0, 3600), 0, 24, 0, TWO_PI) - HALF_PI;

  if (h < 40) {
    stroke1 = daycolor;
    stroke2 = daycolor;
    stroke3 = daycolor;
  }
  else if (h < 80) {
    stroke1 = 50;
    stroke2 = daycolor;
    stroke3 = daycolor;
  }
  else if (h<120) {
    stroke1 = 50;
    stroke2 = 50;
    stroke3 = daycolor;
  }
  else {
    stroke1 = 50;
    stroke2 = 50;
    stroke3 = 50;
  }
  
  //println(h);
  
  switch (weekday) {
    case 1:
      days = "SUNDAY";
      yester = "SATURDAY";
      tom = "MONDAY";
      after = "TUESDAY";
      before = "FRIDAY";
      daycolor = #990EC4;
      yestercolor = #5A21B7;
      break;
    case 2:     
      days = "MONDAY";
      yester = "SUNDAY";
      tom = "TUESDAY";
      after = "WEDNESDAY";
      before = "SATURDAY";
      daycolor = #FF0000;
      yestercolor = #990EC4;
      break;
    case 3:
      days = "TUESDAY";
      yester = "MONDAY";
      tom = "WEDNESDAY";
      after = "THURSDAY";
      before = "SUNDAY";
      daycolor = #FF6F00;
      yestercolor = #FF0000;
      break;
    case 4:
      days = "WEDNESDAY";
      yester = "TUESDAY";
      tom = "THURSDAY";
      after = "FRIDAY";
      before = "MONDAY";
      daycolor = #FEFF00;
      yestercolor = #FF6F00;
      break;
    case 5:
      days = "THURSDAY";
      yester = "WEDNESDAY";
      tom = "FRIDAY";
      after = "SATURDAY";
      before = "TUESDAY";
      daycolor = #04B202;
      yestercolor = #FEFF00;
      break;
    case 6:
      days = "FRIDAY";
      yester = "THURSDAY";
      tom = "SATURDAY";
      after = "SUNDAY";
      before = "WEDNESDAY";
      daycolor = #0C5DCB;
      yestercolor =#04B202;
      break;
    case 7:
      days = "SATURDAY";
      yester = "FRIDAY";
      tom = "SUNDAY";
      after = "MONDAY";
      before = "THURSDAY";
      daycolor = #5A21B7;
      yestercolor =#0C5DCB;
      break;
  }   
  
  //if (s==0) {
  if (weekdayadd != weekday) {
    fade = 1;
    fill(yestercolor);
    rect(0,0,200,200);
    fill(50);
    stroke(50);
    textSize(28);
    textAlign(CENTER,CENTER);
    text(yester,xc,yc);
    //fill(yestercolor);
    noFill();
    rect(20,125,160,25);
    fill(yestercolor);
    //rect(20,125,h,25);
    stroke(50,alpha);
    line(60,126,60,149);
    stroke(50,alpha); 
    line(100,126,100,149);
    stroke(50,alpha);
    line(140,126,140,149);    
  }
  
  else if (fade == 1) {  
  
    alpha1--;
    alpha = alpha1;
    background(daycolor);
    fill(yestercolor,alpha);
    rect(0,0,200,200);   
    fill(50,alpha);
    stroke(50,alpha);
    textSize(28);
    textAlign(CENTER,CENTER);
    text(yester,xc,yc);
    //fill(yestercolor);
    noFill();
    rect(20,125,160,25);
    fill(yestercolor);
    //rect(20,125,h,25);
    stroke(50,alpha);
    line(60,126,60,149);
    stroke(50,alpha); 
    line(100,126,100,149);
    stroke(50,alpha);
    line(140,126,140,149);    
    if (alpha == 0) {
      fade = 2;
    }
    
  }
  else if (fade == 2) {
    alpha2++;
    alpha = alpha2;
    background(daycolor);
    fill(175,alpha);
    fill(50,alpha);
    stroke(50,alpha);
    textSize(28);
    textAlign(CENTER,CENTER);
    text(days,xc,yc);
    fill(50,alpha);
    rect(20,125,160,25);
    fill(daycolor,alpha);
    rect(20,125,h,25);
    stroke(stroke1,alpha);
    line(60,126,60,149);
    stroke(stroke2,alpha); 
    line(100,126,100,149);
    stroke(stroke3,alpha);
    line(140,126,140,149);    
    if (alpha == 255) {
      fade = 0;
      alpha1 = 255;
      alpha2 = 0;
    }
    
  }
  else {
  background(daycolor);
  
  fill(50);
  stroke(50);
  textSize(28);
  textAlign(CENTER,CENTER);
  text(days,xc,yc);
  fill(50);
  rect(20,125,160,25);
  fill(daycolor);
  rect(20,125,h,25);
  stroke(stroke1,alpha);
  line(60,126,60,149);
  stroke(stroke2,alpha); 
  line(100,126,100,149);
  stroke(stroke3,alpha);
  line(140,126,140,149);
  }
  
  //println(fade);
  weekdayadd=weekday;  
}


