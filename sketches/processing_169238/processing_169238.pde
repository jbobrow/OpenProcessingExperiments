
PVector pos;
float rot;
int sSize, mSize, hSize;

float sTimer, mTimer, hTimer;

String am_pm;
int year;
int month;
int day;
int hour;
int minute;
int second;
PVector dcPos;

void setup(){
 
 size(800, 800);
 smooth();
 noStroke(); 
 
 pos = new PVector(width/2, height/2);
 dcPos = new PVector(width/2, height*2/3);
 
 sSize = 300;
 mSize = 225;
 hSize = 150;
 
}

void draw() {
 background(225);
 year = year();
 month = month();
 day = day();
 hour = hour(); 
 minute = minute();
 second = second();
 
 drawBackground();
 rotatePointers();
 showDigitalClock();
 drawPointers();
 drawNumber();

}

void drawPointers(){
    
 fill(100);
 ellipse(width/2, height/2, 10,10); 
  
 //Hours pointer
 pushMatrix();
 translate(pos.x, pos.y);
 fill(100);
 rotate(radians(hTimer));
 rectMode(CENTER);
 rect(0, -hSize/2, 6, hSize); //50,50 IS THE ANCHOR!!!
 popMatrix();
 
  //Minutes pointer
 pushMatrix();
 translate(pos.x, pos.y);
 fill(100);
 rotate(radians(mTimer));
 rectMode(CENTER);
 rect(0, -mSize/2, 4, mSize); //50,50 IS THE ANCHOR!!!
 popMatrix();
 
 //Seconds pointer
 pushMatrix();
 translate(pos.x, pos.y);
 fill(100);
 rotate(radians(sTimer));
 rectMode(CENTER);
 rect(0, -sSize/2, 2, sSize); //50,50 IS THE ANCHOR!!!
 popMatrix();

  
}

void rotatePointers(){
   
 sTimer = map(second(), 0, 60, 0, 360);
 mTimer = map(minute(), 0, 60, 0, 360);
 hTimer = map(hour(), 0, 12, 0, 360);
  
}

void drawNumber() {
 pushMatrix();
 textSize(60);
 textAlign(CENTER);
 fill(0, 102, 153);
 text("12", width/2, 80);
 text("1", 560, 120);
 text("2", 700, 250);
 text("3", width - 70, height/2 + 20);
 text("4", 700, height - 210);
 text("5", 560, height - 80);
 text("6", width/2, height - 40);
 text("7", 225, height - 80);
 text("8", 85, height - 210);
 text("9", 55, height/2 + 20);
 text("10", 100, 250);
 text("11", 240, 120);
 popMatrix();
  
}

void showDigitalClock(){
 pushMatrix();
 fill(240);
 rectMode(CENTER);
 rect (dcPos.x, dcPos.y+5, 300, 80);
 popMatrix();
 
 am_pm = (hour > 11 ? "PM" : "AM");
 hour = hour % 12; 
 if(hour == 0) hour = 12;
 
 String y = String.valueOf(year);
 String m = String.valueOf(month);
 String d = String.valueOf(day);
 
 pushMatrix();
 fill (0);
 textSize(50);
 textAlign (CENTER, CENTER);
 
 if(second<10){
  text (hour + ":" + minute + ":0" + second + " " + am_pm, dcPos.x, dcPos.y);
 } else{
  text (hour + ":" + minute + ":" + second + " " + am_pm, dcPos.x, dcPos.y);
 }
 textSize(30);
 text (m + "/" + d + "/" + y, dcPos.x, dcPos.y+60);
 popMatrix();
  
}

void drawBackground(){
  fill(255);
  ellipse(width/2, height/2, 780, 780);
}



