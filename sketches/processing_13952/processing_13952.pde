
/* ///////////////////////////////////
--------------------------------------
----- CREATED BY SPENCER GREGSON -----
----- 11.03.2008 - 13.03.2008    -----
--------------------------------------
Celestial equations + data:
    Paul Schlyter's "How to compute planetary positions"
    http://stjarnhimlen.se/
UI slider mechanics from examples @ www.processing.org
Ditto to a lesser degree for button functionality
--------------------------------------
/////////////////////////////////// */




int startDAY = floor(367*year() - (7*(year()+((month()+9)/12)))/4 + (275*month())/9 + day() - 730530);    //Set start date to current date
//int startDAY = floor(367*1990 - (7*(1990+((04+9)/12)))/4 + (275*04)/9 + 19 - 730530);    //Set start date to Apr. 19 1999
int currentDAY = startDAY;
int unvScale;
Date current;
Slider hs1;
Planet mercury, venus, earth, mars, jupiter, saturn, uranus, neptune;                                              //Declare planetary objects
PFont font;
Button p1, p2, p3, p4, p5, p6, p7, p8;
Button s1, s2, s3, s4;
boolean locked = false;


void setup() {
  size(800,600);
  background(0);
  smooth();
  noStroke();
  
  /* FORMAT OF PLANETARY ORBITAL ELEMENTS, distances in AU and degrees
  name planet id
  N    longitude of the ascending node
  i    inclination to the ecliptic
  w    argument of perihelion
  a    semi-major axis / mean distance from the sun
  e    eccentricity (0=circle, 0->1 ellipse, 1=parabola)
  M    mean anomaly (0 at perihelion; increases uniformly with time)
  dia  planet diameter
  "___",(N0,Nmod),(i0,imod),(w0,wmod),(
  
  */
  
  mercury = new Planet ("mercury", 
    new float []{48.3313, 3.24587*pow(10,-5)},
    new float []{7.0047, 5.00*pow(10,-8)},
    new float []{29.1241, 1.01444*pow(10,-5)},
    new float []{.387098, 0.0},
    new float []{.205635, 5.59*pow(10,-10)},
    new float []{168.6562, 4.0923344368},
    4878.0);
  venus = new Planet ("venus", 
    new float []{76.6799, 2.46590*pow(10,-5)},
    new float []{3.3946, 2.75*pow(10,-8)},
    new float []{54.8910, 1.38374*pow(10,-5)},
    new float []{0.723330, 0.0},
    new float []{.006773, -1.302*pow(10,-9)},
    new float []{48.0052, 1.6021302244},
    12104.0);
  earth = new Planet ("earth", 
    new float []{0.0, 0.0}, 
    new float []{0.0, 0.0}, 
    new float []{282.9404, 4.70935*pow(10,-5)},
    new float []{1.0000, 0.0},
    new float []{0.016709, -1.151*pow(10,-9)},
    new float []{356.0470, .9856002585},
    12756.0);
  mars = new Planet ("mars", 
    new float []{49.5574, 2.11081*pow(10,-5)},
    new float []{1.8497, -1.78*pow(10,-8)},
    new float []{286.5016, 2.92961*pow(10,-5)},
    new float []{1.523688, 0.0},
    new float []{0.093405, 2.516*pow(10,-9)},
    new float []{18.6021, .5240207766},
    6787.0);
  jupiter = new Planet ("jupiter", 
    new float []{100.4542, 2.76854*pow(10,-5)},
    new float []{1.3030, -1.557*pow(10,-7)},
    new float []{273.8777, 1.64505*pow(10,-5)},
    new float []{5.20256, 0.0},
    new float []{0.048498, 4.469*pow(10,-9)},
    new float []{19.8950, .0830853001},
    142800.0);
  saturn = new Planet ("saturn", 
    new float []{113.6634, 2.38980*pow(10,-5)},
    new float []{2.4886, -1.081*pow(10,-7)},
    new float []{339.3939, 2.97661*pow(10,-5)},
    new float []{9.55475, 0.0},
    new float []{0.055546, -9.449*pow(10,-9)},
    new float []{316.9670, .0334442282},
    120000.0);
  uranus = new Planet ("uranus", 
    new float []{74.0005, 1.3978*pow(10,-5)},
    new float []{0.7733, 1.9*pow(10,-8)},
    new float []{96.6612, 3.0565*pow(10,-5)},
    new float []{19.18171, -1.55*pow(10,-8)},
    new float []{0.047318, 7.45*pow(10,-9)},
    new float []{142.5905, .011725806},
    51118.0);
  neptune = new Planet ("neptune", 
    new float []{131.7806, 3.0173*pow(10,-5)},
    new float []{1.7700, -2.55*pow(10,-7)},
    new float []{272.8461, -6.027*pow(10,-6)},
    new float []{30.05826, 3.313*pow(10,-8)},
    new float []{0.008606, 2.15*pow(10,-9)},
    new float []{260.2471, .005995147},
    49528.0);
  //pluto = new Planet ()

  unvScale = 15;
  
  font = loadFont("ArialMT-11.vlw");
  textFont(font);       //Set the current font to "font" (ArialMT-11)

  current = new Date ("current", currentDAY, 7);          //Name, start value, initial increment value
  hs1 = new Slider(0,70,width,10,2);
  
  p1 = new Button("Me",width/2-181,height-25,40,20);
  p2 = new Button("Ve",width/2-135,height-25,40,20);
  p3 = new Button("Ea",width/2-89,height-25,40,20);
  p4 = new Button("Ma",width/2-43,height-25,40,20);
  p5 = new Button("Ju",width/2+3,height-25,40,20);
  p6 = new Button("Sa",width/2+49,height-25,40,20);
  p7 = new Button("Ur",width/2+95,height-25,40,20);
  p8 = new Button("Ne",width/2+141,height-25,40,20);
  
  s1 = new Button("01",width-25,80,20,20);
  s2 = new Button("02",width-25,105,20,20);
  s3 = new Button("03",width-25,130,20,20);
  s4 = new Button("04",width-25,155,20,20);
}

