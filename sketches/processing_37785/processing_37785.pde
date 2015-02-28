
float a = 0;
float b = 0;


void setup(){
  size(500,500);
  smooth();
}


void draw(){
  background(0,100,255);
  float x = map(sin(a), -1,1, 0, width);
  float y = map(sin(b), -1,1, 0, width);
  
   a = a + 0.01;
   b = b - 0.01;
   
  
      
      while(x < width) {
           fill(#0AFF00);
           ellipse(x,random(0,500),8,8);
           x = x+.1;

      }
      
       while(y > 0) {
          fill(#BAFF0D);
          ellipse(y,random(0,500),8,8);
          y = y -.1;
           
      }
    }

