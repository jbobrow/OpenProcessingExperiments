
float a = 0;
float b = 0;
float co = 0;

void setup() {
  background(0);
  colorMode(HSB,125);
  size(400,400);
  smooth();
  strokeWeight(5);
  


  
}

void draw () {
  stroke(co, 80, 80, 20);
  
  
  
  float x0 = map(sin(a), -1,1,20,width - 20);
  float y0 = map(cos(a), -1,1,20,height  -20);
  
  float x1 = map(sin(b), -1,1,20,width -20);
  float y1 = map(cos(b), -1,1,20,height -20);
  
  
 line(x0, y0, x1, y1);
 
 if(mousePressed)  {
 ellipse (200, 200, mouseY,mouseY);
     ellipse (200, 200, mouseX,mouseX);
     
  fill(0,30);
  stroke(255);
  noCursor ();
 }

   a = a + 0.02;
   b = b + 0.10;
   
   co = co + 1;
   if (co >100) {
     co = 0;
   }
 }