void draw() {
  frameRate(12);
  fill(0, 50);
  rect(0,0,width,height);
  fill(255);
  
  mercury.drawPlanet(1); //#DDDDDD);
  venus.drawPlanet(1); //#DDBB22);
  earth.drawPlanet(1); //#0000FF);
  mars.drawPlanet(1); //#FF4400);
  jupiter.drawPlanet(3); //#AA8800);
  saturn.drawPlanet(3); //#FFFFFF);
  uranus.drawPlanet(2); //#AAFFFF);
  neptune.drawPlanet(2); //#FFFFFF);
  
  fill(10);
  stroke(100);
  rect(0,0,width,60);
  stroke(50);
  line((width/2)-(width/4)+10,30,(width/2)+(width/4)-10,30);
  noStroke();
  fill(255);
  
  //DRAW SUN
  ellipse(width/2,height/2+30,round(20/sqrt(unvScale)),round(20/sqrt(unvScale)));
  ellipse(width/2,30,round(12/sqrt(unvScale)),round(12/sqrt(unvScale)));
  
  mercury.drawEcliptic(1.5); //#DDDDDD);
  venus.drawEcliptic(1.5); //#DDBB22);
  earth.drawEcliptic(1.5); //#0000FF);
  mars.drawEcliptic(1.5); //#FF4400);
  jupiter.drawEcliptic(2); //#AA8800);
  saturn.drawEcliptic(2); //#FFFFFF);
  uranus.drawEcliptic(1.5); //#AAFFFF);
  neptune.drawEcliptic(1.5); //#FFFFFF);

  float rate = .25*(hs1.getPos()-width/2);
  current.setRate(rate);
  current.drawDate(true);            //Boolean to set condition on post-operation increment or not

  hs1.update();
  update(mouseX,mouseY);
  hs1.display();
  
  fill(200);                          //Scale Buttons and text
  textAlign(RIGHT);
  stroke(100);
  line(width-33,77,width-33,178);
  noStroke();
  text("Scale", width-35, 118);
  fill(255);
  s1.display();
  s2.display();
  s3.display();
  s4.display();
  
  p1.display();
  p2.display();
  p3.display();
  p4.display();
  p5.display();
  p6.display();
  p7.display();
  p8.display();
}

/*
Planet[] objSet;
objSet = {mercury, venus, earth, mars, jupiter, saturn, uranus, neptune};

for(int i= 0;i < objSet.length; i++) {
  objSet[i].display();
}
*/

//////////////////////////////////////////////////////////////////////////////////////////////////////
void update(int x, int y) {
  if(locked == false) {
    p1.update();
    p2.update();
    p3.update();
    p4.update();
    p5.update();
    p6.update();
    p7.update();
    p8.update();
    s1.update();
    s2.update();
    s3.update();
    s4.update();
  }
  else {
    locked = false;
  }
}

void mousePressed() {
  //////////////////////////Button Click Actions
  if(p1.pressed()){
//    p1.toggleStatus();
    mercury.highlight();
  }
  else if (p2.pressed()) {
//    p2.toggleStatus();
    venus.highlight();
  }
  else if (p3.pressed()) {
//    p3.toggleStatus();
    earth.highlight();
  }
  else if (p4.pressed()) {
//    p4.toggleStatus();
    mars.highlight();
  }
  else if (p5.pressed()) {
//    p5.toggleStatus();
    jupiter.highlight();
  }
  else if (p6.pressed()) {
//    p6.toggleStatus();
    saturn.highlight();
  }
  else if (p7.pressed()) {
//    p7.toggleStatus();
    uranus.highlight();
  }
  else if (p8.pressed()) {
//    p8.toggleStatus();
    neptune.highlight();
  }
  else if (s1.pressed()) {
    unvScale = 7;
  }
  else if (s2.pressed()) {
    unvScale = 15;
  }
  else if (s3.pressed()) {
    unvScale = 30;
  }
  else if (s4.pressed()) {
    unvScale = 60;
  }
}

