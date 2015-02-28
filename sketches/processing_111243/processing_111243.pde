
void setup(){
  
  size(400, 200);
  background (255);
  stroke(255);
  fill(255);
  frameRate(4);
   

}
 
void draw(){
   for(int x = 0; x < 600; x += 100){
    for(int y = 0; y < 400; y += 100){
      int r = (int)random(256);
      int g = (int)random(200);
      int b = (int)random(100);
      fill(r,g,b);
      rect(x, y,100, 100);
      
      fill(255,0,0);
      ellipse(mouseX, mouseY, 100, 100);
}
   }
}
