
int lastTimeIChanged;//in milliseconds (1000 = 1 sec)
int changeInterval = 3000; //how many miiliseconds between each change?
void setup() {
  size(500, 500);
  background(random(255), random(255), random(255));
}
void draw() {
  if (millis() > changeInterval + lastTimeIChanged) {
    background(random(255), random(255), random(255));
    lastTimeIChanged = millis(); //you must remember the last time the sketch changed
  } 
}