class Button {
  int x1, y1, x2, y2;
  int w, h;
  boolean over = false;
  boolean pressed = false;
  boolean state = false;
  int offColor = #000000;
//  int onColor = #AAAAAA;
  int highlightColor = #888888;
  int currentColor = offColor;
  String id;
  
  Button (String name, int ix, int iy, int iw, int ih) {
    x1 = ix;
    y1 = iy;
    w = iw;
    h = ih;
    x2 = x1 + w;
    y2 = y1 + h;
    id = name;
  }
  
  void update() {
    if(over()) {
      currentColor = highlightColor;          //change current color to highlight
    }
    else {
      currentColor = offColor;
      /*if(getStatus()) {
        currentColor = onColor;         //if there was an on color and an off color
      }
      else {
        currentColor = offColor;
      }*/
    }
  }
 /* 
  void toggleStatus () {                   //for if you want an 'on' state and an 'off' state
    if(state) {
      state = false;
    }
    else {
      state = true;
    }
  }
  
  boolean getStatus () {
    return (state);
  }
*/
  
  boolean pressed() {
    if(over) {
      locked = true;
      return true;
    }
    else {
      locked = false;
      return false;
    }
  }
  
  boolean over() {
    if (x1 <= mouseX && mouseX <= x2 && y1 <= mouseY && mouseY <= y2){
      over = true;
      return(true);
    }
    else {
      over = false;
      return(false);
    }
  }
  
  void display() {
    stroke(100);
    fill(currentColor);
    rect(x1, y1, w, h);
    fill(255);
    textAlign(CENTER);
    text(id, floor(x1+w/2), floor(y1+2*h/3));
  }
}

class Planet {
  String name;
  float[] N0, i0, w0, alph0, e0, M0;                                                                              //Instantiate variables defining orbital operations
  float a0, dia0;                                                                                                          //Instantiate mean distance holder for inner planets
  int colorize = #FFFFFF;
  
  // CONSTRUCTOR
  // 
  Planet(String id, float[] lat, float[] inc, float[] peri, float[] mean, float[] ecc, float[] anom, float d) {
    name = id;
    N0 = lat;
    i0 = inc;
    w0 = peri;
    alph0 = mean;
    e0 = ecc;
    M0 = anom;
    dia0 = d;
  }
  
  
  private float[] getLocation() {
    
    float N = (N0[0]+N0[1]*current.getValue())%360;
    float i = (i0[0]+i0[1]*current.getValue())%360;
    float w = (w0[0]+w0[1]*current.getValue())%360;
    float a = alph0[0]+alph0[1]*current.getValue();
    float e = e0[0]+e0[1]*current.getValue();
    float M = (M0[0]+M0[1]*current.getValue())%360;
    float dia = dia0;
    float e1 = M + (180/PI) * e * sin(radians(M)) * (1.0 + e * cos(radians(M)));                                               //calculating the eccentric anaomaly for E and M in degrees
    if(e > .05){                                                                                               //For very large orbital eccentricity, this brings greater accuracy to anomaly value
      for(int z=0;z<3;z++){
        float e2 = e1 - (e1 - (180/PI) * e * sin(radians(e1)) - M) / (1 - e * cos(radians(e1)));
        e1 = e2;
      }
    }

    //CALCULATION OF HELIOCENTRIC PLANETARY LOCATION
    float xv = a * (cos(radians(e1)) - e);
    float yv = a * (sqrt(abs(1.0 - e*e)) * sin(radians(e1)));                                                        //Considering the possible magnification of e past 1 due to the multiplication factors, abs() was added to the expression
    float r = sqrt(xv * xv + yv * yv );
    float v = degrees(atan2(yv, xv));

        
    float xh = r*(cos(radians(N)) * cos(radians(v)+radians(w)) - sin(radians(N)) * sin(radians(v)+radians(w)) * cos(radians(i)));
    float yh = r*(sin(radians(N)) * cos(radians(v)+radians(w)) + cos(radians(N)) * sin(radians(v)+radians(w)) * cos(radians(i)));
    float zh = r*(sin(radians(v)+radians(w)) * sin(radians(i)));
    float[] coords = {xh, yh, zh};
    
    return(coords);

  }
  
