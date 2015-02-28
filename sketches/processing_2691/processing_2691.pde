
int w = 400; 
int h = w; 
int d = w/3; 
int md = 12; 
int sd = 6; 
int hh,mm;  
boolean randtime, showtime; 
PFont font; 
int fsize = 32; 

void setup() {  
  size(w, h);  
  stroke(255,127);  
  smooth();  
}  

void draw() {  
  background(0); 
  // Input controls  
  if(keyPressed) {  
    if (key == 'c') {  
      delay(200);  
      stroke(random(255), random(255), random(255), 63);  
    }  
    if (key == 'z') {  
      delay(200);  
      randtime = !randtime;  
      hh = int(random(24));  
      mm = int(random(60));  
    }  
    if (key == 'd') {  
      delay(200);  
      showtime = !showtime;  
    } 
  }  
  if (!randtime) { 
    hh = hour();  
    mm = minute();  
  }  
  if (showtime) { 
    font = createFont("FFScala", fsize);  
    textFont(font);  
    String txt = hh + ":" + mm;
    text(txt ,0,fsize); 

  } 
  strokeWeight(d); 
  point(w/2-d+(hh*d/12),h/2); 
  point(w/2,h/2); 
  strokeWeight(md); 
  float j = map(mm, 0, 60, 0, TWO_PI) - HALF_PI;  
  point(w/2 + cos(j) * (d/2-md/2), h/2 + sin(j) * (d/2-md/2));  
  strokeWeight(sd); 
  j = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;  
  point(w/2 + cos(j) * (d/2-sd/2), h/2 + sin(j) * (d/2-sd/2));  
} 




