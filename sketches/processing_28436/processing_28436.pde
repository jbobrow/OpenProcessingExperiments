
int abstand = 20;

void setup(){
  size(600, 600);
  smooth();
}
 
void draw(){
   
  for(int y = 0; y <= height; y = y + 100 ){
    for(int x = 0; x <= width; x = x + 100){
      
      
      
      rectMode(CENTER);
      ellipseMode(CENTER);
      noStroke();
      fill(0);
      ellipse(x, y, 100, 100);
      fill(180);
      rect(x, y, 90, 90);
      fill(0);
      ellipse(x, y, 80, 80);
      fill(255);
      rect(x, y, 70, 70);
      fill(0);
      ellipse(x, y, 60, 60);
      fill(180);
      rect(x, y, 50, 50);
      fill(0);
      ellipse(x, y, 40, 40);
      fill(255);
      rect(x, y, 30, 30);
      fill(0);
      ellipse(x, y, 20, 20);
      fill(180);
      rect(x, y, 10, 10);
      
    }
  }
}
            
                
