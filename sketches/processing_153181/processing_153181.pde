
/*
 * Creative Coding
 * Week 5, 02 - Digital Clock
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows how to use text in Processing
 * The sketch creates a digital clock that shows the current time in hours, minutes and seconds
 * Use the 'h', 'm' and 's' keys to enlarge the hours, minutes or seconds in the display.
 *
 */
/*@pjs font="arial.ttf";*/
PFont myFont;    // font data
char  selected;  // what is selected (h,m,s)
int mils, sec0, sec, off;
Timecan []timecans=new Timecan[7];
String []labels= {
  "Year", "Month", "Day", "Hour", "miNute", "Second", "Thousand"
};
char []keyb= {
  'y', 'm', 'd', 'h', 'n', 's', 't'
};
int []daysinmonth= {
  31, 28+int((year()%4==0 && year()%100!=0)||year()%400==0), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
};
int []divisions= {
  100, 12, daysinmonth[month()-1], 24, 60, 60, 1000
};
void setup() {
  size(800, 600);
  colorMode(HSB,360,255,255);
  char [] charset= {
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
  };
  myFont = createFont("arial.ttf",18,true,charset);  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  selected = '0';
  off=0;
  for (int i=0; i<timecans.length; i++) {
    timecans[i]=new Timecan(i, i);
  }
  sec=sec0=second();
  strokeWeight(.5);
}

void draw() {
  background(200);
  fill(0); 

  mils=millis()-off;
  if (sec!=second() || mils>1000) {
    off=max(999, millis());
  }
  for (Timecan tc : timecans) {
    tc.fillTime();
    tc.drawNumber();
  }
  sec=second();
}

/*
 * drawBanner
 * draw a coloured banner at the bottom of the screen in the supplied colour
 */
void drawBanner(color c, float w) {
  noStroke();
  fill(c);
  rect(0, height - w, width, w);
}

void keyReleased() {
  // set selected to be the last key released
  selected = key;
}
class Timecan {
  int mode; 
  int col,col2;  
  int index;
  PVector baseloc;
  int margin=20;
  int h=height-200;
  int w=80;
  int gap = int((width-7*w-2*margin)/6);

  Timecan(int mode, int index) {
    this.mode=mode;
    this.index=index;
    baseloc=new PVector(margin+index*(w+gap), (height-h)/2);
    col=color(240+10*(mode+2),255,255);
    col2=color((10*(mode+2))%360,255,255);
  }
  void drawNumber() {
    boolean big=(selected==keyb[mode]);
    String label=labels[mode];
    float x=baseloc.x;
    int num=getNumber();
    float y=baseloc.y+h-num*h/divisions[mode];
    String theText = str(num); // convert number to string
    if(mode==0)theText=str(2000+num);
    if (big)
      textSize(40); // set big font size
    else
      textSize(24);  // normal font size

    float textWid = textWidth(theText) * 0.5;
    float textAs = textAscent() * 0.375;

    // draw text offset from the centre of the screen
    fill(0);
    text(theText, x+w/2-textWid, y);
    textSize(18);
    text(label, x+w/2-textWidth(label) * 0.5, height- 80);
  }

  void fillTime() {
    col2=color((20*(mode+2))%360,255,255);
    fill(col2);
    int num=getNumber();
    rect(baseloc.x, baseloc.y, w, h-num*h/divisions[mode]);
    col=color(240+20*(mode+2),num*255/divisions[mode],128+num*128/divisions[mode]);
    fill(col);    
    rect(baseloc.x, baseloc.y+h-num*h/divisions[mode], w, num*h/divisions[mode]);
  }
  int getNumber() {
    int number;
    switch (mode) {
    case 0:
      number=year()-2000;
      break;
    case 1:
      number=month();
      break;
    case 2:
      number=day();
      break;
    case 3:
      number=hour();
      break;
    case 4:
      number=minute();
      break;
    case 5:
      number=second();
      break;
    case 6:
      number=min(mils, 999);
      break;
    }
    return number;
  }
}
