
int i=15;
void setup(){
background(255+i*150,0,0);
size (1000,1000);
smooth();
}
void draw(){
for (int a = 0; a <= width; a += 100) {
 for (int b = 100; b <= height ; b += 100) {
   //noStroke();
  fill(178+i/200,255,0);
   triangle (a , b,  (a + 50), ( b-100),  (a +100) , b);  
 }
}
fill(40+i*-100,120,160);
for (int c = 50; c <= width; c += 100) {
 for (int d = 0; d <= height ; d += 100) {
   triangle (c , d,  (c + 50), ( d-100),  (c +100) , d);  
 }
}
}
                
