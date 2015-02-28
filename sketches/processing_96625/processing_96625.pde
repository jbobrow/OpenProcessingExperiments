
int day;
int hour;
int minute;
int second;
PFont myFont;

/////////////////////////////////////////////////////
void setup() {
  size(400, 400);
  background(175, 224, 255);
  myFont = createFont("arial", 40);
  textFont(myFont);
}

void patal() {
  pushMatrix();
  scale(random(1.5, 2));
  fill(255,178,217, random(0,100));
  ellipse(0, 0, 10, 20);
  popMatrix();
}

void draw(){
  
  noStroke();
  fill(135, 206, 0);
  rect(0, 300, 400, 110);
  fill(188, 224, 103);
  rect(90, 170, 10, 130);
  rect(160, 170, 10, 130);
  rect(230, 170, 10, 130);
  rect(300, 170, 10, 130);
  
  fill(255,255,162);
  ellipse(100, 185, 60, 60);
  ellipse(170, 185, 60, 60);
  ellipse(240, 185, 60, 60);
  ellipse(310, 185, 60, 60);
  //////////////////////////////////////// 
  fill(20);
  textSize(40);
  textAlign(CENTER);
  text(day, 100, 200);
  text(hour, 170, 200);
  text(minute, 240, 200);
  text(second, 310, 200);
 
  textSize(20);
  text("day", 100, 150);
  text("hour", 170, 150);
  text("minute", 240, 150);
  text("second", 310, 150);
  

 if(!mousePressed){
  day = day();
  hour = hour();
  minute = minute();
  second = second();
 }
  else if(mousePressed){
   translate(mouseX, mouseY);
   patal();
  
 if(mouseX>=70 && mouseX<=130){
   day = day+1;
   if(day>31) {
     day = 1;
   }
 }
 else if( mouseX>=140 && mouseX<=200){
   hour = hour +1;
   if(hour>=24) {
     hour = 0;
   }
 }
 else if( mouseX>=210 && mouseX<=270){
   minute = minute +1;
   if(minute>=60) {
     minute = 0;
   }
 }
 else if(mouseX>=280 && mouseX<=340){
   second = second +1;
   if(second>=60) {
     second = 0;
   }
 }
 
  }
 
  hour = constrain(hour, 0, 23);
  minute = constrain(minute, 0, 59);
  second = constrain(second, 0, 59);
  }
