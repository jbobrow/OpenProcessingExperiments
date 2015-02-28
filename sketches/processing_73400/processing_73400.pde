
PFont font;
int theTime;
int timeReset;
int a;
void setup() {
  size(600,200);
  smooth();
  font = loadFont("DINPro-Bold-144.vlw");
  textFont(font);
  theTime = 0;//starts at 0
  timeReset = 0;//starts at 0
}

void draw() {
   background (255);
   theTime = millis();//makes variable equal to millis from the start of program
   int i= (theTime-timeReset)/100; //divides the time by 100 to fit within 0-255 range
   int a = (theTime-timeReset);
   fill (i);//fill is theTime divided by 100 to relate the time to a color
   textSize(144);
   text(a,100,150);//displays the millis or the reset time
}

void mousePressed(){
  timeReset = theTime;//makes reset match millis
  a = timeReset;//resets the value on screen to the value from the click
}

