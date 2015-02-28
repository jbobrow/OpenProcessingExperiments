
int abstand = 20;
float x,y,zufallX,zufallY;

 
void setup(){
  smooth();
  size(600, 600);
  
  
  noStroke();
  frameRate(10);
}
 
void draw(){
  background(255);
  
  
  
fill(0);

  for(int y = 0; y <= height; y = y + abstand){
      
    
 
    for(int x = 0; x <= width; x = x + abstand){
      
      zufallX=random(x-(mouseX/200),x+(mouseX/200));
      zufallY=random(y-(mouseY/200),y+(mouseY/200));
      
   
      ellipse(zufallX, zufallY, 10, 10);
    }
  }
}

