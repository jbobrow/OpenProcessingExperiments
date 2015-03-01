
float rad, r, x1, y1, x2, y2;
float n=0;
boolean lig=true;
 
void setup() {
  size(500, 500);
  background(0);
  r=height/4;
  x1=0;
  y1=0;
  x2=0;
  y2=0;
  n=random(6);
}
 
void draw() {
  if (rad<10*PI-PI/2)
  {
    rad+=0.01+noise(n+rad/10)/60;
 
    stroke((noise(n+rad/10)*80), 60, 500+random(5), 20);   
 if (lig) {
      r=r+(noise(n+rad/10)*5)-2;
    }
   
    x1= width/2 + (r*cos(rad));
    y1= height/2 + (r*sin(rad));
    x2= width/2 + (r*cos(rad+PI));
    y2= height/2 + (r*sin(rad+PI));
    line(x1, y1, x2, y2);
   
  }
}
