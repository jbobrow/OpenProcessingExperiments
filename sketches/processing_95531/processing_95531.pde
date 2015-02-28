
void setup() {
  size(500, 500);
  background(#0691d3);
  smooth();
}

void draw() {
  stroke(0);
  strokeWeight(10);
  line(70, 100, 220, 150);
  line(270, 150, 420, 100);
  if (mousePressed== false) {
    //L Eye
    fill(255);
    ellipse(300/2, 400/2, 150, 60); 

    //R Eye
    fill(255);
    ellipse(700/2, 400/2, 150, 60); 

    //L Ball
    fill(255, 0, 0);
    ellipse((mouseX/10) + 125, (mouseY/40) + 195, 40, 40);

    //R Ball
    fill(255, 0, 0);
    ellipse((mouseX/10) + 325, (mouseY/40) + 195, 40, 40);
  } 
  else {
    noStroke();
    fill(255);
    ellipse(700/2, 400/2, 150, 60);
    fill(255, 0, 0);
    ellipse(700/2, 400/2, 50, 50);

    fill(255);
    ellipse(300/2, 400/2, 150, 60);
    fill(255, 0, 0);
    ellipse(300/2, 400/2, 50, 50);
  }
}




