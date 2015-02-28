

int hours;
int minutes;
int seconds;

float ypos = 0;

void setup() {
  size(600, 500);
  colorMode(RGB);
  background(214, 44, 192);
  smooth();
}

void draw() {
 

 hours = hour();
 minutes = minute();
 seconds = second();
 
 println(hours + " " + minutes + " " + seconds);
    
    // fix for 24 hour clock // don't need to or hours won't seem long enough
//  if(hours > 12) {
//   hours -= 12; 
//  }
 
  background(250, 235, 215);
   
  PFont font;
  font = loadFont("NeutraText-BoldItalic-28.vlw"); 
  textFont(font); 
  fill(0, 102, 153);
  text("Hours", 100, 25);
  fill(0, 102, 153);
  text("Minutes", 250, 25); 
  fill(0, 102, 153);
  text("Seconds", 400, 25); 
  fill(0, 102, 153);
  
  translate(20,30);
  
 for (int i = 0; i <= hours; i++) {
      fill(20, 220, ypos+hours);
      stroke(250, 235, 215);
      rect(100, 14*i, 30, 12);
}

 for (int i = 0; i <= minutes; i++) {
      fill(ypos+minutes, 20, 220);
      stroke(250, 235, 215);
      rect(250, 7*i, 30, 5);
}
  
  for (int i = 0; i <= seconds; i++) {
      stroke(250, 235, 215);
      fill(220, 20, ypos+seconds);
      rect(400, 7*i, 30, 5);
}
  
    // hour guage
  if (hours==0) {
      noFill();
  }
 
    // minute guage
  if (minutes==0) {
      noFill();
 }

    // second guage
  if (seconds==0) {
      noFill();
  }
  
}

