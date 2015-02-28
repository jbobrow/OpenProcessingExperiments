
void setup() {
  size(120, 200);
  background (255, 255, 255);
  smooth();
  //full loop
}

void draw() { 
  //delay of refresh, just every sec
  //loop draw a brick for every second stack on top of it, would be smoother
  delay(1000);
  
  int s = second(); 
  int m = minute(); 
  int h = hour(); 
  
    if (s==0) {
    background (255, 255, 255);
}
  
    fill (173, 255, 0);
  stroke (255, 255, 255);
    if  (m <= 10)  {
    rect(0, (200-m*20), 10, 10);
  } else if (m >= 11 && m<=20) {
    rect(20, (400-m*20), 10, 10);
  } else if (m >= 21 && m<=30) { 
   rect(40, (600-m*20), 10, 10);
 } else if (m >= 31 && m<=40) {
    rect(60, (800-m*20), 10, 10);
 }  else if (m >= 41 && m<=50) {
    rect(80, (1000-m*20), 10, 10);
  } else if (m >= 51) {
    rect(100, (1200-m*20), 10, 10);
  }
  
  fill(111,113,255);
  stroke (255, 255, 255);
 println("s = "+ s); 
  if  (s <= 10)  {
    rect(0, (200-s*20), 20, 20);
  } else if (s >= 11 && s<=20) {
   // println("above 11");
    rect(20, (400-s*20), 20, 20);
  } else if (s >= 21 && s<=30) { 
   rect(40, (600-s*20), 20, 20);
 } else if (s >= 31 && s<=40) {
    rect(60, (800-s*20), 20, 20);
 }  else if (s >= 41 && s<=50) {
    rect(80, (1000-s*20), 20, 20);
  } else if (s >= 51) {
    rect(100, (1200-s*20), 20, 20);
  }
  

  fill (108, 170, 124);
  stroke (255, 255, 255);
    if  (h <= 10)  {
    rect(0, (200-h*20), 20, 20);
  } else if (h >= 11 && h<=20) {
    rect(20, (400-h*20), 15, 15);
  } else if (h >= 21 && h<=30) { 
   rect(40, (600-h*20), 15, 15);
 } else if (h >= 31 && h<=40) {
    rect(60, (800-h*20), 15, 15);
 }  else if (h >= 41 && h<=50) {
    rect(80, (1000-h*20), 15, 15);
  } else if (h >= 51) {
    rect(100, (1200-h*20), 15, 15);
  }
  
}


