
//import java.util.GregorianCalendar;
//import java.util.Calendar;
//import java.util.Date;
int xc,yc;
float angle, dayangle, hourangle, daytimeangle;
int radiusi, radiuso, radius;
float innerx, innery, outerx, outery, dayxi, dayyi, dayxo, dayyo;
float frequency;
String days;
int i;

int framesday;

int weekday;
int weekdayadd;
int years,dates,months;

String[] dayName = {
  "Sunday", "Monday", "Tuesday", "Wednesday",
  "Thursday", "Friday", "Saturday"
};
int w;

void setup() {
  size(200,200);
  xc=width/2;
  yc=height/2;
  radiusi=55;
  radiuso=90;
  radius=(radiusi+radiuso)/2;
  angle=3*PI/2;

  i=0;
  framesday = 2592000; //2592000
  frameRate(30);

  background(50);

  date=day();
  months=month();
  years=year();
  w = dow(date, months, years);
  println(w + "  " + dayName[w] );

}

void draw() {
  background(50);
  //GregorianCalendar gcal = new GregorianCalendar();  
  //weekday = gcal.get(GregorianCalendar.DAY_OF_WEEK);
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
  hourangle = map(hour() + norm(minute(), 0, 60) + norm(second(), 0, 3600), 0, 24, 0, TWO_PI/7) - HALF_PI;
  daytimeangle = dayangle*(weekday-1)+hourangle;
  innerx=xc+cos(angle)*(radiusi);
  innery=yc+sin(angle)*(radiusi);
  outerx=xc+cos(angle)*(radiuso);
  outery=yc+sin(angle)*(radiuso);
  dayxi=xc+cos(daytimeangle)*(radiusi);
  dayyi=yc+sin(daytimeangle)*(radiusi);
  dayxo=xc+cos(daytimeangle)*(radiuso);
  dayyo=yc+sin(daytimeangle)*(radiuso);
  
  fill(230);
  strokeWeight(3);
  ellipse(xc,yc,2*radiuso+2,2*radiuso+2);
  /*
  if (weekdayadd % 2 == 0) {
    stroke(50);
    strokeWeight(3);
    fill(100);
    ellipse(xc,yc,2*radiusi-4,2*radiusi-4);
    
    strokeWeight(1);
    noStroke();
    fill(240);
    arc(xc,yc,2*radiusi-2,2*radiusi-2,-PI/2,angle,PIE);
  } 
  else {
    stroke(50);
    strokeWeight(3);
    fill(240);
    ellipse(xc,yc,2*radiusi-4,2*radiusi-4);
    
    strokeWeight(1);
    noStroke();
    fill(100);
    arc(xc,yc,2*radiusi-2,2*radiusi-2,-PI/2,angle,PIE);
  }

  stroke(50);
  strokeWeight(3);
  noFill();
  ellipse(xc,yc,2*radiusi-4,2*radiusi-4);
*/  

  
  /*
  stroke(230);
  strokeWeight(1);
  line(xc,yc-radiuso+1,xc,yc-radiusi);
  */
  
  switch(weekday) {
    case 1:
      days = "N";
      break;
    case 2:
      days = "M";
      break;
    case 3:
      days = "T";
      break;
    case 4:
      days = "W";
      break;
    case 5:
      days = "H";
      break;
    case 6:
      days = "F";
      break;
    case 7:
      days = "S";
      break;
  }
  
  
  fill(50);
  stroke(50);
  textSize(84);
  textAlign(CENTER,CENTER);
  
  //text(days,xc,yc-7);
  
  dayangle=2*PI/7;
  float offset;
  offset = .265;
  stroke(50);
  strokeWeight(2);
  fill(240);
  
  /*
  ellipse(xc+cos(-PI/2+offset)*radius,yc+sin(-PI/2+offset)*radius,35,35);
  ellipse(xc+cos(-PI/2+offset+dayangle)*radius,yc+sin(-PI/2+offset+dayangle)*radius,35,35);
  ellipse(xc+cos(-PI/2+offset+2*dayangle)*radius,yc+sin(-PI/2+offset+2*dayangle)*radius,35,35);
  ellipse(xc+cos(-PI/2+offset+3*dayangle)*radius,yc+sin(-PI/2+offset+3*dayangle)*radius,35,35);
  ellipse(xc+cos(-PI/2+offset+4*dayangle)*radius,yc+sin(-PI/2+offset+4*dayangle)*radius,35,35);
  ellipse(xc+cos(-PI/2+offset+5*dayangle)*radius,yc+sin(-PI/2+offset+5*dayangle)*radius,35,35);
  ellipse(xc+cos(-PI/2+offset+6*dayangle)*radius,yc+sin(-PI/2+offset+6*dayangle)*radius,35,35);
  
  
  line(xc,yc+sin(-PI/2)*radiusi,xc,yc+sin(-PI/2)*radiuso);
  line(xc+cos(-PI/2+dayangle)*radiusi-2,yc+sin(-PI/2+dayangle)*radiusi+2,xc+cos(-PI/2+dayangle)*radiuso,yc+sin(-PI/2+dayangle)*radiuso);
  line(xc+cos(-PI/2+2*dayangle)*radiusi,yc+sin(-PI/2+2*dayangle)*radiusi,xc+cos(-PI/2+2*dayangle)*radiuso,yc+sin(-PI/2+2*dayangle)*radiuso);
  line(xc+cos(-PI/2+3*dayangle)*radiusi,yc+sin(-PI/2+3*dayangle)*radiusi,xc+cos(-PI/2+3*dayangle)*radiuso,yc+sin(-PI/2+3*dayangle)*radiuso);
  line(xc+cos(-PI/2+4*dayangle)*radiusi,yc+sin(-PI/2+4*dayangle)*radiusi,xc+cos(-PI/2+4*dayangle)*radiuso,yc+sin(-PI/2+4*dayangle)*radiuso);
  line(xc+cos(-PI/2+5*dayangle)*radiusi,yc+sin(-PI/2+5*dayangle)*radiusi,xc+cos(-PI/2+5*dayangle)*radiuso,yc+sin(-PI/2+5*dayangle)*radiuso);
  line(xc+cos(-PI/2+6*dayangle)*radiusi+2,yc+sin(-PI/2+6*dayangle)*radiusi+2,xc+cos(-PI/2+6*dayangle)*radiuso,yc+sin(-PI/2+6*dayangle)*radiuso);

  line(xc,yc+sin(-PI/2)*radiusi,xc,yc-2);
  */
  
  line(xc,yc,xc,yc+sin(-PI/2)*radiuso);
  line(xc,yc,xc+cos(-PI/2+dayangle)*radiuso,yc+sin(-PI/2+dayangle)*radiuso);
  line(xc,yc,xc+cos(-PI/2+2*dayangle)*radiuso,yc+sin(-PI/2+2*dayangle)*radiuso);
  line(xc,yc,xc+cos(-PI/2+3*dayangle)*radiuso,yc+sin(-PI/2+3*dayangle)*radiuso);
  line(xc,yc,xc+cos(-PI/2+4*dayangle)*radiuso,yc+sin(-PI/2+4*dayangle)*radiuso);
  line(xc,yc,xc+cos(-PI/2+5*dayangle)*radiuso,yc+sin(-PI/2+5*dayangle)*radiuso);
  line(xc,yc,xc+cos(-PI/2+6*dayangle)*radiuso,yc+sin(-PI/2+6*dayangle)*radiuso);
  
  fill(50);
  textSize(24);
  
  text("N",xc+cos(-PI/2+offset)*radius,yc+sin(-PI/2+offset)*radius-2);
  text("M",xc+cos(-PI/2+offset+dayangle)*radius,yc+sin(-PI/2+offset+dayangle)*radius-2);
  text("T",xc+cos(-PI/2+offset+2*dayangle)*radius,yc+sin(-PI/2+offset+2*dayangle)*radius-2);
  text("W",xc+cos(-PI/2+offset+3*dayangle)*radius,yc+sin(-PI/2+offset+3*dayangle)*radius-2);
  text("H",xc+cos(-PI/2+offset+4*dayangle)*radius,yc+sin(-PI/2+offset+4*dayangle)*radius-2);
  text("F",xc+cos(-PI/2+offset+5*dayangle)*radius,yc+sin(-PI/2+offset+5*dayangle)*radius-2);
  text("S",xc+cos(-PI/2+offset+6*dayangle)*radius,yc+sin(-PI/2+offset+6*dayangle)*radius-2);
  
  stroke(50);
  strokeWeight(3.5);
  //line(xc-2,yc-2,innerx+2,innery+2);
  line(xc,yc,dayxo,dayyo);
  
    
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


