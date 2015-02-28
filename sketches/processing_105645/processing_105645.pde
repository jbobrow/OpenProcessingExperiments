
//Connor Novak
//Pong
//2013/8/4


void setup(){
  size(500,500);  
  frameRate(60);
}

int lives = 3;
float dx = 2.1;
float dy = 3.5;

float x = 50;
float y = 50;

void draw(){
  
    background(0);
    
    fill(144);
    
    rect(20,mouseY - 50,25,100);
       
    fill(0,255,0);
    
    text(lives + "",240,100);
    
    
    x = x + dx;
    y = y + dy;
    
    if (x< 60 && x>35 && y < mouseY + 50 && y > mouseY - 50) {
      dx = -1 * dx;
      dx += 0.5;
      dy += 0.5;
    }
    
    if (x > 490){
       dx = -1 * dx;
    }
    if (x > 0){
        fill(0,0,255); 
        ellipse(x,y,25,25);
        }
    else {
        lives -= 1;
        x = 240;
        y = 240;
    }
    
    if (lives == -1) {
        
    }
    if ( y < 0 || y > 490){
       dy = -1 * dy;  
    }

}
