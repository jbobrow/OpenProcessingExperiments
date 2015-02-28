


  void setup() {   

  size(640, 640);   
  background(255,122,15);   
  smooth();   
  loop();   
  frameRate(5);
  noStroke();
}   

float a = 40;   
float b = 12;   
float c = 67;   
float d = 11;    

void draw() {   

 
 fill(random(335),random(55) , random(150), random(60));   

  rect(a, b*2, c-3, d);   

  rect(a+10, b, c, d);   

   
  a = a + random(2,120);   

  b = b + random(1,254);   

  c += 1;   

  d -= 0.75;   

   
    if (a > width) {   
    a = 12;   
    c = random(width);   
  }   

   if (b > height) {   
    b = 5;   
    d = random(width);   
  }    

  } if (c > width) {   
    c = 66;   
    b = random(height);   
  } } 


