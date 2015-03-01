
disk[] d;  //color disks
slider[] sb;    //horizontal sliders for saturation and brightness
radialSlider[] rs;    //radial sliders for hue
displayColor[] c;    //color displays
onOff button;  //button the lock the angle between the colors' hue
arch a;  //arc to vizualise the locked angle


/*-------------------------------------------------------*/


void setup()
{
  size(800, 400);
  smooth();
  colorMode(HSB, 360, 100, 100);
  
  
  //create disks
  float diskX = width/2;
  float diskY = 170;
  d = new disk[2];  
  d[0] = new disk(diskX, diskY, 80, 100);  //Color 1
  d[1] = new disk(diskX, diskY, 55, 75);  //Color 2
  
  
  //create round sliders to choose the hue
  color white = color(360);
  color black = color(0);
  rs = new radialSlider[2];
  rs[0] = new radialSlider(diskX, diskY, (d[0].rInt + d[0].rExt)/2, 0, black, white);  //Color 1
  rs[1] = new radialSlider(diskX, diskY, (d[1].rInt + d[1].rExt)/2, PI, white, black);  //Color 2
  
  
  //create angle locker
  button = new onOff(width/2 - 30, height - 50);  //on/off button to lock the angle between the colors
  a = new arch(width/2, height - 70); //arc the indicates the angle between the colors when button is locked
  
  
  //create the color diplays
  c = new displayColor[2];
  c[0] = new displayColor(250/2, diskY, "Color 1");  //Color 1
  c[1] = new displayColor(width - 250/2,diskY, "Color 2");  //Color 2
  
  
  //create horizontal sliders
  sb = new slider[4]; 
  
  //data of the sliders
  int scroller_size = 150;
  int xC1 = 50;  //x position for color 1
  int xC2 = width - scroller_size - xC1; //x position for color 2
  int yS = height - 100; //y position for saturation
  int yB = height - 50; //y position for brightness
  String txtS = "Saturation"; //text of the saturatijon scroller
  String txtB = "Brightness"; //text of the brightness scroller
  
  //saturation
  sb[0] = new slider(xC1, yS, scroller_size, txtS);  //saturation color 1
  sb[1] = new slider(xC2, yS, scroller_size, txtS);  //saturation color 2
  // brightness
  sb[2] = new slider(xC1, yB, scroller_size, txtB);  //brightness color 1
  sb[3] = new slider(xC2, yB, scroller_size, txtB);  //brightness color 2
}


/*-------------------------------------------------------*/


void draw()
{
  //DISPLAY LAYOUT ELEMENTS
  background(180);
  
  
  //display lines
  stroke(127);
  strokeWeight(1);
  line(250, 50, 250, height-50);
  line(width - 250, 50, width - 250, height-50);
  
  
  //display title
  fill(100);
  textAlign(CENTER);
  textSize(20);
  text("DUO HSB color selector", width/2, 40);
  
  
  
  //SET VALUES
  //set the colors of the bigger disk
  d[0].setSaturation(sb[0].r, sb[0].w);
  d[0].setBrightness(sb[2].r, sb[1].w); 
  
  //set the colors of the smaller disk  
  d[1].setSaturation(sb[1].r, sb[2].w);
  d[1].setBrightness(sb[3].r, sb[3].w);
  
  
  //set the color 1
  c[0].setColor1(degrees(rs[0].teta), d[0].s, d[0].b);
  c[0].setColor2(degrees(rs[1].teta), d[1].s, d[1].b);
  
  //set the color 2
  c[1].setColor1(degrees(rs[1].teta), d[1].s, d[1].b);
  c[1].setColor2(degrees(rs[0].teta), d[0].s, d[0].b);
  
  
  //set the colors when locked
  rs[0].lockColors(rs[1].teta, TWO_PI - radians(a.teta), button.lock, rs[1].drag);
  rs[1].lockColors(rs[0].teta, radians(a.teta), button.lock, rs[0].drag);
  
  
  
  //DISPLAY ELEMENTS
  for (int i = 0; i < 2; i++)
  {
    //display disks
    d[i].display();
    
    //display round sliders
    rs[i].dragRSlider(mouseX, mouseY);    
    rs[i].display();
       
    //display colors 
    c[i].display();
  } 
 
 
   //display horizontal sliders
  for(int i = 0; i < 4; i++)
  {
    sb[i].displayBar();
    sb[i].rollover(mouseX, mouseY);
    sb[i].dragSlider(mouseX, mouseY); 
    sb[i].displaySlider();
  }
 
 
 //display angle locker
  button.displayBg();
  button.displayButton();
  
  a.rollover(mouseX, mouseY, button.lock);
  a.display(button.lock);
  a.displayControls(); 
  a.fade(button.lock);
}


