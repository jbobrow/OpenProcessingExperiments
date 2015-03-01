
void setup() {
 size(600,600); 
 background(255);
}
 
void Pattern_1() {
 for(int i = 0; i < height; i += 10) {
  for(int k = 0; k < width; k += 10) {
   rect(i,k,i+10,k+10); 
  }
 } 
}
 
void Pattern_2() {
 for(int i = 0; i < height; i += 10) {
  for(int k = 0; k < width; k += 10) {
   fill(random(0,255));
   ellipse(random(i, i + 600), i + k, random(5, 15), random(5, 15)); 
  }
 } 
}
 
void draw() {
  Pattern_1();
  Pattern_2();
}
