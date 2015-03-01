
void setup () {
size (600, 600);
colorMode(HSB);
}
void draw () {
for (int i =500; i>0; i=i-2) {
  
  stroke ((i/7)+(mouseX/3), 150, 250);
  ellipse (300,300,i,i); 
}
} 

