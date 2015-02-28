
void setup(){
   smooth();
   size(500,500); 
   background(0);
  
}
void draw() {
   noStroke();
   fill(255);
   
   for(int i=15; i < width; i =i + 180){
 for(int j=15; j< height; j = j + 180) {
  
rect(i,j,50,100);
stroke(2,5);
ellipse(i + 54.5,j + 97,140,140);

 }
 }}
