
Mood moodEvaluator = new Mood(millis(), 3.0, 1000, 5);

/*
to simulate number of people in the square...
 */
int num = 0;
int getNumberOfPersons() {  
  //int injectedVariance = 10;
  //return (int) abs(random( - injectedVariance, injectedVariance)); 
  return num;
}

void setup() {
  size(1000, 200);
  noFill();
  ellipseMode(CENTER);
  background(0);
  stroke(0xffff00ff);
  // plotterStep = (int) (width /  moodEvaluator.EVALUATION_PER_TIMEUNIT);
}

int plotX = 0;
int lastY = height / 2;

color lastStatus = Mood.NORMAL_MOOD;

void draw() {
  int numberOfPersons = getNumberOfPersons();
  color currentStatus = color(moodEvaluator.updateMood(numberOfPersons, millis()));
    
    stroke(currentStatus);
  if (numberOfPersons == 0) {
    ellipse(plotX, (height / 2), 10, 10);
    lastY = (height / 2);
  } 
  else {
    
    int currentY = (height / 2) - numberOfPersons;
    line(plotX, lastY, plotX, currentY);
    lastY = currentY;
  }
  plotX += 5;
  if (plotX > width - 10) {
    plotX = 10;
    fill(0, 0, 0, 100);
    rect(0, 0, width, height);
  }

}

void keyPressed() {
  if (keyCode == ENTER) {
    num++;
  } else if (num > 0){
     num--; 
  }
}




