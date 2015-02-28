
// Linear Clock
// 20th September 2011     

// A time keeping device with a difference
// Four horizontal bars displayed against a grid of 12 vertical lines
// First bar shows the month and the proportion of the month - 
// Second bar shows the hour of the day - the width of the bar is expressed as a
//   percentage at the bottom of the window - resets every day
// Third bar is the minutes portion of the time - resets ever hour
// Fourth bar is the seconds portion of the time - resets every minute

int horMar = 10;      // left and right borders for drawing
int vertMar = 10;     // top and bottom margins
int barH    = 40;     // height of bar
int gap     = 10;      // gap between bars
int maxWid  = 360; 
int daysinYear = 365;
int totDaysecs = 60* 60* 24;
PFont myFont;

int[] daysmon = {31, 28, 31,  30, 30, 31, 31, 31, 30, 31, 30, 31};
String[] dow = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
String[] monthName = {"", "January", "February", "March", "April", "May", "June", 
                        "July", "August", "September", "October", "November", "December"};

void setTextFont() {
 // convenience function to put the fill() statement in one place
 // allowing an easy tweak of the colour
 //  fill(255, 252, 0); yellow
   fill(0,0,0);
}
void draw() {
    background(30);
    
    // calculate day of the year
    int m = month() - 1;
    int diy = day();
    for (int i=0; i < m; i++) {
      diy = diy + daysmon[i];   // accumulate days in previous months of the year
    }

    // draw vertical grid lines
    for (int h = 0; h<=12; h++) {
      stroke(255, 252, 0);
      strokeWeight(1);
      if (h == 12) { strokeWeight(3); }
      if ((h % 3) == 0) { strokeWeight(2); }
      int xh = horMar +  h * maxWid / 12;
      line(xh, vertMar - 5, xh, vertMar + 4*(barH + gap));
    }
    noStroke();
    
    textAlign(LEFT, CENTER);
    textFont(myFont);
    // seconds
    fill(255, 2, 0);    // red
    rect(horMar, vertMar + 3*(barH + gap), maxWid * second() / 60, barH); 
    setTextFont();
    text(nf(second(),2), horMar + 3, vertMar + 3*(barH + gap) + barH/2 - 4);
    fill(255, 252, 0);
    
    // minutes
    fill(0, 232, 66);  // green
    rect(horMar, vertMar + 2*(barH + gap), maxWid * minute() / 60, barH); 
    setTextFont(); 
    text(nf(minute(),2), horMar + 3, vertMar + 2*(barH + gap) + barH/2 - 4);
    
    // hours of the day
    fill(0, 158, 255);  // blue
    rect(horMar, vertMar + 1*(barH + gap), maxWid * hour() / 24, barH); 
    setTextFont();
    text(nf(hour(),2), horMar + 3, vertMar + 1*(barH + gap) + barH/2 - 4);
    
    // day of the year (will imply the month)
    fill(236, 136, 0);  // orange
    rect(horMar, vertMar + 0*(barH + gap), maxWid * diy / daysinYear, barH); 
    
    setTextFont();
    text(nf(day(),2) + " " + monthName[month()] + "    Day " + nf(diy,3), 
        horMar + 3, vertMar + 14);
    // calculate the time as a percentage of the day
    int secsInDay = second() + 60 * minute() + 60 * 60 * hour();
    float pctDay = float(secsInDay) / float(totDaysecs);
    
   
    // hack follows - will only work in 2011
    String dayofweek = "";
    if (year() == 2011) { dayofweek = dow[((diy - 2) % 7)]; }
    // for 2011, need to adjust the " - 2" in previous line to work
    fill(255, 252, 0);  // yellow
    text(dayofweek + "  " + hour() + ":" + nf(minute(),2) + "   " + nf(pctDay, 1, 5) + "%    " + 
              year() + "-" + nf(month(),2) + "-" + nf(day(),2) + "   Day " + diy,  
              10, 
              height - 20);
}

void setup() {
  size(380, 260);
  if ((year() % 4) == 0) {
    daysmon[1] = 29;
    daysinYear = 366;
  }
  myFont = createFont("ArialBold", 16);
  frameRate(2);
}

// Color scheme from kuler.adobe.com
//    0 232 66   green
//    0 158 255  blue
//    255 252 0  yellow
//    232 136 0  orange
//    255 2 0   red

