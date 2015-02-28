
void setup() {
  size(500, 500);
  background(100, 100, 120);
  smooth();
}
 
void draw() {
  stroke(0);
  strokeWeight(10);
  if (mousePressed== false) {
      background(100, 100, 120);
    //L Eye
    fill(255);
    ellipse(300/2, 400/2, 150, 150);
 
    //R Eye
    fill(255);
    ellipse(700/2, 400/2, 150, 150);
 
    //L Ball
    fill(97, 150, 0);
    ellipse((mouseX/10) + 125, (mouseY/40) + 195, 40, 40);
 
    //R Ball
    fill(97, 150, 0);
    ellipse((mouseX/10) + 325, (mouseY/40) + 195, 40, 40);
  }
  else {
    noStroke();
    fill(255);
    ellipse(700/2, 400/2, 150, 150);
    fill(random(0, 255));
    ellipse((mouseX/10) + 325, (mouseY/40) + 195, 50, 50);
 
    fill(255);
    ellipse(300/2, 400/2, 150, 150);
    fill(random(0, 255));
    ellipse((mouseX/10) + 125, (mouseY/40) + 195, 50, 50);
    
    stroke(0);
    strokeWeight(10);
    fill(100, 100, 120);
    ellipse(250, 350, 150, 150);
    noStroke();
    fill(100, 100, 120);
    rect(100, 350, 500, 150);
  }
}



