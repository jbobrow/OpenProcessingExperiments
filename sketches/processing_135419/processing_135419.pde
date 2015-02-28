
float x = 10;
float y = 5;
 
void setup() {
  size (400, 400);
}
 
void draw () {
background (255);
  x=x*1.05;
  y=y*1.05;
float a = min(x, y); 
float b = max(x, y); 
 
  
line(0, y, width, y);
  
if (b> 400){
  y=5;
  x=10;
}
 
  println(a,b);
}



