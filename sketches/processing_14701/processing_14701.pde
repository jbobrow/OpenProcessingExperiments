
void setup() { 
  size(200, 200);
  background(255);
 }
 
void draw() {
 
for(int i= 0; i<=100; i=i+3){
strokeWeight(0.05);
a=100-i/2;
b=100+i%2;
// line(i,i,100,i);
line(a,i,b,i);
}
}                   
