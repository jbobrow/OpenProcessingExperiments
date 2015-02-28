
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
int fade; 
float alpha,alpha1,alpha2;

String[] dayName = {
  "Sunday", "Monday", "Tuesday", "Wednesday",
  "Thursday", "Friday", "Saturday"
};
int w;

void setup() {
  size(200,200);
  xc=width/2;
  yc=height/2;
  //GregorianCalendar gcal = new GregorianCalendar();
  //weekday = gcal.get(Calendar.DAY_OF_WEEK);
  
  date=day();
  months=month();
  years=year();
  w = dow(date, months, years);
  println(w + "  " + dayName[w] );
  
  weekday = w+1;
  weekdayadd=weekday;
  alpha=255;
  alpha1=255;
  alpha2=0;
  frameRate(30);
  background(50);
  
  framesday = 2592000; //2592000
  i = 0;
  daywidth = 94;
  fade = 0;
}

void draw() {
  background(50);    
  //GregorianCalendar gcal = new GregorianCalendar();
  //weekday = gcal.get(Calendar.DAY_OF_WEEK);
  date=day();
  months=month();
  years=year();
  w = dow(date, months, years);
  
  weekday = w + 1;
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

  
  xtoday=xc-h;
  xyester=xtoday-daywidth;
  xtom=xtoday+daywidth;
  xafter=xtom+daywidth;
  xbefore=xyester-daywidth;
  
  fill(230);
  strokeWeight(0);
  rect(4,50,192,71);

  
  if (i % 2 == 0) {
    fill(240);
    rect(4,125,94,25);
    fill(100);
    rect(4,125,h,25);
  }
  else {
    fill(100);
    rect(4,125,94,25);
    fill(240);
    rect(4,125,h,25);
  }
  
  fill(170);
  rect(102,125,94,25);
  
  line(51,125,51,150);
  line(27,125,27,150);
  line(75,125,75,150);
  
  
  switch (weekday) {
    case 1:
      days = "SUNDAY";
      yester = "SATURDAY";
      tom = "MONDAY";
      after = "TUESDAY";
      before = "FRIDAY";
      break;
    case 2:     
      days = "MONDAY";
      yester = "SUNDAY";
      tom = "TUESDAY";
      after = "WEDNESDAY";
      before = "SATURDAY";
      break;
    case 3:
      days = "TUESDAY";
      yester = "MONDAY";
      tom = "WEDNESDAY";
      after = "THURSDAY";
      before = "SUNDAY";
      break;
    case 4:
      days = "WEDNESDAY";
      yester = "TUESDAY";
      tom = "THURSDAY";
      after = "FRIDAY";
      before = "MONDAY";
      break;
    case 5:
      days = "THURSDAY";
      yester = "WEDNESDAY";
      tom = "FRIDAY";
      after = "SATURDAY";
      before = "TUESDAY";
      break;
    case 6:
      days = "FRIDAY";
      yester = "THURSDAY";
      tom = "SATURDAY";
      after = "SUNDAY";
      before = "WEDNESDAY";
      break;
    case 7:
      days = "SATURDAY";
      yester = "FRIDAY";
      tom = "SUNDAY";
      after = "MONDAY";
      before = "THURSDAY";
      break;
  }
 
    //if (s==0) {
    if (weekdayadd != weekday) {

    fade = 1;
    fill(50);
    stroke(50);
    textSize(15);
    textAlign(CENTER,CENTER);
    text(yester,149,136);
  }
  
  else if (fade == 1) {  
    alpha1--;
    alpha = alpha1;
    fill(50,alpha);
    stroke(50,alpha);
    textSize(15);
    textAlign(CENTER,CENTER);
    text(yester,149,136);
    if (alpha == 0) {
      fade = 2;
    }   
  }
  
  else if (fade == 2) {
    alpha2++;
    alpha = alpha2;
    fill(50,alpha);
    stroke(50,alpha);
    textSize(15);
    textAlign(CENTER,CENTER);
    text(days,149,136);
    if (alpha == 255) {
      fade = 0;
      alpha1 = 255;
      alpha2 = 0;
    }    
  }
  
  else {
    fill(50);
    stroke(50);
    textSize(15);
    textAlign(CENTER,CENTER);
    text(days,149,136);
  }
  
  stroke(50);
  fill(50);
  line(51,125,51,150);
  line(27,125,27,150);
  line(75,125,75,150);
  
  textSize(64);
  text("10:30",xc,79);
  weekdayadd=weekday;  
}

// d = day in month
// m = month (January = 1 : December = 12)
// y = 4 digit year
// Returns 0 = Sunday .. 6 = Saturday
public int dow(int d, int m, int y) {
  if (m < 3) {
    m += 12;
    y--;
  }
  return (d + int((m+1)*2.6) +  y + int(y/4) + 6*int(y/100) + int(y/400) + 6) % 7;
}


