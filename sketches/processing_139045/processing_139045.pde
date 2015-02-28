
//import java.util.GregorianCalendar;
//import java.util.Calendar;
//import java.util.Date;
int xc,yc;
float angle;
int radius1, radius2;
float innerx, innery, outerx, outery;
float frequency;
String days;
int i;
int framesday; 
int weekday;
int weekdayadd;
int years,dates,months;
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
  radius1=55;
  radius2=90;
  angle=3*PI/2;
  i = 0;
  framesday = 2592000; //2592000
  frameRate(30);
  alpha=255;
  alpha1=255;
  alpha2=0;
  background(50);
  date=day();
  months=month();
  years=year();
  w = dow(date, months, years);
  println(w + "  " + dayName[w] );
  weekday = w+1;
  weekdayadd=weekday;
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
  //weekday = day() % 7 - 1;
  weekday = w + 1;
  float s;
  s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m;
  m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float h;
  h = map(hour() + norm(minute(), 0, 60) + norm(second(), 0, 3600), 0, 24, 0, TWO_PI) - HALF_PI;
  angle = h;
  
  
  innerx=xc+cos(angle)*(radius1);
  innery=yc+sin(angle)*(radius1);
  outerx=xc+cos(angle)*(radius2);
  outery=yc+sin(angle)*(radius2);
  fill(240);
  strokeWeight(3);
  ellipse(xc,yc,2*radius2+2,2*radius2+2);
  fill(175);
  ellipse(xc,yc,2*radius1-4,2*radius1-4);
  
  stroke(50);
  strokeWeight(3.5);
  line(innerx,innery,outerx,outery);
  //strokeWeight(1);
  //line(xc,yc-radius2,xc,yc-radius1);
  
  
  switch(weekday) {
    case 1:
      days = "N";
      yester = "S";
      break;
    case 2:
      days = "M";
      yester = "N";
      break;
    case 3:
      days = "T";
      yester = "M";
      break;
    case 4:
      days = "W";
      yester = "T";
      break;
    case 5:
      days = "H";
      yester = "W";
      break;
    case 6:
      days = "F";
      yester = "H";
      break;
    case 7:
      days = "S";
      yester = "F";
      break;
  }
  /*
  if (weekday == 1) {
    day = "U";
  } 
  else if (weekday == 2) {
    day = "M";
  }
  else if (weekday == 3) {
    day = "T";
  }
  else if (weekday == 4) {
    day = "W";
  }
  else if (weekday == 5) {
    day = "R";
  }
  else if (weekday == 6) {
    day = "F";
  }
  else if (weekday == 7) {
    day = "S";
  }
  */
  
  if (weekdayadd != weekday) {

    fade = 1;
    fill(50);
    stroke(50);
    textSize(84);
    textAlign(CENTER,CENTER);
    text(yester,xc,yc);
  }
  
  else if (fade == 1) {  
    alpha1--;
    alpha = alpha1;
    fill(50,alpha);
    stroke(50);
    textSize(84);
    textAlign(CENTER,CENTER);
    text(yester,xc,yc);
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
    text(days,xc,yc);
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
    text(days,xc,yc);
  }
  
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


