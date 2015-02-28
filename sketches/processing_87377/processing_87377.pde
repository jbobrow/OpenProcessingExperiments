
char[]   weekD = {
  'S', 'M', 'T', 'W', 'T', 'F', 'S'
};
String[] mmm = { 
  "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
};

int      num = 7671;           //entries in data file - don't know how to het it length
int      y[]  = new int[num];   //year
int      m[]  = new int[num];   //month
int      d[]  = new int[num];   //day
int      wN[] = new int[num];   //week#
int      wD[] = new int[num];   //week day
String   moonW[] = new String[num];//moon week
int      moonD[] = new int[num];   //moon day
float    moonL[] = new float[num]; //moon illumination% (light)

int nowY = year();
int nowM = month();
int nowD = day();
int nowId, mStartId, mEndId = 0;
int moonNewId, moonFullId = 0; //moon new =0, full =1
float prevMonthId, nextMonthId;
float yNextMonth;

float moonDiamExt = 25; 
float moonDiamInt = 30;
float ySelSide = 0; //selector
float ySelDate = 0;
float ySelSize = 2;

float xDate = 0;//dates coordinates
float yDate = 0;

color blackL = (40);   //blackLight used for text
color blackLL = (120);
color greyL  = (240);  // greyLight
color greyN  = (210);  //greyNormal 
color greyD  = (150);  //greyDark
color white  = (255);
color yellow = color(255, 255, 180);
color red   = color(200, 0, 0); 
color redL    = color(200, 100, 100);

PFont font;
float stepX, stepY; //grid step
float scaleF;

void setup() {/////////////////////////////////////
  size(320, 480);     //iphone1-3
  //size(640, 960);   //iphone4
  //size(640, 1136);  //iphon5
  //size( 800, 600 );
  //size(1600-100, 900-100);

  background( greyL );
  stepX = width / 9.0;
  stepY = height / 12.0;
  scaleF = (height+width)/800.0;

  font = loadFont("CenturyGothic-20.vlw");
  textFont( font, 20*scaleF );  
  fill(blackL);

  graphics();
  dateGet();
  selector();
  dateShow();
  //grid();
}

void draw() {
  noLoop();
}

void grid() {
  pushStyle();
  stroke(200);
  for (float i = stepX; i < width; i+=stepX) {
    line(i, 0, i, height);
  }
  for (float i = stepY; i < height; i+=stepY) {
    line(0, i, width, i);
  }
  popStyle();
}

void dateGet() {
  parseDates();
  getEndDates();
  datesMoon();
}    

void parseDates() {
  String[] lines = loadStrings( "ymd_wn-wd_mw-md-ml_2000-2020.txt" );
  for (int i=0; i<lines.length; i++) {
    String[] parts = split(lines[i], '\t');
    y[i]  = int(parts[0]);
    m[i]  = int(parts[1]);
    d[i]  = int(parts[2]);
    wN[i] = int(parts[3]);
    wD[i] = int(parts[4]);
    moonW[i] = parts[5];
    moonD[i] = int(parts[6]);
    moonL[i] = float(parts[7]);

    if ( nowY==y[i] && nowM==m[i] && nowD==d[i] ) {
      nowId = i;
    }
  }
}

void getEndDates() {
  for(int i=nowId-7*5; i<nowId; i++ ) {
    if ( i<=nowId && wD[i]==1 && moonW[i].equals("+") ) {
      mStartId = i;
      //println("mStartId: " + y[mStartId] +" "+ m[mStartId] +" "+ d[mStartId] );
    }
  }
  for(int i=mStartId; i<mStartId+7*5; i++ ) {
    if ( i>=nowId && wD[i]==7 && (moonW[i].equals("N") || moonW[i].equals("N0") ) ) {
      mEndId = i;
      //println( "mEndId: " + y[mEndId] +" "+ m[mEndId] +" "+ d[mEndId] );
    }
  }
}

void datesMoon() {
  //closest moon dates////////////////////
  for (int i = mStartId; i < mEndId; i++) {
    if ( moonW[i].equals("N0") ) {
      moonNewId = i;
      //println(nfs(i-nowId, 2) + " " + y[i]+"/"+nf(m[i], 2)+"/"+d[i] +" "+ moonW[i]);
    } 
    else {     
      if ( moonW[i].equals("F1") ) {
        moonFullId = i;
        //println(nfs(i-nowId, 2) + " " + y[i]+"/"+nf(m[i], 2)+"/"+d[i] +" "+ moonW[i]);
      }
    }
  }
}

void dateShow() {
  moonDatesShow();
  datesShow();
  xAxis();
  yAxis();
}    

