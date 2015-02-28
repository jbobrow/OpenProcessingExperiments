

//declare variables
int [][] points= { {149,72}, {192,83}, {221,115}, {236,155}, {221,194}, 
                   {191,225}, {150,240}, {108,225}, {78,195}, {63,155}, 
                   {78,115}, {106,83} };
String[] numbers = new String[]{"12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"};      
PFont garamond;
int changeEvery = 1; //minutes
int changeMin = minute()/changeEvery * changeEvery;
int pseudoMin = changeMin;
int pseudoHr = hour();
float s, m, h;

void setup() {
  size(300,300);
  frameRate(1);
  background(255,255,255);
  
  smooth();
  strokeCap(PROJECT);
  strokeJoin(MITER);
  
  garamond = loadFont("AGaramondPro-BoldItalic-48.vlw");
  textFont(garamond);
  textSize(18);
  textAlign(CENTER);
  
  randomise();
}

void draw() {
  
  //clockface
  background(255);
  noStroke();
  
  PImage img;  
  img=loadImage("screen3.png"); //shadow
  image(img,-20,-19,345,345);
  
  fill(255,252,253,230); //face
  ellipse(150,150,204,204); 
   
  fill(255); //bigwhitering
  ellipse(150,150,23,23); 
  fill(0,150); //center
  ellipse(150,150,20,20);
  fill(255); //smallwhitering
  ellipse(150,150,12,12);
  fill(0); //smallcenter
  ellipse(150,150,10,10);
  
  
  clockNumbers();
  
  //clockwork
 
  m = map(pseudoMin,0,60,0,TWO_PI) - HALF_PI;
  h = map(pseudoHr % 12,0,12,0,TWO_PI) - HALF_PI;
  s = map(second(),0,60,0, TWO_PI) - HALF_PI;
  
  //clockhands
  strokeWeight(1.5);
  stroke(0);
  line(150,150,cos(s) * 75+150, sin(s) * 75+150); //secondhand
  strokeWeight(3);
  stroke(0);
  line(150,150,cos(m) * 75+150, sin(m) * 75+150); //minutehand
  line(150,150,cos(h) * 55+150, sin(h) * 55+150); //hourhand
  
 
  if ((minute()/changeEvery * changeEvery) != changeMin) {
    changeMin = minute()/changeEvery * changeEvery;
    randomise();
  }
}

void keyPressed() {
  randomise();
}

void randomise() {
  //pick random numbers
  Collections.shuffle(Arrays.asList(numbers));
  
  //calculate positions for minute hand
  int clockNum = changeMin/5;
  if (clockNum == 0) { clockNum = 12; }
  for (int i = 0; i < numbers.length; i++) {
    if (int(numbers[i]) == clockNum) {
      pseudoMin = i * 5;
      break;
    }
  }
  
  //calculate positions for hour hand
  clockNum = hour();
  if (clockNum > 12) { clockNum = clockNum - 12; }
  if (clockNum == 0) { clockNum = 12; }
  for (int i = 0; i < numbers.length; i++) {
    if (int(numbers[i]) == clockNum) {
      pseudoHr = i;
      break;
    }
  }
}

void clockNumbers() {
  fill(0);
  for (int i = 0; i < 12; i++) {
    text(numbers[i], points[i][0], points[i][1]);
  }
}
    
  

