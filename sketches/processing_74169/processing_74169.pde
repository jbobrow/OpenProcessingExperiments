
PFont font;

float hourISTX;
float hourESTX;
float minuteX;
float secondX;
float istColorRed = 150;
float istColorGreen = 200;
float istColorBlue = 0;
float pitColorRed = 255;
float pitColorGreen = 200;
float pitColorBlue = 0;

void setup() {
  size(720, 400);
  font = createFont("Helvetica", 24);
  noStroke();
}

void draw() {
  background(120);
  fill(240);
  textFont(font);
  float calcIstTime = hour() + 7;
  if (calcIstTime >= 24) {
    calcIstTime = calcIstTime - 24;
  }

  hourISTX = map(calcIstTime, 0, 23, 0, width);
  hourESTX = map(hour(), 0, 23, 0, width);
  minuteX = map(minute(), 0, 59, 0, width);
  secondX = map(second(), 0, 59, 0, width);

  if ((calcIstTime >= 10) && (calcIstTime <= 24 )) {
    istColorRed = 150;
    istColorGreen = 200;
    istColorBlue = 0;
    fill(istColorRed, istColorGreen, istColorBlue);
    text("Awake", 10, 150);
  }
  else {
    istColorRed = 25;
    istColorGreen = 25;
    istColorBlue = 25;
    fill(istColorRed, istColorGreen, istColorBlue);
    text("Asleep", 10, 150);
  }

  if ((hour() >= 7) && (hour() <= 24 )) {
    pitColorRed = 150;
    pitColorGreen = 200;
    pitColorBlue = 0;
    fill(pitColorRed, pitColorGreen, pitColorBlue);
    text("Awake", 10, 50);
  }
  else {
    pitColorRed = 25;
    pitColorGreen = 25;
    pitColorBlue = 25;
    fill(pitColorRed, pitColorGreen, pitColorBlue);
    text("Asleep", 10, 50);
  }


  fill(istColorRed, istColorGreen, istColorBlue);
  rect(0, 150, hourISTX, 50);
  fill(255, 255, 255); 
  text(("Istanbul - " + round(calcIstTime) + ":" + minute() + ":" + second()), 10, 185);
  
  fill(pitColorRed, pitColorGreen, pitColorBlue);
  rect(0, 50, hourESTX, 50);
  fill(255, 255, 255); 
  text(("Pittsburgh - " + hour() + ":" + minute() + ":" + second()), 10, 85);
  
  fill(100, 135, 200);
  rect(0, 250, minuteX, 50);
  
  fill(164, 220, 240);
  rect(0, 300, secondX, 50);
}
