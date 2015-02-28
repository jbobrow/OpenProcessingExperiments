
// Binary Clock
// Ali Reza Kohani
// 6/9/2013


// Array with Binary Key
int[] ma = {32, 16, 8, 4, 2, 1};

void setup() {
  size(650, 300);
  smooth();
}



void draw() {
  background(50);
  
  int the_hour = hour();
  if(the_hour > 12) { 
    the_hour = the_hour - 12;
  }
  
  if(the_hour == 0) { 
    the_hour = 12;
  }
  
  String h = binary(the_hour, 6);
  String m = binary(minute(), 6);
  String s = binary(second(), 6);
  
  // Draw each lin of our clock
  
  decode(100, h);
  decode(200, m);
  decode(300, s);
  
}




// Class for drawing each row of our clock
void decode(int y, String t) {
  
  for(int box = 0; box < 6; box++) {
    
    // if Char = 1 the make the box red. Else make it white
    if(t.charAt(box) == "1") {
     fill(255, 0, 0); 
     } else {
       fill(255);
      } 
    rect(box*100, y-100, 100, 100);
    
    
    fill(200);
    textSize(20);
    textAlign(RIGHT);
    // Draw key
    text(ma[box], box*100+90, y-10);
    textSize(40);
    textAlign(CENTER);
    // Draw binary char
    text(t.charAt(box), box*100+50, y-40);
    
    
  }
  
  // Convert and draw binary as int
  textSize(30);
  text(unbinary(t), 625, y-40);
}
  
  
  


