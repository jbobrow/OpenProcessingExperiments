
//Create two large circles of different colors and add interaction

void setup() {
  size(1200, 960);
  background(#EFCBF0);
} 

void draw() {
  stroke(int(random(width)));
  
  ellipse(300, 240, 600, random(600));
  fill(int(random(width)), 100);
  
  ellipse(900, 240, random(600), 600);
  fill(int(random(width)), 100);
  
  ellipse(900, 720, 500, random(500));
  fill(int(random(width)), 100);
  
  ellipse(300, 720, 500, random(500));
  fill(int(random(width)), 100);
  
  ellipse(600, 480, random(500), 500);
  fill(int(random(width)), 100);
  
  ellipse(1200, 400, random(500), 500);
  fill(int(random(width)), 100);
  
  ellipse(200, 400, random(500), 500);
  fill(int(random(width)), 200);
  
  if (keyPressed) {
    saveFrame("images/artwork-###.png");
  }   
}

 
  

