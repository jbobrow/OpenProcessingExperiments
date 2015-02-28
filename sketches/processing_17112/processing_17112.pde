
PFont uiText;
ArrayList switches;
float from;
float to;
float duration;
float fraction;
float t;
float range;
float distance;
float time = 0.0;
float elapsed = 0.0;
float oldTime = 0.0;
float timeCounter = 0.0;
float offsetTime = 0.0;

int leftMargin = 20;
int topMargin = 40;

int checkColOne = 70;
int dataColOne = 30;

int checkColTwo = 140;
int dataColTwo = 20;

int checkColThree = 150;
int dataColThree = 25;

void setup(){
  size(620, 290);
  noStroke();
  smooth();
  background(204);
  // setup array of checkBoxes 
  switches = new ArrayList();
  for (int i = 0; i <= 23; i++)
  {
      int offset = 50;
      if(i<=7) {
       switches.add(new checkBox(90, (i%8)*20+ offset, 10));
     } else if (i> 7 && i <=15) {
       switches.add(new checkBox(260, (i%8)*20+ offset, 10));
     } else switches.add(new checkBox(430, (i%8)*20+ offset, 10));
  }
  from = 0; // starts at screen center
  to = 100; // ends at screen width
  duration = 10000; // 10 sec
  range = to - from;
  
  // load fonts
  //uiText = loadFont("Kartika-24.vlw");
  uiText = loadFont("LucidaConsole-12.vlw");
  
  // Set the font and its size (in units of pixels)
  textFont(uiText);
}

