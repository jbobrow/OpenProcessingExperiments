
//import java.util.GregorianCalendar;
//import java.util.Calendar;
//import java.util.Date;
int xc, yc; // x and y centers

float xtoday, xyester, xtom, xafter, xbefore; //x coordinate of moving line for day

String days, yester, tom, after, before;
int i;

int framesday;

float daywidth;
float dayangle; // angle for chord arc fill of current day
int weekday, weekdayadd; //for day changes
int textoffset;

void setup() {
  size(200,200);
  xc=width/2;
  yc=height/2;
  //GregorianCalendar gcal = new GregorianCalendar();
  //weekday = gcal.get(Calendar.DAY_OF_WEEK);
  weekday = day() % 7 - 1;
  weekdayadd=weekday;

  frameRate(30);
  i = 0;
  framesday = 2592000; //2592000 number of frames in 24hrs
  daywidth = 100; //pixel width of a day

  background(50);
  
}

void draw() {
  background(50);    
  //GregorianCalendar gcal = new GregorianCalendar();
  //weekday = gcal.get(Calendar.DAY_OF_WEEK);
  weekday = day() % 7 - 1;
  
  float s;
  s = map(second(), 0, 60, 0, daywidth);
  float m;
  m = map(minute() + norm(second(), 0, 60), 0, 60, 0, (daywidth));
  float h;
  h = map(hour() + norm(minute(), 0, 60) + norm(second(), 0, 3600), 0, 24, 0, (daywidth));
  float hours;
  hours = map(hour() + norm(minute(), 0, 60) + norm(second(), 0, 3600), 0, 24, 0, TWO_PI) - HALF_PI;

  //x coordinates for left side of a day
  xtoday=xc-h;
  xyester=xtoday-daywidth;
  xtom=xtoday+daywidth;
  xafter=xtom+daywidth;
  xbefore=xyester-daywidth;
  
  //background of slider
  fill(240);
  strokeWeight(0);
  rect(0,50,200,100);
  
  
  //Ellipses for the days 
  
  //noFill();
  fill(230);
  stroke(50);
  strokeWeight(0);
  ellipse(xtoday + daywidth/2,height/2,daywidth-3,daywidth-3);
  fill(230);
  ellipse(xtom + daywidth/2,height/2,daywidth-3,daywidth-3);
  ellipse(xyester + daywidth/2,height/2,daywidth-3,daywidth-3);
 

  
  //dark rectangle to divide left half of slider
  fill(175);
  rect(0,50,100,100);
  
 
  /*
  //lines between ellipses
  stroke(50);
  strokeWeight(3.5);
  line(xtoday,50,xtoday,150);
  line(xtom,50,xtom,150);
  line(xyester,50,xyester,150);
  line(xafter,50,xafter,150);
  line(xbefore,50,xbefore,150);
  */
  
  //line down center to mask other lines
  strokeWeight(1);
  stroke(175);
  //line(width/2,50,width/2,149);
  
  
  //day string changer based on day of week
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
  noFill();
  stroke(50);
  strokeWeight(3);
  ellipse(xtoday + daywidth/2,height/2,daywidth-3,daywidth-3);
  ellipse(xtom + daywidth/2,height/2,daywidth-3,daywidth-3);
  ellipse(xyester + daywidth/2,height/2,daywidth-3,daywidth-3);
  
  
  dayangle = map(hours,0,2*PI,PI,0);
  
  fill(100);
  noStroke();  
  //arc(xtoday + daywidth/2,height/2,daywidth+1,daywidth+1,hour/2,(2*PI-hour/2),CHORD);
  
  noFill();
  stroke(50);
  strokeWeight(3);
  ellipse(xtoday + daywidth/2,height/2,daywidth-3,daywidth-3);
  ellipse(xtom + daywidth/2,height/2,daywidth-3,daywidth-3);
  ellipse(xyester + daywidth/2,height/2,daywidth-3,daywidth-3);
  
  fill(50);
  stroke(50);
  textSize(78);
  textAlign(CENTER,CENTER);
  
  textoffset = 8;
  
  text(days,xtoday+daywidth/2,height/2-textoffset);
  text(yester,xyester+daywidth/2,height/2-textoffset);
  text(tom,xtom+daywidth/2,height/2-textoffset);
  text(after,xafter+daywidth/2,height/2-textoffset);
  text(before,xbefore+daywidth/2,height/2-textoffset);
  
  weekdayadd=weekday;  
}



