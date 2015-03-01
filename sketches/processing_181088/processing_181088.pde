
void setup() {
  size(850, 300);
  textSize(30);
}

void draw() {
  background(255);
  
  String s = binary(millis()/1000 % 60, 8);
  String m = binary(millis()/60000 % 60, 8);
  String h = binary(millis()/3600000 % 24, 8);
  
  // Draw each lin of our clock
  decode(100, h);
  decode(200, m);
  decode(300, s);
}

// Class for drawing each row of our clock
void decode(int y, String t) {
  for(int box = 0; box < 8; box++) {
    // if Char = 1 the make the box red. Else make it white
    if(t.charAt(box) == "1") {
     fill(0); 
     } else {
       fill(255);
       } 
    rect(box*100, y-100, 100, 100);
    fill(128);
    textAlign(CENTER);
    // Draw binary char
    text(t.charAt(box), box*100+50, y-40);
  }
  
  // Convert and draw binary as int
  text(unbinary(t), 825, y-40);
}
