
  

void setup() {
  size(500, 500);
}
float angle;
void draw() {
  //rect(0,0,width,height);
  //fill(200,10);
   translate(250,250);
   angle+=0.1;
   stroke(0,20);
   angle=angle%TWO_PI;
   float x = (cos(angle)*0) -(sin(angle)*100);
   float y = (sin(angle)*0) +(cos(angle)*100);
   float x2 = (cos(-angle)*0) -(sin(-angle)*100);
   float y2 = (sin(-angle)*0) +(cos(-angle)*100);
   x2*=2;
   y2*=2;
   line(x2,y2,x,y);
//  ellipse(x,y,10,10);
//  ellipse(x2,y2,10,10);
} 


