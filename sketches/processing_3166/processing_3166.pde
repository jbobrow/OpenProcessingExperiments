
// "Art is Long, Time is Fleeting..." Longfellow
//
// Variation on original
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
int margin = 20;
int csize = 400;
int keysize = 20;

void setup() {
  size(csize, csize);
  background(0);
}
void draw() {
  background(0);
  stroke(255);
  noFill();
  int sqsize = csize-2*margin;
  rect(margin,margin,sqsize,sqsize);
  noStroke();
  if(keyPressed) {
    if (key == 'z') { 
      randtime = !randtime; 
      hh = int(random(24)); 
      mm = int(random(60)); 
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
  else {
    if (ss == 59) {
      hh = int(random(24)); 
      mm = int(random(60)); 
    }
  }
  ss = second();
  if (grow) {    
    fill(map(hh, 0,24, 0, 255));
    rect(margin, csize - margin, sqsize/3, -1*map(hh,0,24,0,sqsize));
    fill(map(mm, 0,60, 0, 255));
    rect(margin + sqsize/3, csize - margin, sqsize/3, -1*map(mm,0,60,0,sqsize));
    fill(map(ss, 0,60, 0, 255));
    rect(margin + sqsize*2/3, csize - margin, sqsize/3, -1*map(ss,0,60,0,sqsize));  
  }
  else {
    fill(map(hh, 0,24, 0, 255));
    rect(margin, csize - margin, sqsize/3, -1*sqsize);
    fill(map(mm, 0,60, 0, 255));
    rect(margin + sqsize/3, csize - margin, sqsize/3, -1*sqsize);
    fill(map(ss, 0,60, 0, 255));
    rect(margin + sqsize*2/3, csize - margin, sqsize/3, -1*sqsize);  
  }
  if (showkey) {
    for (int i=0; i < 24; i++) {
      fill(map(i, 0,24, 0, 255));
      rect(margin + sqsize/3 - 2*keysize/3, csize - margin - map(i,0,24,0,sqsize), keysize, -1*sqsize/24);
    }    
    for (int i=0; i < 60; i++) {
      fill(map(i, 0,60, 0, 255));
      rect(margin + 2*sqsize/3 - keysize/3, csize - margin - map(i,0,60,0,sqsize), keysize, -1*sqsize/60);
    }
  }
  if (showtime) {  
    font = createFont("FFScala", fsize);   
    fill(255);
    textFont(font);   
    text(String.format("%02d",hh) , margin + sqsize/3/2 - fsize/2,fsize);
    text(":",margin + sqsize/3,fsize);
    text(String.format("%02d",mm) , margin + 1.5*sqsize/3 - fsize/2,fsize);
    text(":",margin + sqsize*2/3,fsize);
    text(String.format("%02d",ss) , margin + 2.5*sqsize/3 - fsize/2,fsize);
  }  
}



























