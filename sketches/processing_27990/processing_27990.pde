
void setup() {

  size(500, 500, P2D);
  smooth();
  
  background(0);

  // frameRate(30);
   
}

int i = 0;

void draw() {
 
  if(mousePressed) {
  
    noStroke();
    fill(0, 15);
    ellipse(250, 250, random(450) , random(450));
  
  } else {
  
    if(i == 10) {
      
      fill (0, 10);
      noStroke();
      rect(0, 0, 500, 500);
      i = 0;
      
    } else { i = i + 1; }
    
    noFill();
    stroke(255, 50);
    ellipse(250, 250, random(400) , random(400));
  
  }
  
}

