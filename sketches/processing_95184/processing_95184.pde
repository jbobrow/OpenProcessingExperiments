
//fields
float weight = 0;
int clicker = 0;
int laborForce2008 = 0;
int employment2008 = 0;
int unemployment2008 = 0;
int laborForce2009 = 0;
int employment2009 = 0;
int unemployment2009 = 0;
int laborForce2010 = 0;
int employment2010 = 0;
int unemployment2010 = 0;
int laborForce2011 = 0;
int employment2011 = 0;
int unemployment2011 = 0;
int laborForce2012 = 0;
int employment2012 = 0;
int unemployment2012 = 0;
//methods
void setup() {
  size(800, 800);
  background(0,150,200);
}
void mousePressed() {
  clicker++;
}

void draw() {
  if (clicker == 0) {
    fill(255);
    textSize(30);
    text("Unemployment Rates from 2008 to 2012", 100, 400);
  }
  else {
    if (clicker == 1) {
      background(0);
      mousePressed();
    }
  }
  if (clicker>1) {
    if (mouseX > 0 && mouseX <= 160) {
      amount2008();
    }
    else {
      if (mouseX > 160 && mouseX <= 320) {
        amount2009();
      }
      else {
        if (mouseX > 320 && mouseX <= 480) {
          amount2010();
        }
        else {
          if (mouseX > 480 && mouseX <= 640) {
            amount2011();
          }
          else {
            if (mouseX > 640 && mouseX <= 800) {
              amount2012();
            }
          }
        }
      }
    }
    fill(0);
    textSize(17);
    text("Jan", 40, 600);
    text("Feb", 105, 600);
    text("Mar", 165, 600);
    text("Apr", 225, 600);
    text("May", 285, 600);
    text("Jun", 345, 600);
    text("Jul", 405, 600);
    text("Aug", 465, 600);
    text("Sep", 525, 600);
    text("Oct", 585, 600);
    text("Nov", 645, 600);
    text("Dec", 705, 600);
    //Asia
    if (mouseX > 0 && mouseX <= 160) {
      textSize(24);
      fill(255);
      text("2008", 50, 25);  
      fill(0);
      text("2009", 190, 25);  
      fill(0);
      text("2010", 350, 25);  
      fill(0);
      text("2011", 500, 25);  
      fill(0);
      text("2012", 650, 25);
    }
    else {
      //Africa
      if (mouseX > 160 && mouseX <= 320) {
        textSize(24);
        fill(0);
        text("2008", 50, 25);  
        fill(255);
        text("2009", 190, 25);  
        fill(0);
        text("2010", 350, 25);  
        fill(0);
        text("2011", 500, 25);  
        fill(0);
        text("2012", 650, 25);
      }
      else {
        //World
        if (mouseX > 320 && mouseX <= 480) {
          textSize(24);      
          fill(0);
          text("2008", 50, 25);  
          fill(0);
          text("2009", 190, 25);  
          fill(255);
          text("2010", 350, 25);  
          fill(0);
          text("2011", 500, 25);  
          fill(0);
          text("2012", 650, 25);
        }
        else {
          //Europe
          if (mouseX > 480 && mouseX <= 640) {
            textSize(24);
            fill(0);
            text("2008", 50, 25);  
            fill(0);
            text("2009", 190, 25);  
            fill(0);
            text("2010", 350, 25);  
            fill(255);
            text("2011", 500, 25);  
            fill(0);
            text("2012", 650, 25);
          }
          else {
            //North America
            if (mouseX > 640 && mouseX <= 800) {
              textSize(24);
              fill(0);
              text("2008", 50, 25);  
              fill(0);            
              text("2009", 190, 25);  
              fill(0);
              text("2010", 350, 25);  
              fill(0);
              text("2011", 500, 25); 
              fill(255); 
              text("2012", 650, 25);
              fill(255);
            }
          }
        }
      }
    }
  }
}
void amount2008(){
  float jan = .033;
  float feb = .033;
  float mar = .034;
  float apr = .036;
  float may = .038;
  float jun = .041;
  float jul = .043;
  float aug = .045;
  float sep = .048;
  float oct = .051;
  float nov = .055;
  float dec = .059;
  create(jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec);
}
void amount2009() {
  float jan = .063;
  float feb = .066;
  float mar = .069;
  float apr = .072;
  float may = .073;
  float jun = .075;
  float jul = .076;
  float aug = .076;
  float sep = .077;
  float oct = .078;
  float nov = .079;
  float dec = .080;
  create(jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec);
}
void amount2010() {
  float jan = .080;
  float feb = .080;
  float mar = .079;
  float apr = .079;
  float may = .078;
  float jun = .078;
  float jul = .078;
  float aug = .078;
  float sep = .078;
  float oct = .078;
  float nov = .077;
  float dec = .075;
  create(jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec);
}
void amount2011() {
  float jan = .074;
  float feb = .073;
  float mar = .072;
  float apr = .072;
  float may = .073;
  float jun = .074;
  float jul = .075;
  float aug = .074;
  float sep = .074;
  float oct = .073;
  float nov = .071;
  float dec = .069;
  create(jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec);
}
void amount2012() {
  float jan = .068;
  float feb = .067;
  float mar = .067;
  float apr = .068;
  float may = .068;
  float jun = .069;
  float jul = .070;
  float aug = .069;
  float sep = .069;
  float oct = .068;
  float nov = .067;
  float dec = .067;
  create(jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec);
}
void create(float jan, float feb, float mar, float apr, float may, float jun, float jul, float aug, float sep, float oct, float nov, float dec) {
  fill(0,155,200);
  noStroke();
  rectMode(CENTER);
  rect(400,400,800,800);
  //january
  fill(0,255,0);
  rectMode(CORNERS);
  rect(45,530,65,100);
  fill(255,0,0);
  rect(45,530,65,530-(450*jan));
  fill(0);
  textSize(17);
  text(truncate(jan*100) + "%", 40, 90);
  //february
  fill(0,255,0);
  rectMode(CORNERS);
  rect(110,530,130,100);
  fill(255,0,0);
  rect(110,530,130,530-(450*feb));
  fill(0);
  text(truncate(feb*100) + "%", 105, 90);
  //march
  fill(0,255,0);
  rectMode(CORNERS);
  rect(170,530,190,100);
  fill(255,0,0);
  rect(170,530,190,530-(450*mar));
  fill(0);
  text(truncate(mar*100) + "%", 165, 90);
  //april
   fill(0,255,0);
  rectMode(CORNERS);
  rect(230,530,250,100);
  fill(255,0,0);
  rect(230,530,250,530-(450*apr));
  fill(0);
  text(truncate(apr*100) + "%", 225, 90);
  //may
  fill(0,255,0);
  rectMode(CORNERS);
  rect(290,530,310,100);
  fill(255,0,0);
  rect(290,530,310,530-(450*may));
  fill(0);
  text(truncate(may*100) + "%", 285, 90);
  //june
  fill(0,255,0);
  rectMode(CORNERS);
  rect(350,530,370,100);
  fill(255,0,0);
  rect(350,530,370,530-(450*jun));
  fill(0);
  text(truncate(jun*100) + "%", 345, 90);
  //july
  fill(0,255,0);
  rectMode(CORNERS);
  rect(410,530,430,100);
  fill(255,0,0);
  rect(410,530,430,530-(450*jul));
  fill(0);
  text(truncate(jul*100) + "%", 405, 90);
  //august
  fill(0,255,0);
  rectMode(CORNERS);
  rect(470,530,490,100);
  fill(255,0,0);
  rect(470,530,490,530-(450*aug));
  fill(0);
  text(truncate(aug*100) + "%", 465, 90);
  //september
  fill(0,255,0);
  rectMode(CORNERS);
  rect(530,530,550,100);
  fill(255,0,0);
  rect(530,530,550,530-(450*sep));
  fill(0);
  text(truncate(sep*100) + "%", 525, 90);
  //october
  fill(0,255,0);
  rectMode(CORNERS);
  rect(590,530,610,100);
  fill(255,0,0);
  rect(590,530,610,530-(450*oct));
  fill(0);
  text(truncate(oct*100) + "%", 585, 90);
  //november
  fill(0,255,0);
  rectMode(CORNERS);
  rect(650,530,670,100);
  fill(255,0,0);
  rect(650,530,670,530-(450*nov));
  fill(0);
  text(truncate(nov*100) + "%", 645, 90);
  //december
  fill(0,255,0);
  rectMode(CORNERS);
  rect(710,530,730,100);
  fill(255,0,0);
  rect(710,530,730,530-(450*dec));
  fill(0);
  text(truncate(dec*100) + "%", 705, 90);
  //average
  textSize(40);
  text("Year Average: " + truncate(((jan+feb+mar+apr+may+jun+jul+aug+sep+oct+nov+dec)/12)*100) + "%", 200, 700);
  if(jan<dec){
    textSize(30);
    text("Unemployment is increasing", 180, 750);
  } else{
    textSize(30);
    text("Unemployment is decreasing", 180, 750);
  }
}
float truncate(float x){
  if ( x > 0 )
    return float(floor(x * 10))/10;
  else
    return float(ceil(x * 10))/10;
}