/*-------------------------------------------------------*/


void mousePressed()
{    
  for(int i = 0; i < 4; i++)  
  {
    sb[i].mousePress(mouseX, mouseY);  //click to drag the slider
    sb[i].mouseClick(mouseX, mouseY);  //click on the bar
  }
  for(int i = 0; i < 2; i++)  {  rs[i].mousePress(mouseX, mouseY);  }  //click to drag the radial slider
  a.mouseClick(mouseX, mouseY, button.lock);  //click to change the angle
  button.mouseclick(mouseX, mouseY);  //click to lock/unlock the angle
}


/*-------------------------------------------------------*/


void mouseReleased()  //reset colors and stop dragging
{ 
  for(int i = 0; i < 4; i++)
  {  
    sb[i].stopDrag();  //slider
    sb[i].stopClick();  //bar
  }  
  for(int i = 0; i < 2; i++)  {  rs[i].stopDrag();  }  //radial slider
  a.stopClick();  //angle controllers
}


/*-------------------------------------------------------*/


class onOff
{
  int x,y;  //position of the begin of the button
  int r;  //status of the button position
  boolean lock; //true: angle locked, false: colors can be change independently
  
  
  onOff(float x_, float y_)
  {
    r =  0;
    x = int(x_);
    y = int(y_);
    lock = false;
  }
  
  
  void displayBg()
  {
    noStroke();  
    fill(127);
    rectMode(CORNER);
    rect(x, y, 60, 20);
  }
  
  
  void displayButton()
  {
    noStroke();   
    fill(250);
    rectMode(CORNER);
    rect(x + r, y, 30, 20);
  }
  
  
  void mouseclick(int mx, int my)
  {
    boolean testX = ((mx - x) > (30 - r)) && ((mx - x) < (60 - r));
    boolean testY = ((my - y) > 0) && ((my  - y) < 20);
    if (testX && testY)
    {
      if (r != 0)
      {
        r = 0;
        lock = false;
      }
      else
      {
        r = 30;
        lock = true;
      }
    }
  }
}

/*-------------------------------------------------------*/


class arch
{
  int x, y;  //position of the center of the arc
  int diam;  //diameter
  int teta;  //lock angle
  boolean rollPlus, rollMinus;  //true: cursor over the controller
  boolean clickPlus, clickMinus; //true: mouse click of the controller
  
  
  arch(float x_, float y_)
  {
    diam = 50;
    teta = 180;
    x = int(x_);
    y = int(y_);
    rollMinus = rollPlus = false;
    clickMinus = clickPlus = false;
  }
  
  
  void display(boolean lock)
  {
    //display the angle as an image
    if(lock)
    {
      noStroke();
      fill(100);
      arc(x, y, diam, diam, TWO_PI - radians(teta), TWO_PI);
    }
    
    //display the arc
    strokeWeight(2);
    stroke(270);
    noFill();  
    arc(x, y, diam, diam, PI, TWO_PI);
    
    //display the angle as points on 0 degrees and teta
    if(lock)
    {
      strokeWeight(5);
      stroke(0);
      point(x + diam/2, y);
      point(x + (diam/2)*cos(radians(teta)), y - (diam/2)*sin(radians(teta)));
    }
    
    //display the angle as a text
    textAlign(CENTER, BOTTOM);
    textSize(15);
    fill(270);
    if(lock)  {  text(int(teta) + "°", x, y);  }
    else  {  text("free", x, y);  }
  
  }
  
  
  void displayControls()
  {
    noStroke();
    
    //Plus button
    if (clickPlus) {fill(330);}
    else if (rollPlus) {fill(270);}
    else {fill(250);}
    ellipse(x - 50, y - 10, 20, 20);
    
    //Minus button
    if (clickMinus) {fill(330);}
    else if (rollMinus) {fill(270);}
    else {fill(250);}
    ellipse(x + 50, y - 10, 20, 20);
    
    //Texte
    fill(180);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("+", x - 50, y - 10);  //plus
    text("-", x + 50, y - 10);  //minus
  }
  
  
  void fade(boolean lock) //fade arc when the angle is free
  {
    if(!lock)
    {
      noStroke();
      fill(180, 150);
      rectMode(CENTER);
      rect(x, y - 10, 140, 40);
    }
  }
  
  
  void mouseClick(int mx, int my, boolean lock)
  {
    if (lock)
    {
      boolean testPlus = dist(mx, my, x - 50, y - 10) < 10;
      boolean testMinus = dist(mx, my, x + 50, y - 10) < 10;
      if (testPlus)
      {
        teta += 15;
        clickPlus = true;
      }
      else if (testMinus)
      {
        teta -= 15;
        clickMinus = true;
      }
      teta = constrain(teta, 0, 180);    
    }
  }
  
  
  void stopClick()
  {
    clickPlus = false;
    clickMinus = false;
  }
  
  
  void rollover(int mx, int my, boolean lock)
  {
    if (lock)
    {
      boolean testPlus = dist(mx, my, x - 50, y - 10) < 10;
      boolean testMinus = dist(mx, my, x + 50, y - 10) < 10;
      
      if (testPlus)  {  rollPlus = true;  }
      else if (testMinus)  {  rollMinus = true;  }
      else
      {
        rollPlus = false;
        rollMinus = false;
      }
    }
  }
  
}

