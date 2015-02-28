
//#4Draw an 8x8 grid. You must use loops.
void setup() {
size (380, 380);
smooth();
background(250, 255, 15);
}
 
 
void draw() {
   
 
fill(79, 178, 38);
 
for (int x=10; x<=400; x=x+45) {
 for (int y=10; y<=400; y=y+45)
  
  
 ellipse(x,y,5,5);
  
 }
 }


