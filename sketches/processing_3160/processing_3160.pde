
// "Art is Long, Time is Fleeting..." Longfellow
//
// User Controlled Inputs
// 
// 'k' : toggle shade gradient key
// 'g' : toggle whether blocks grow or not
// 'z' : toggle random/real time
//
//

int hh,mm,ss; 
boolean randtime, showtime, grow, showkey;
PFont font;
int fsize = 16; 

void setup() {
  size(380,140);
  background(0);
}
void draw() {
  background(0);
  stroke(255);
  noFill();
  rect(20,20,100,100);
  rect(140,20,100,100);
  rect(260,20,100,100);
  noStroke();
  if(keyPressed) {
    if (key == 'z') { 
      randtime = !randtime; 
      hh = int(random(24)); 
      mm = int(random(60)); 
      ss = int(random(60)); 
    }
    if (key == 'd') {   
      showtime = !showtime;   
    }   
    if (key == 'g') {
      grow = !grow;   
    }   
    if (key == 'k') {
      showkey = !showkey;   
    }   
    delay(200);
  }
  if(!randtime) {
    hh = hour();
    mm = minute();
  }
  ss = second();
  if (grow) {    
    fill(map(hh, 0,24, 0, 255));
    rect(20,20,map(hh,0,24,0,100),100);
    fill(map(mm, 0,60, 0, 255));
    rect(140,20,map(mm,0,60,0,100),100);
    fill(map(ss, 0,60, 0, 255));
    rect(260,20,map(ss,0,60,0,100),100);  
  }
  else {
    fill(map(hh, 0,23, 0, 255));
    rect(20,20,100,100);
    fill(map(mm, 0,59, 0, 255));
    rect(140,20,100,100);
    fill(map(ss, 0,59, 0, 255));
    rect(260,20,100,100);  
  }
  if (showkey) {
    for (int i=0; i < 24; i++) {
      fill(map(i, 0,24, 0, 255));
      rect(20 + map(i,0,24,0,100),20,100/24,20);  
    }    
    for (int i=0; i < 60; i++) {
      fill(map(i, 0,60, 0, 255));
      rect(260 + map(i,0,60,0,100),20,100/60,20);  
      rect(140 + map(i,0,60,0,100),20,100/60,20);  
    }
  }
  if (showtime) {  
    font = createFont("FFScala", fsize);   
    fill(255);
    textFont(font);   
    text(String.format("%02d",hh) ,70 - fsize/2,fsize);
    text(":",130,fsize);
    text(String.format("%02d",mm) ,190 - fsize/2,fsize);  
    text(":",250,fsize);
    text(String.format("%02d",ss) ,310 - fsize/2,fsize);  
  }  
}





