/*-------------------------------------------------------*/


class displayColor
{
  int x, y;   //position of the center of the display
  int diam;  //diameter of the display
  int h1, s1, b1;  //hsb values of the main color
  int h2, s2, b2;  //hsb values of the other color
  String txt;   //name of the color
  
  displayColor(float x_, float y_, String txt_)
  {
    h1 = h2 = 360;
    s1 = s2 = 100;
    b1 = b2 = 100;
    diam = 100;
    x = int(x_);
    y = int(y_);    
    txt = txt_;
  }
  
  void display()
  {
    noStroke();
    
    //the other color in order to see them together
    fill(h2, s2 , b2);
    ellipse(x + 35, y + 35, diam/2,  diam/2);
    
    //the main color
    fill(h1, s1, b1);
    ellipse(x, y, diam, diam);
    
    //text
    fill(127);
    textAlign(CENTER);
    textSize(15);
    text("H: " + h1 + "  S: " + s1 + "  B: " + b1, x, y + diam);  //hsb values
    textSize(20);
    text(txt, x, y - 80);  //color name
  }
  
  void setColor1(float h_, float s_, float b_)  //set the main color
  {
    h1 = int(h_);
    s1 = int(s_);
    b1 = int(b_);
  }
  
  void setColor2(float h_, float s_, float b_)  //set the other color
  {
    h2 = int(h_);
    s2 = int(s_);
    b2 = int(b_);
  }
  
}

/*-------------------------------------------------------*/


class disk
{
  int x, y; //position of the center of the disk
  int rInt, rExt; //intern and extern radius
  float s, b;  //saturation and brightness
  
  disk(float x_, float y_, int rInt_, int rExt_)
  {
    s = 100;
    b = 100;
    x = int(x_);
    y = int(y_);
    rInt = rInt_;
    rExt = rExt_;
  }
   
  
  void display()
  {
    pushMatrix();
    translate(x, y);
    
    for (int j = 0; j < 360; j++)
    {
      rotate(radians(1));
      noStroke();
      fill(j, s, b);
      rectMode(CORNER);
      rect(rInt, 0, rExt-rInt, 3);
    }       
    popMatrix();   
  }
  
  
  void setSaturation(float r, float w)
  {
    s = map(r, 0, w, 0, 100);
  }
  
  
  void setBrightness(float r, float w)
  {
    b = map(r, 0, w, 0, 100);
  } 
  
}


/*-------------------------------------------------------*/


class radialSlider
{
  
  int x, y; //position of the center of the slider 
  int r;  //radius of the arc of the slider
  float teta;  //angle
  color c1, c2;  //colors of the stroke and fill
  int diam;  //diameter of the button of the slider
  int sx, sy;  //position of the button of the slider
  boolean drag;  //true: dragging the slider
  
