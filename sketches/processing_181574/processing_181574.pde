
//big number fills screen every second then fade away

int space = 1000; //seconds between markers
int startTime, pastTime, count;
boolean marker = false; 
float  startX, startY, h, s, b, a; 
PFont myFont;
boolean test = false;

void setup(){
  colorMode( HSB ); //HSB rather than RGB

  size (400,400);
  background (50,25,24); //dark
  
  //beginning time
  startTime = millis(); //record start time
  pastTime = startTime + space; //set up first marker

  //number font properties
  myFont = createFont("UniversLTStd-Bold", 100, false);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  
  count = 0; //counting seconds
  
  startX = random(width); //starting position
  startY = random(height); //starting position
  
  h = 60; //default hue
  s = 255; //default saturation
  b = 255; //default brightness
  a = 245; //default alpha
}


void draw(){

  //testing if marker is true
  if( millis() >= pastTime && count <= 59){  //set spread between markers
    pastTime = pastTime + space; //create next spread value
    
    marker = true; //set up illustration
    count++; //increase one second
    
    startX = random(50,300); //random x position of type
    startY = random(50,350); //random y position of type
    
    //h = random(30,75); //random green controlled hue
    h = random(7,35); //random but controlled red hue
  } else {
    marker = false; //pause for 999 millaseconds
  }

  
  if(marker) { //on the second that it is true, draw.
    fill (50,25,24,65); //fade old numbers into background
    rect (0,0,width, height);
  
    fill(h,s,b,a); //random type color
    textSize(random(100,300)); //variety in size
    text(count, startX, startY); //type is count of seconds
  } 

  
}