void draw() {
  // refresh screen with some transparency to see movement
  rectMode(CORNER);
  fill(204, 20);
  rect(0, 0, width, height);
  
  // calculate fraction of time left
  time = millis();
  elapsed = (time - oldTime);
  timeCounter = oldTime + elapsed  - offsetTime;
  oldTime = time;
  t = timeCounter / duration;
  distance = t * range;
  // reset counter when ball leaves screen
  if (t >=1) {
    offsetTime = oldTime;
    } 
  
  // display all checkBoxes
   displayCheckBoxes(0, 23);
  
  // display text
  
  translate(leftMargin, topMargin);
  fill(255);
  textAlign(LEFT);
  rectMode(CORNER);
  int textH = 20;
  int textW = 50;
  text("quad....", 0, 0, textW, textH);
  text("cube....", 0, 20, textW, textH);
  text("quint....", 0, 40, textW, textH);
  text("sine....", 0, 60, textW, textH);
  text("bounce..", 0, 80 , textW, textH);
  text("circ....", 0, 100, textW, textH);
  text("expo....", 0, 120, textW, textH);
  text("back....", 0, 140, textW, textH);
  
  // display instructions and credit
  //textAlign(RIGHT);
  textFont(uiText, 14);
  fill(200, 255, 100);
  text("Tick checkboxes to play corresponding ease functions. Play will loop every ten seconds.",
    0, height - 120, 200, 100);
  textFont(uiText);
  fill(255);    
  text("a supamanu Processing sketch for flashpunk lovers", width/2-55, height - 45);

  // display UI
  // bounding box
  noFill();
  stroke(255);
  rect(checkColOne - 10, -20, 150, 180);
  // background for text
  fill(204);
  noStroke();
  rect(checkColOne + 20, -30, 100, 20);
  // text
  fill(255);
  text("In functions", checkColOne + 30, -15);
  
  translate(checkColOne, 0);
  
  // display all In ease data
  translate(dataColOne,0);
  fill(255);
  if (((checkBox)switches.get(0)).boxTicked)
    ellipse(quadIn(t)*range, 10, 10, 10);
  if (((checkBox)switches.get(1)).boxTicked)
    ellipse(cubeIn(t)*range, 30, 10, 10);
  if (((checkBox)switches.get(2)).boxTicked)
    ellipse(quintIn(t)*range, 50, 10, 10);
  if (((checkBox)switches.get(3)).boxTicked)
    ellipse(sineIn(t)*range, 70, 10, 10);
  if (((checkBox)switches.get(4)).boxTicked)
    ellipse(bounceIn(t)*range, 90, 10, 10);
  if (((checkBox)switches.get(5)).boxTicked)
    ellipse(circIn(t)*range, 110, 10, 10);
  if (((checkBox)switches.get(6)).boxTicked)
    ellipse(expoIn(t)*range, 130, 10, 10);
  if (((checkBox)switches.get(7)).boxTicked)
    ellipse(backIn(t)*range, 150, 10, 10);

  // bounding box for Out functions
  noFill();
  stroke(255);
  rect(checkColTwo-10, 0-20, 155, 180);
  // background for text
  fill(204);
  noStroke();
  rect(checkColTwo+20 , -30, 100, 20);
  // text
  fill(255);
  text("Out functions", checkColTwo + 25, -15);

  translate(checkColTwo, 0);
  
  
  // display all Out ease data
  translate(dataColTwo,0);
  fill(255);
    if (((checkBox)switches.get(8)).boxTicked)
      ellipse(quadOut(t)*range, 10, 10, 10);
    if (((checkBox)switches.get(9)).boxTicked)
      ellipse(cubeOut(t)*range, 30, 10, 10);
    if (((checkBox)switches.get(10)).boxTicked)
      ellipse(quintOut(t)*range, 50, 10, 10);
    if (((checkBox)switches.get(11)).boxTicked)
      ellipse(sineOut(t)*range, 70, 10, 10);
    if (((checkBox)switches.get(12)).boxTicked)
      ellipse(bounceOut(t)*range, 90, 10, 10);
    if (((checkBox)switches.get(13)).boxTicked)
      ellipse(circOut(t)*range, 110, 10, 10);
    if (((checkBox)switches.get(14)).boxTicked)
      ellipse(expoOut(t)*range, 130, 10, 10);
    if (((checkBox)switches.get(15)).boxTicked)
      ellipse(backOut(t)*range, 150, 10, 10);

  
  // bounding box for InOut Functions
  noFill();
  stroke(255);
  rect(checkColThree-10, -20, 155, 180);
  // background for text
  fill(204);
  noStroke();
  rect(checkColThree +5 , -30, 110, 20);
  // text
  fill(255);
  text("InOut functions", checkColThree+10, -15);

  translate(checkColThree, 0);

  
  // display all Out ease data
  translate(dataColThree,0);
  fill(255);
  if (((checkBox)switches.get(16)).boxTicked)
    ellipse(quadInOut(t)*range, 10, 10, 10);
  if (((checkBox)switches.get(17)).boxTicked)
    ellipse(cubeInOut(t)*range, 30, 10, 10);
  if (((checkBox)switches.get(18)).boxTicked)
    ellipse(quintInOut(t)*range, 50, 10, 10);
  if (((checkBox)switches.get(19)).boxTicked)
    ellipse(sineInOut(t)*range, 70, 10, 10);
  if (((checkBox)switches.get(20)).boxTicked)
    ellipse(bounceInOut(t)*range, 90, 10, 10);
  if (((checkBox)switches.get(21)).boxTicked)
    ellipse(circInOut(t)*range, 110, 10, 10);
  if (((checkBox)switches.get(22)).boxTicked)
    ellipse(expoInOut(t)*range, 130, 10, 10);
  if (((checkBox)switches.get(23)).boxTicked)
    ellipse(backInOut(t)*range, 150, 10, 10);
}

// function to display a certain number of checkboxes
void displayCheckBoxes(int from, int to){
  for (int i = from; i <= to; i++) {
   // An ArrayList doesn't know what it is storing
   // so we have to cast the object coming out
    checkBox tickBox = (checkBox) switches.get(i);
    //println("X: "+offsetX+"Y: "+offsetY);
    tickBox.update();
    tickBox.display();
    //println("box #: " +i+" boxX: "+tickBox.x+" boxY: "+tickBox.y+" X: "+(tickBox.x+offsetX)+" Y: "+(tickBox.y+offsetY));
    //println("box #: " +i+ " x " +tickBox.x +" y " + tickBox.y);
    //println(tickBox.y);
  }
}

