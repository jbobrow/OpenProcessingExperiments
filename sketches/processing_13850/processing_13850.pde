
void setup() {
  size(400, 200);
  smooth();
}

 float a = 0.0;
 float i = 0.0;
 float y = 0.0;
 float z = 0.0;
 
 void draw(){ 
  background(255);
   fill(0);
   a = (a + 1)%200; 
  for (int x=0; x<=400 ; x+=20){
  ellipse(x,a,2,2);
 }
   i = (i + 1.5)%200; 
  for (int x=0; x<=400 ; x+=20){
  ellipse(x,i,2,2);
 }
 y = (y + 2)%200; 
  for (int x=0; x<=400 ; x+=20){
  ellipse(x,y,2,2);
 }
z = (z + 2.5)%200; 
  for (int x=0; x<=400 ; x+=20){
  ellipse(x,z,2,2);
 }


 }
 
 

