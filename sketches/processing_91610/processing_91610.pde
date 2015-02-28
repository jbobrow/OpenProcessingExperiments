

int angle = 0;

void setup(){
  size (900,500);
  background (0);
}

void draw(){
  if(mousePressed){
    if(mouseButton == RIGHT){
      line(pmouseX, pmouseY, mouseX, mouseY);
        stroke(23,211,34);
        strokeWeight(6);
        
    }else{
    noStroke();
    angle += 1;
    // Unterschiedlich grosse Blätter aus: http://www.processing.org/learning/topics/pulses.html
    float val = cos(radians(angle)) * 22.0;
    for (int a = 0; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(252,8,random(155)); //random Farbe Blätter 
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
    }
    fill(255, 226, 0); //Punkte
    ellipse(mouseX, mouseY, 9, 9);
    }
}
}


