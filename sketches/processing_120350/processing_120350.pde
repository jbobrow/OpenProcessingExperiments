
void setup() {
  size(500,500);
}

void draw(){
  background (0);
   translate (width/2,height/2);
  fill(186,188,188);

for (int i=0; i<360; i+=30) { 
pushMatrix();
rotate(radians(i)); 
translate(0, 220); 
fill (#05FAF4);
ellipse (0, 0, 25, 25);
popMatrix();
}

for (int i=0; i<360; i+=6) { 
pushMatrix();
rotate(radians(i)); 
translate(0, 170); 
fill (#05FAF4);
rect (0, 0, 25, 25);
popMatrix();
}

for (int i=0; i<360; i+=30) { 
pushMatrix();
rotate(radians(i)); 
translate(0, 80); 
fill (#05FAF4);
ellipse (0, 0, 20, 50);
popMatrix();
}
 pushMatrix();
float sec = map(second(),0,60,0,360);
    rotate(radians(sec));
   translate ( 0, -220);
   fill (255);
   stroke (255);
   ellipse  (0,0, 20,20);
 popMatrix();

 
 float min = map(minute(),0,60,0,360);
 pushMatrix();
   rotate(radians(min));
   translate ( 0, -160);
   fill (225);
   stroke (0);
   rect (0,0, 20,50);
 popMatrix();



float h= map(hour(),0,12,0,360);
 pushMatrix();
   rotate(radians(h));
   translate ( 0, -30);
   fill (225);
   stroke (0);
   ellipse (0,0, 10,50);
 popMatrix();


}
