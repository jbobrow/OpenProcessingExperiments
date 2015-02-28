
void setup(){
   
  background(0);
  size(500,500);
  frameRate(10);
   
}
 
void draw(){
 
   
float x = mouseX; // mouse x position determines x position
float y = mouseY; // mouse y position determines y position
float r = random(0,255); //random r value
float g = random(0,255); //random g value
float b = random(0,255); //random b value
   
 
text("You'll go to hell for what your dirty mind is thinking.", x, y);
fill(r,g,b);
 
}
 
void mouseClicked(){
  saveFrame("poem.png"); //saves frame as png
}
  
                
