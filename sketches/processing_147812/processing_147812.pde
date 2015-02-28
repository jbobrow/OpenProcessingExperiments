
void setup() {
  size(500, 500);
  frameRate(30);
  noStroke ();
   
  }
  

  
  void draw() {
    background(9, 159, 126);
    fill(255, 0, 0);
    ellipse(mouseX, mouseY, 100, 100);
    
     if(mousePressed == true){
    fill(0,100, 255);
    } else {
      fill(0,255, 0);
       };
      
      
    ellipse(map(mouseX, 0, 500, 220, 350), mouseY, 100, 100);
    }
    
   // println(frameRate);
    
    
    




