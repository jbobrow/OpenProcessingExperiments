
void setup(){
  size(600,600);
  smooth();
  background(0);

}
void draw(){
stroke(10);
  
colorMode(RGB, 600);
for (int i = 0; i < 600; i++) {
  for (int j = 0; j < 600; j++) {
   stroke(i, j, 0);
   point(i, j);
    ellipse(i *100,j*100,100,100);
  }

}
  
   fill(random(0,255),random(0,255),random(0,255));
  for(int yPos=0;yPos<600; yPos+=50) {
 for(int xPos=0;xPos<600; xPos+=50){
   
  
 }
}
  delay(100);
 }