  //toggles planetary highlighting, activated in "void mousePressed()"
  private void highlight() {
    fill(colorize);
    float[] loc = this.scaledOrbit();
    float x = loc[0];
    float y = loc[1];
    float z = loc[2];
    int bound = min(width, height)-10;                                    //reads the minimum window dimension for bounds of ellipses
    //point((width/2)+x*bound,(height/2)+30+y*bound);
    line((width/2)+x*bound,30+z*bound,(width/2)+x*bound,(height/2)+30+y*bound);
  }
  
  private void drawPlanet(float pScale) {
    fill(255);
    float[] loc = this.scaledOrbit();
    float x = loc[0];
    float y = loc[1];
    int bound = min(width, height)-10;                                    //reads the minimum window dimension for bounds of ellipses
    //point((width/2)+x*bound,(height/2)+30+y*bound);
    ellipse((width/2)+x*bound,(height/2)+30+y*bound,round(10/sqrt(unvScale)),round(10/sqrt(unvScale)));
  }
  
  private void drawEcliptic(float pScale/*, int colorize*/) {
    //fill(colorize);
    float [] loc = this.scaledOrbit();
    float x = loc[0];
    float z = loc[2];
    int bound = min(width, height)-10;
    //point((width/2)+x*bound,30+z*bound);
    if(unvScale == 7){pScale = 2;}
    ellipse((width/2)+x*bound,30+z*bound,pScale,pScale);
  }
  
  private float[] scaledOrbit() {
    float[] loc = this.getLocation();
    float[] scaled = loc;
    for(int i=0;i<scaled.length;i++){
      scaled[i] = loc[i]/unvScale;                  //creates fractional percentage for displaying relative to screen size
    }
    return(scaled);
  }
  void scalePlanet() {
  }
  
}



class Date {
  int mJDN, cycleRate;
  String name;
  
  //CONSTRUCTOR
  Date (String id, int frame, int hert) {
    name = id;
    mJDN = frame;
    cycleRate = hert;
  }
  
  private int getValue(){
    return(mJDN);
  }
  
  private void setRate(float input){
    cycleRate = floor(input);
  }
  
  private int[] getDate(){
    int jd = mJDN+2451544;
    int l = jd + 68569;
    int n = floor(( 4 * l ) / 146097);
    l = l - floor(( 146097 * n + 3 ) / 4);
    int i = floor(( 4000 * ( l + 1 ) ) / 1461001);
    l = l - floor(( 1461 * i ) / 4) + 31;
    int j = floor(( 80 * l ) / 2447);
    int d = l - floor(( 2447 * j ) / 80);
    l = floor(j / 11);
    int m = j + 2 - ( 12 * l );
    int y = 100 * ( n - 49 ) + i + l;
        
    int[] output = {d,m,y};
    return(output);
  }
  private void drawDate(boolean adv){
    int[] greg = this.getDate();
    int d = greg[0];
    int m = greg[1];
    int y = greg[2];
        
    fill(0);
    stroke(100);
    rect(6,82,40,86);
    noStroke();

    fill(200);
    textAlign(RIGHT);
    text(y, 40, 100);
    text(m, 40, 120);
    text(d, 40, 140);
    text(cycleRate, 40, 160);
    textAlign(LEFT);
    text("Year", 50, 100);
    text("Month", 50, 120);
    text("Day", 50, 140);
    text("Days / Frame", 50, 160);
        
    if(adv){
      mJDN+=this.getRefresh();
    }
    
  }
  
  int getRefresh() {
    return(cycleRate);
  }
  void setRefresh(int newVal) {
    cycleRate = newVal;
  }
  
}

class Slider {
  int swidth, sheight;    // width and height of bar
  int xpos, ypos;         // x and y position of bar
  float spos, newspos;    // x position of slider
  int sposMin, sposMax;   // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  Slider (int xp, int yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = floor(xpos + swidth/2 - sheight/4);
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if(over()) {
      over = true;
    } else {
      over = false;
    }
    if(mousePressed && over) {
      locked = true;
    }
    if(!mousePressed) {
      locked = false;
    }
    if(locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if(abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  int constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
  }

  boolean over() {
    if(mouseX > xpos && mouseX < xpos+swidth &&
    mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(50);
    rect(xpos, ypos, swidth, sheight);
    if(over || locked) {
      fill(153, 102, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight/2, sheight+6);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}


/*
//FOR DEBUGGING DATA
    println("N: " + N);
    println("i: " + i);
    println("w: " + w);
    println("a: " + a);
    println("e: " + e);
    println("M: " + M);
    println("dia: " + dia);
    println("E: " +e1);
    println("r: " + r);
    println("v: " + v);
    println("start: " + startDAY);
    println("DAY: " + currentDAY);
    println("xv:  " + xv + "  yv:  " + yv);
    println("-x-" + coords[0] + "  -y-" + coords[1] + "  -z-" + coords[2]);
*/

