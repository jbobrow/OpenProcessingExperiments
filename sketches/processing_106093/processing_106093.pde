
float hourtx;

float hourX;
float minuteX;
float secondX;
int clock3 = 10;
int clock = 300;
int clock2 = 300;
void setup () {
  size(600, 600);
  noFill();
}

void draw() {
    background(255);
    clock3 = 10;
  for (int i = 0; i < 25; i++) {
    noFill();
    clock3 = clock3 + 20;
    ellipse(0, 300, clock3, clock3);
  }
 
 clock2 = 300;
    clock = 300;
for (int i = 1; i < 20; i++) {
  noFill();
  clock = clock + 10;
  clock2 = clock2 + 10;
  rect(clock, 100, 10, 100);
rect(clock2, 300, 10, 100);
}
  hourX = map(hour(), 0, 23, 0, 500);
  secondX = map(second(), 0, 59, 300, 490);
  minuteX = map(minute(), 0, 59, 300, 490);

  fill(200, 135, 200);
  rect(minuteX, 100, 10, 100);
  fill(164, 220, 240);
  rect(secondX, 300, 10, 100);

//     for (int i = 0; i < 24; i++) {
        fill(0, 0, hourX/2, hourX/2);
      ellipse(0, 300, hourX, hourX);
      println(hourX);
//    }
 
  
}