  radialSlider(float x_, float y_, float r_, float teta0, color c1_, color c2_)
  {
    diam = 10;
    x = int(x_);
    y = int(y_);
    r = int(r_);
    teta = teta0; //initial angle is different for each color
    c1 = c1_;
    c2 = c2_;
    drag = false;
  }
  
  
  void display()
  {
    sx = (int)(x + r*cos(teta));
    sy = (int)(y + r*sin(teta));    
    strokeWeight(2);
    stroke(c1);
    fill(c2);    
    ellipse(sx, sy, diam, diam);
  }
  
  
  void dragRSlider(int mx, int my)
  {
    if (drag)
    { 
      PVector v1 = new PVector(x, y);
      PVector v2 = new PVector(mx,my);
      teta = angle(v1, v2);
      if (teta < 0) {teta = TWO_PI + teta;}
    }
  }
  
  
  void mousePress(int mx, int my)
  {
    if (dist(mx, my, sx, sy) < diam/2)
    {
      drag = true;
    } 
  }
    
    
  void stopDrag()
  {
    drag = false;
  }
  
  
  void lockColors(float angle1, float angle2, boolean lock, boolean dragOther)
  {
    if (lock && dragOther)
    {
      if(angle1 < angle2) {teta = angle1 + (TWO_PI - angle2);}
      else {teta = angle1 - angle2;}
    }
  }
  
}


/*-------------------------------------------------------*/


float angle(PVector v1, PVector v2)
{
  float teta = 0;
  float r = sqrt(sq(v2.y-v1.y)+sq(v2.x-v1.x));  //distance v1-v2
  
  float cteta = (v2.x - v1.x)/r;
  float steta = (v2.y - v1.y)/r;

  if (cteta >= 0 && steta >= 0) {teta = acos(abs(cteta));} //quadrant 1
  if (cteta < 0 && steta > 0) {teta = PI - acos(abs(cteta));} //quadrant 2
  if (cteta <= 0 && steta <= 0) {teta = acos(abs(cteta)) + PI;} //quadrant 3
  if (cteta > 0 && steta < 0) {teta = acos(abs(cteta)) * (-1);} //quadrant 4
  
  return teta;
}

/*-------------------------------------------------------*/


class slider
{  
  float x, y;  //position of the corner of the slider
  float w;  //width of the bar of the slider
  String txt;  //name of the slider
  float r;  //position of the button of the slider
  boolean drag;  //true: dragging the button of the slider
  boolean roll;  //true: cursor over the button of the slider
  boolean click;  //true: clicking on the bar of the slider  
  float dx, dy; //distance betwen cursor and the center of the button of the slider
    
  
  slider(float x_, float y_, float w_, String txt_)
  {
    dx = 0;
    dy = 0;
    x = x_;
    y = y_;
    w = w_;
    txt = txt_;
    r = w;  //r begins at the end of the bar
    drag = false;
    roll = false;
    click = false;  
  }
 
 
  void displayBar()
  {      
    noStroke();
    rectMode(CORNER);
    
    //display the entire bar
    fill(127); 
    rect(x, y, w, 10);
    
    //display the filled part of the bar
    if (click) {  fill(115);  }
    else {  fill(100);  }
    rect(x, y, r, 10);
    
    //display the name of  the bar
    fill(100);
    textAlign(LEFT);
    textSize(12);
    text(txt, x,y + 25);
  }
 
 
  void displaySlider()
  {  
    if (drag) {  fill(330);  }
    else if (roll) {  fill(270);  }
    else {  fill(250);  }
    
    noStroke();
    rectMode(CENTER);    
    rect(r + x, y + 5, 10, 20);
  }


  void rollover(int mx, int my)
  {
    boolean testX = ((mx - x) < (r + 5)) && ((mx - x) > (r - 5));
    boolean testY = ((my - y) < (10)) && ((my  - y) > (-10));
    
    if(testX && testY) {  roll = true;  }
    else {  roll = false;  }
  }

  
  void dragSlider(int mx, int my)
  {
    if (drag)
    {
      r = (mx - x) + dx;
      r = constrain(r, 0, w);
    }
  }
    
  
  void mousePress(int mx, int my)
  {
    boolean testX = ((mx - x) < (r + 5)) && ((mx - x) > (r - 5));
    boolean testY = ((my - y) < (10)) && ((my  - y) > (-10));
    
    if(testX && testY)
    {
      drag = true;
      dx += (mx - x) - r;     
    }
  }
 
 
  void mouseClick(int mx, int my)
  {
    boolean testX_plus = ((mx - x) > (r + 5)) && ((mx - x) < w);
    boolean testX_minus = ((mx - x) > 0) && ((mx - x) < (r - 5));
    boolean testY = ((my - y) < 10) && ((my  - y) > -10);
    
    if (testY && (testX_plus || testX_minus)) {  click = true;  }
    if (testY && testX_plus) {  r += 1;  }
    else if (testY && testX_minus) {  r -= 1;  }
  }
  
  
  void stopDrag()
  {
    drag = false;
  }
 
 
  void stopClick()
  {
    click = false;
  }
   
}


