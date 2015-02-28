
void setup() {
  size(200, 200);
  background(255);
 }
  
void draw() {
  strokeWeight(2);
for(int i=0; i<=200; i=i+3){

line(i,200-i*2,100,200-i*2);
line(100,200-i*2,200-i,200-i*2);

}
}          
                
