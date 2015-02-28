
int[] secondsX = new int[59];
float secondsColor;
float minutesHour;
float hoursColor;


void setup() {
  size (895, 220);
  background(#000000);
  fill (#C9C9C9);
}

void draw() {
  background(#000000);
  
  for (int i=0; i<60; i++) { 
    if (second() >= i) {
      fill(i*5, 100, 255, 255);
      rect(i*15, 0, 10, 30);
      println(i*15);
    } 
    else {
      fill(i*5, 100, 255, 150);
      rect(i*15, 0, 10, 30);
    }
  }

  for (int i=0; i<60; i++) {
    if (minute() >= i) {
      fill(255, i*5, 100, 255);
      rect(i*15, 40, 10, 60);
    } 
    else {
      fill(255, i*5, 100, 100);
      rect(i*15, 40, 10, 60);
    }
  }
  for (int i=0; i<24; i++) {
    if (hour()>=i) {
      fill(i*10, 255, i*5, 255);
      rect(i*((width/25)+3), 110, ((width/25)-3), 120);
  
  }
    else {
      fill(i*10, 255, i*5, 100);
      rect(i*((width/25)+3), 110, ((width/25)-3), 120);
    }
  }
}