void moonDatesShow() {
  pushStyle();
  noFill();
  strokeWeight(0.25);
  stroke(blackL);
  line(stepX*(wD[moonFullId])+7*scaleF, stepY*5.5, stepX*(wD[moonFullId]+1)-7*scaleF, stepY*5.5);  
  line(stepX*(wD[moonNewId])+7*scaleF, stepY*9.5, stepX*(wD[moonNewId]+1)-7*scaleF, stepY*9.5);
  //stroke(blackL+50);
  //ellipse(stepX*(wd[moonFullId]+.5), stepY*5, 32*scaleF, 32*scaleF);
  //fill(greyD-20);
  //ellipse(stepX*(wd[moonNewId]+.5), stepY*9, 32*scaleF, 32*scaleF);
  popStyle();
}

void datesShow() {
  for (int i=mStartId; i<=mEndId; i++) {

    //date Y coordinate
    //+
    if ( moonW[i].equals("+") && moonW[i+7].equals("++") ) { 
      yDate = 1.5;
    } 
    else if ( moonW[i].equals("+") && (moonW[i+7].equals("F") || moonW[i+7].equals("F1"))) { 
      yDate = 2;
    }
   
    //++
    if ( moonW[i].equals("++") && moonW[i-7].equals("+") ) { 
      yDate = 2.5;
    } 
//    else  if ( moonW[i].equals("++") ) { 
//      yDate = 3;
//    }

    if ( moonW[i].equals("F") || moonW[i].equals("F1") ) { 
      yDate = 4;
    }

    if ( moonW[i].equals("-")&& moonW[i+7].equals("--") ) { 
      yDate = 5.5;
    } 
    else if ( moonW[i].equals("-") ) { 
      yDate = 6;
    }

    if ( moonW[i].equals("--") && moonW[i-7].equals("-") ) { 
      yDate = 6.5;
    }
    else  if ( moonW[i].equals("--") ) { 
      yDate = 7;
    }

    if ( moonW[i].equals("N") || moonW[i].equals("N0") ) { 
      yDate = 8;
    }

    //date x coordinate
    xDate = wD[i]; 

    //colors
    if (wD[i] == 1 && i >= nowId) {
      fill(red);
    } 
    else if ( wD[i] == 1 ) {
      fill(redL);
    }
    else if ( i >= nowId ) {
      fill(blackL);
    } 
    else { 
      fill(blackLL);
    }

    //place dates
    //println(yDate +" "+ sizeV);
    textAlign(CENTER);
    text( d[i], stepX*(xDate+0.5), stepY*(1.2 + yDate) );
  }
}


void yAxis() {   //year months///////////////////
  pushStyle();
  fill(blackL);
  textAlign(CENTER);
  pushMatrix();
  rotate(-HALF_PI);
  translate( -stepY, stepX/1.5);
  text( y[nowId], 0, 0);             //current year

  fill(blackL);
  translate( -stepY * ySelSide, 0);
  text( mmm[ m[nowId] - 1 ], 0, 0);    //month in selector
  popMatrix();

  //second Month////////////////////////////
  pushMatrix();
  rotate(-HALF_PI);
  //translate( -stepY, stepX/1.5);
  fill(blackL);
  if ( ySelSide == 2 ) {
    translate( -stepY * ( 1 + 8 ), stepX/1.5);
    text( mmm[ m[mStartId] ], 0, 0);  //second month next
    //println("111");
  }

  fill(greyD);
  if ( ySelSide != 2 ) {
    translate( -stepY * ( 1 + 2 ), stepX/1.5);
    text( mmm[ m[mStartId] -1 ], 0, 0);  //second month next
    //println("222");
  }


  popMatrix();
  popStyle();
}

void xAxis() {   //week days/////////////////////
  textAlign(CENTER);
  for (int i = 0; i < weekD.length; i++) {
    if (i == 0) {
      fill(red);
    } 
    else if ( wD[nowId]-1 == i ) {
      fill(blackL);
    } 
    else {
      fill(greyD);
    }
    text(weekD[i], stepX*(1.5+i), stepY*0.85);
  }
}

void graphics() {
  weeks();
  frame();
}

void weeks() {
  pushStyle();
  noStroke();
  fill(greyN);
  rect(stepX, stepY*2, stepX*7, stepY*2);
  fill(white);
  rect(stepX, stepY*4, stepX*7, stepY*2);  
  fill(greyN);
  rect(stepX, stepY*6, stepX*7, stepY*2);  
  fill(greyD);
  rect(stepX, stepY*8, stepX*7, stepY*2);
  popStyle();
}

