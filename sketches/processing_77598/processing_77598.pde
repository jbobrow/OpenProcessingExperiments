


int peter = 1;






color rot = color(255, 0, 0);


void setup() {
  size(1080, 720);
  background(0);

}

void draw() {
  if (key == '3' && mousePressed) {
    ellipse(mouseX, mouseY, peter, peter);
    fill(0, 50 + peter, 0);
    peter++;
    
    if (peter >= 50) {
      peter = 1;
      
    }
    
    frameRate(60);
    noStroke();
  }
  
  if (key == '2' && mousePressed) {
    fill(random(500),random(500),random(500));
    peter++;
    ellipse(mouseX + random(50), mouseY + random(50), peter, peter);
    noStroke();
    
    if(peter >= 30) {
      peter= 10;
    } else if (peter <= 1) {
      peter++;
    }
    
    
    
    
  } else if (key == '1' && mousePressed) {
    
    line(pmouseX + random(50) -random(50), pmouseY + random(50) - random(50), mouseX, mouseY);
    stroke(random(255), random(255), random(255));
  
  } else if (key == '4' && mousePressed) {
    line (pmouseX + random(50) - random(50), pmouseY + random(50) - random(50), mouseX, mouseY);
    ellipse(mouseX + random(50) -random(50), mouseY + random(50) - random(50), 5, 5);
    
    stroke(0, 255, 0);
    
  
    

    
    
  }
  if (key == 's') {
  saveFrame("bild.jpg");
  }
  
  
    
}





