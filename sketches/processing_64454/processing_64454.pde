
void setup() {
  

size(500,500);
background(0);
noStroke();

}


void draw() {
  
  fill(0,10);
  rect(0,0,width,height);
}
 void keyPressed() {
  print(key);
  
   smooth();
  fill(255,0,0);
  textSize(random(50,135));
  text(key,random(500), random(500));
  
 }
  
  


