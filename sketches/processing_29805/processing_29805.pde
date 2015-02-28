
void setup() {
  size(300,300);
  smooth();
   fontBig = loadFont("CenturySchL-Bold-60.vlw");
   fontSmall = loadFont("CenturySchL-Bold-25.vlw");
   fill(255,255,255);
   cs = second();
   noStroke();
}
PFont fontBig, fontSmall;
int[] r = new int[5];
int[] g = new int[5];
int[] b = new int[5];
int cs;

void draw() {
  background(255);
    if( cs != second()) {
      for (int i=0; i<4; i++) {
        r[i] = r[i+1];
        g[i] = g[i+1];
        b[i] = b[i+1];
      }
      cs = second();  
  }
  for (int i=0; i<4; i++) {
    fill(r[i], g[i], b[i]);
    rect(-70+i*72, 0, 72, 300);
  }
   
  // Current bar
  r[4] = hour()*10;
  g[4] = minute()*4;
  b[4] = second()*4;
  fill(r[4],g[4],b[4]);
  rect(218,0,72,300);
  
  fill(255);
  
  // Hours
  textFont(fontBig,60);
  String h = str(hour());
  if (hour() < 10) h = "0" + h;
  text(h,218,230);
  
  // Minutes
  textFont(fontSmall,25);
  String m = str(minute());
  if (minute() < 10) m = "0" + m;
  
  text(m,222,255);
 
  // Seconds
  textFont(fontSmall,25);
  String s = str(second());
  if (second() < 10) s = "0" + s;
  
  text(s,255,255);
  fill(255);
  rect(0,0,10,300);
  rect(0,290,300,10);
  rect(0,0,300,10);
}

