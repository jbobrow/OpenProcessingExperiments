

void setup() {
  size(600, 600);
  stroke(255);
  smooth();
}
void draw() {
  background(0);
  fill(80);
  noStroke();


  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0,60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  stroke(255);

 // line(100, 100, cos(s) * 72 + 100, sin(s) * 72 + 100);

//  line(width/2, width/2, cos(m) * 200 + width/2, sin(m) * 200 + width/2);

 // line(width/2, width/2, cos(h) * 50 + width/2, sin(h) * 50 + width/2);
  
//  line( cos(m) * 200 + width/2, sin(m) * 200 + width/2, cos(h) * 50 + width/2, sin(h) * 50 + width/2 );
  
  float x1 = cos(h) * 70 + width/2 ;
  
  float y1 = sin(h) * 70 + width/2 ;
  
  float x2 = cos(m) * 200 + width/2 ;
  
  float y2 = sin(m) * 200 + width/2 ;
    noStroke();
  fill(128);
  quad(x1,y1,
 
        width/2, width/2,
      
        (cos(m) * 200 /60 *second()  + width/2)   ,      (sin(m) * 200 / 60*second() +width/2) , 
        
         (x1 + (x2-x1)/60*second()  ), (  y1 + (y2-y1) /60*second()    )         );
  
}




