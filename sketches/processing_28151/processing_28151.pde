
void setup() {
  size(640, 480);
  
  smooth();
  frameRate(4);
  noStroke();
}
  
void draw() {
  
  background(255);
    
  
  // Get values from the system clock
  int h = hour();
  int m = minute();
  int s = second();
    
  
  // Set 12 hour clock
  if (h > 12) {
      
     h = h - 12;
  }
    
  
  // Set int for total seconds and total minutes
  int dot_amount = s + m*60 + h*3600;
  int total_minutes = dot_amount/60;
  
  
  // Set color change when even
  //   if (total_minutes%2 == 0){
  //     fill(#ff3b00);
  //   }else{
  //     fill(#0000ff);
  //   }
  
  
  // Set integers for rect location
    int x = -2;
    int y = 1;
  
    
  // Set count and boolean
    int count = 0;
    boolean color_1 = true;
  
  // Set dot location
  for (int i = 0; i < dot_amount; i++) {
      x = x + 2;
  
      if (x > width) {
        y = y + 2;
        x = -2;
      }
      
      // set fill color to alternate
      if (color_1 == true) {
        fill(220);
      }
      else {
        fill(0,0,255);
      }
  
      // draw dots
      rect(x,y, 1, 1);
        
      // update count with each box drawn
      count++;
      
      // Reset count after 60 and flip
      if (count >= 60) {
  //      if (color_1 == true) {
  //        color_1 = false;
  //      } else {
  //        color_1 = true;
  //      }
        color_1 = !color_1;
        count = 0;
      }
        
  } // end main rect draw \\
  
  
  color_1 = true;
  int hour_amount = h*3600;
  
  
  // Set integers for rect location
    x = -2;
    y = 1;
  
/////////////
  
  int hour_count = 0;
  
  for (int i = 0; i < hour_amount; i++) {
  
      x = x + 2;
  
      if (x > width) {
        y = y + 2;
        x = -2;
      }
  
      
    // set fill color to alternate
      if (color_1 == true) {
        fill(220);
      }
      else {
        fill(0,0,255);
      }
        
   // draw dots
//    fill(#ff0000);
  
      rect(x,y, 1, screen.height*.006);
        
      // update count with each box drawn
      hour_count++;
  
      
      // Reset count after 60 and flip
      if (hour_count >= 3600) {
        color_1 = !color_1;
        hour_count = 0;
  
      }
      
      
      
  }
    
  
  ////////
    
    
      // HOURS CHANGE COLOR (BEFORE LOAD)
      // for every H, fill(#4981ff) /  alternate;
  
  
      // HOURS CHANGE COLOR (AFTER LOAD)
      // set start_minute = m
      // set hour_counter = 60 - m
      // if(hour_counter = 60){ fill(#4981ff); / alternate }
      // set hour_counter = 0  
  
  
  
  
   
} // end voidDraw \\
                