void frame() {
  pushStyle();
  fill(greyL-10);
  noStroke();
  triangle( stepX*1, stepY*2, stepX*4.5, stepY*1, stepX*8, stepY*2);
  triangle( stepX*1, stepY*10, stepX*4.5, stepY*11, stepX*8, stepY*10);
  fill(greyD);
  textAlign(CENTER);
  text("MoonWeek", width/2-9*scaleF, stepY*11.65);
  popStyle();
}

void selector() { //yellow selection
  pushStyle();
  noStroke();
  fill(yellow);
  rect(stepX*(wD[nowId]), 2*scaleF, stepX, stepY*ySelSize-2*scaleF, 10, 10, 0, 0);   //weekD

  if ( moonW[nowId].equals("+")) { 
    ySelSide = 2; 
    ySelDate = 2;
    moonWax();
    if ( moonW[nowId+7].equals("F") ) {
      ySelSize = 2;
    } 
    else {
      ySelSize = 1;
    }
  }
  if ( moonW[nowId].equals("++") ) { 
    ySelSide = 2; 
    ySelDate = 3;
    ySelSize = 1;
  }
  if ( moonW[nowId].equals("F") || moonW[nowId].equals("F1") ) { 
    ySelSide = 4; 
    ySelDate = 4;
    ySelSize = 2;
  }
  if ( moonW[nowId].equals("-") ) { 
    ySelSide = 6; 
    ySelDate = 6;
    moonWan();
    if ( moonW[nowId+7].equals("N") || moonW[nowId+7].equals("N0")) {
      ySelSize = 2;
    } 
    else {
      ySelSize = 1;
    }
  }
  if ( moonW[nowId].equals("--") ) { 
    ySelSide = 6; 
    ySelDate = 7;
    ySelSize = 1;
  }
  if ( moonW[nowId].equals("N") || moonW[nowId].equals("N0") ) { 
    ySelSide = 8; 
    ySelDate = 8;
    ySelSize = 2;
  }
  //month left side
  rect(2*scaleF, stepY*(ySelSide), stepX-2*scaleF, stepY*2, 10, 0, 0, 10);  //month
  
  //moon right side
  rect(stepX*8, stepY*ySelSide, stepX-2*scaleF, stepY*2, 0, 10, 10, 0);  //moon
  
  //date center
  stroke(blackL); 
  rect(stepX*(wD[nowId]), stepY*ySelDate-1*scaleF, stepX, stepY*ySelSize+1*scaleF);  //date
  popStyle();

  if ( ySelSide == 2) {
    moonWax();
  }
  if ( ySelSide == 4) {
    moonFull();
  }
  if ( ySelSide == 6) {
    moonWan();
  }
  if ( ySelSide == 8) {
    moonNew();
  }
}

void moonWax() {
  pushStyle();
  stroke(greyD);
  fill(greyD);
  ellipse(stepX*8.5, stepY*3, moonDiamExt*scaleF, moonDiamExt*scaleF);
  fill(white);
  arc(stepX*8.5, stepY*3, moonDiamExt*scaleF, moonDiamExt*scaleF, -HALF_PI, HALF_PI);
  fill(greyD);
  arc(stepX*8.5-10*scaleF, stepY*3, moonDiamInt*scaleF, moonDiamInt*scaleF, -QUARTER_PI-.2, HALF_PI-QUARTER_PI+.2);
  popStyle();
}

void moonFull() {
  pushStyle();
  stroke(greyD);
  fill(white);
  arc(stepX*8.5, stepY*5, moonDiamExt*scaleF, moonDiamExt*scaleF, 0, TWO_PI);
  popStyle();
}

void moonWan() { 
  pushStyle();
  stroke(greyD);
  fill(greyD);
  ellipse(stepX*8.5, stepY*7, moonDiamExt*scaleF, moonDiamExt*scaleF);
  fill(white);
  arc(stepX*8.5, stepY*7, moonDiamExt*scaleF, moonDiamExt*scaleF, HALF_PI, TWO_PI-HALF_PI);
  fill(greyD);
  arc(stepX*8.5+10*scaleF, stepY*7, moonDiamInt*scaleF, moonDiamInt*scaleF, HALF_PI+QUARTER_PI-.2, TWO_PI-HALF_PI-QUARTER_PI+.2);
  popStyle();
}

void moonNew() {
  pushStyle();
  fill(greyD);
  stroke(greyD);
  //noStroke();
  ellipse(stepX*8.5, stepY*9, moonDiamExt*scaleF, moonDiamExt*scaleF);
  popStyle();
}



