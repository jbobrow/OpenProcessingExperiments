
float x, y, r; 
  r=0;    
  colorMode(HSB);        
void setup() {
  size(500, 500);
}
 
void draw() {
  translate(250, 250);
  rotate(r);
  r+=.1;
  //background(0);
  float px = 0;
  float py = 0; 
  floar rr = 1;


  strokeWeight(20);
  for(float angle = 0; angle < 64*PI; angle += .3){
      rr += 2;
      x = cos(angle)*rr ;
      y = sin(angle)*rr ;
      stroke(angle*5,155,155,25);
      line(x, y, px, py); 
      px = x;
      py = y; 
     }  
  
  }
