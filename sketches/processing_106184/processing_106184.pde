
PImage eyeClosed;
PImage eyeOpen;
float blinkStart1 = 0;
float blinkStart2 = 60000;
float blinkStart3 = 0;
float minuteTimer = 0;
boolean blinking1 = false;
boolean blinking2 = false;

int newMinutes = 0;
int oldMinutes = 0;

void setup() {
  size(200, 600);
  eyeOpen = loadImage("eye-01.png");
  eyeClosed = loadImage("eye-02.png");
}

void draw() {
  background(255-mouseX, 240-mouseY, 200);
 
 //hour
 textSize(random(100, 170));
 fill(random(220), random(100), random(255));
 text(hour(), 30, 250);
 
  //minute
 textSize(random(50, 80));
 fill(random(100), random(200), 100);
 text(minute(), 30, 550);

  // second eye
  if (millis() > blinkStart1 + 1000) {   
    blinkStart1 = millis();
    println(second());
    blinking1 = !blinking1;
  }

  if(blinking1 == true){
    image(eyeOpen, width/2-40, height/2, 100, 100);   
  } else {
    image(eyeClosed, width/2-40, height/2, 100, 100);
    if(millis() > blinkStart1 + 100){
      blinking1 = true;
    }
    
  }
  
  // minute eye
//  int oldMinutes = minute();
  if(millis() > minuteTimer + 100){
    newMinutes = minute();   
    if(oldMinutes != newMinutes){
      blinking2 = !blinking2;
      minuteTimer = millis();
      oldMinutes = newMinutes;
      println("  MINUTE HAS PASSED! ");
    }
  }
    
//    if (minutes() > blinkStart2 + 600000) {   
//      blinkStart2 = millis();
//      blinking2 = !blinking2;
//    }



//  if(blinking2 == true){
//    image(eyeOpen, width/2-40, height/2-300, 300, 300);   
//  } else {
//    image(eyeClosed, width/2-40, height/2-300, 300, 300);
//    if(millis() > blinkStart2 + 600000 ){
//      blinking2 = true;
//    }
//  }
 
}






