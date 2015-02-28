
int tp = 25;

void setup() {
  size(800,800);
   
  }
  void draw() {
    noStroke();
    fill(255);
    if(keyPressed) 
    if (key == 'r' || key == 'r') 
      fill(255,0,0);
    if (key == 'a' || key == 'a') 
      fill(0,53,255);
    if (key == ' ' || key == ' ') 
      background(175,175,175);  
    if(mousePressed) {
    ellipse(mouseX, mouseY, tp, tp);
    
    if(key == '+' || key == '+'){
    tp = tp+1;
    } else {
    tp = 25;
 }
    }
  }

