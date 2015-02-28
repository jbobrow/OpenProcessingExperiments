
int lastTimeChanged = -3000;
int changeInterval= 3000;
void setup () {
  size(400, 400);
}

void draw() {
  // change the background 3 seconds
  // after the last time we changed the background
  // add lastTimeChanged to changeInterval
  //if the current time is bigger than ltChanged +cI
  // change background
  if (millis() > lastTimeChanged + changeInterval){
    //change background
    background( random(255), random(255), random(255));
    // remeber what time that was
  lastTimeChanged = millis();
}
}
