
void setup () {
 size(800, 900);
 background(#7c7878);
}

void draw () {
  if (keyPressed == true) {
    background(#7c7878);
  } else {
      if (mouseButton == LEFT) {
        noStroke();
        frameRate(200);
        fill(random(200, 255), random(50, 102), 0);
        rect(mouseX, mouseY, 50, 50);
       
      } else if (mouseButton == RIGHT) {
        noStroke();
        frameRate(200);
        fill(0, random(10, 51), random(50, 102));
        rect(mouseX, mouseY, 50, 50);
        
      } else if (mouseButton == CENTER) {
        stroke(0, random(0,50));
        fill(0, random(10, 51), random(50, 102));     
        rect(mouseX, mouseY, random(10, 15), random(10, 15));
        fill(70, 70, 70, 30);
        rect(mouseX + random(-100,100), mouseY + random(-100, 100), random(10, 70), random(10, 70));
        
      } else {
        stroke(0, random(0, 50));
        frameRate(15);
        fill(70, 70, 70, 30);
        rect(mouseX + random(-100,100), mouseY + random(-100, 100), random(10, 70), random(10, 70));
        fill(random(200, 255), random(50, 102), 0);
        rect(mouseX, mouseY, random(10, 15), random(10, 15));
      }
  }
}



