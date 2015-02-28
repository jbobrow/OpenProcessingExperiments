
int x = 0;
 
void setup() {
  size(500, 500);
  smooth();
}
 
void draw() {
  for (int y = 0; y <= width; y = y + 20) {
    for (int x = 0; x <= height; x = x + 20) {
      if ((dist(x, y, mouseX, mouseY)) < 40) {
        if(mouseX>=0 && mouseX<=500){
    stroke(5);    
    fill(30,20,150,20);
  }
    ellipse(x, y, 20+random(0,10), 20+random(0,10));
      }
      else {
        fill(0,50);
        
        
      }
 
      noStroke();
      ellipse(x, y,10,10);
      if(mousePressed){
        fill(200);
        rect(0,0,500,500);
      }
       
    }
  }
}


