
float value = 0;
int time = 2;
int prex = 0;
int prey = 0;

void setup() {
background(255);
size(500, 500);
smooth();
}
void draw() {

  if(keyPressed == true) {
     if(key == ' ') {
      setup();
     } 
    }  
  
  fill(mouseX, mouseY, value);
  
  noStroke();
  
  if(mousePressed == true){
    
    time = time + 1;
    
     if(time >= 150) {
      time = time - 1;
    }
    
    if((time % 2) > 0) {
      prex = mouseX;
      prey = mouseY;
    }
    
    ellipse(mouseX, mouseY, time, time);
    stroke(0);
    strokeWeight(4);
    line((prex + random(255)), (prey + random(255)), (mouseX + random(255)), (mouseY + random(255)));
    stroke(0);
    strokeWeight(4);
    line((prex - random(255)), (prey - random(255)), (mouseX - random(255)), (mouseY - random(255)));
  } else {
      time = 0;
    }
}

void mouseMoved() {
  value = random(255);
}


                
                
