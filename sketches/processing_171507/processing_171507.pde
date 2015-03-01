
Counter counter;
 
int count = 0;

void setup() {
  size(600, 600);
  counter = new Counter(1000);
  counter.start();
}
 
 
void draw() {
 
  //causes the smiley face to appear in random place on grid
  float x = (random(400));
  float y = (random(400));
   
 
  if (counter.isDone()) {
   //change background every second randomly
   background(color(random(255), random(255), random(255)));
   
   //face
    fill(color(random(255), random(255), random(255)));
    stroke(0);
    strokeWeight(2);
    ellipse(x, y, 100, 100);
   
   //left eye 
    fill(0);
    ellipse(x+15,y-20,10,10);
   
    //right eye
    ellipse(x-15,y-20,10,10);
   
   //smile
    noStroke();
    curve(x-50, y-30, x-20, y+20, x+20, y+20, x+50, y-30);
    
    //prints every second
    println("one second passed");
     
    count++;
    counter.start();
  }
 

  if (count == 60) {
    //After every one minute, screen flashes one minute has passed
    fill(color(random(255), random(255), random(255)));
    textSize(50);
    text("Minute Has Passed", 80, 230);
    //prints one minute has passed
    println("Minute Has Passed");
    fill(0);
    count = 0;
  }
 
}

class Counter {
  
  int savedTime;
  int totalTime;
   
  Counter(int temptotalTime) {
    totalTime = temptotalTime;
  }
   
  
  void start() {
    savedTime = millis();
  }
 
  boolean isDone() {
  
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
