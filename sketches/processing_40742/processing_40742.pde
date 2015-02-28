
int hours;
int minutes;
int seconds;

float hoursBrightness;
int overAmount;
int math;

void setup() {
  size(600, 600);
  colorMode(HSB, 60, 60, 24, 200);
  background(0, 0, 0);
  strokeCap(ROUND);
  smooth();
}

void draw() {

 noStroke();
 hours = hour();
 minutes = minute();
 seconds = second();
 
 //rapid hour tester
// hours = seconds;
// println(hours);

 float random200 = random(0,200);
background(seconds, minutes, hoursBrightness, random200);

if (hours >= 0 && hours <= 5) {
   hoursBrightness = hours * 1.1;
 } else if (hours > 5 && hours <= 10) {
   hoursBrightness = hours * 1.4;
 } else if (hours > 10 && hours <= 14) {
   hoursBrightness = hours * 1.6;
 } else if (hours > 14 && hours <= 18) {
   overAmount = hours - 14;
   math = 14 - overAmount;
   hoursBrightness = math * 1.2;
 } else if (hours > 18 && hours <= 22) {
   overAmount = hours - 14;
   math = 14 - overAmount;
   hoursBrightness = math * 0.8;
 } else if (hours > 20 && hours <= 23) {
   overAmount = hours - 14;
   math = 14 - overAmount;
   hoursBrightness = math * 0.6;
 } 
 
 //hours vs hoursBrightness test
// println(hours);
// println(hoursBrightness);

 int hourPosition = (23-hours)*25;
 int minPosition = (59-minutes)*10;
 int secPosition = (59-seconds)*10;
 
 fill(0, 0, 24, 50);
 rect(0, hourPosition, 200, 25);
 fill(0, 0, 24, 100);
 rect(200, minPosition, 200, 10);
 fill(0, 0, 24, 175);
 rect(400, secPosition, 200, 10);
 
 if (minutes < 30) {
  minutes += 30; 
 }
 
 stroke(0, 0, 24, random(0,200));
 //strokeWeight(seconds);
  

 /*
 if (mousePressed==true) {
   noStroke();
   //float random200 = random(0,200);
   fill(seconds, minutes, hoursBrightness, random200);
   ellipse(mouseX + random(-40,40), mouseY + random(-40,40), random200, random200);
   
   for (int i=0; i<10; i++){
     float random5 = random(0,5);
     float random50 = random(0,50);
     float random600 = random(0,600);
     fill(seconds + random5, minutes + random5, hoursBrightness +random5, random50);
     ellipse(mouseX + random(-100,100), mouseY + random(-100,100), random600, random600);
   }
   
   stroke(0, 0, 24, 25);
    line(mouseX, mouseY, mouseX + random(-60,60), mouseY + random(-60,60));
    strokeWeight(2);
    line(mouseX, mouseY, mouseX + random(-40,40), mouseY + random(-40,40));
     strokeWeight(3);
    line(mouseX, mouseY, mouseX + random(-20,20), mouseY + random(-20,20));
 }
 */


 
}

