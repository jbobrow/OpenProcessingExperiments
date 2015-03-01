
int y = 0;
int b = 100;
boolean t;

void setup() {
  size(600, 600);
  background(255);
  frameRate(100);
}

void draw() {
  
  float b1 = map(b, 150, 0, 600, 0);
  
  //background(255);
  
   if (y > height || y < 0) t = !t;
  
  if(t == true) {
    
    if(y < width/2) {
      stroke(b1);
      b --;
    } else {
      stroke(b1);
      b ++;
    }
    strokeWeight(9);
  
    beginShape();
    vertex(0, height/2);
    bezierVertex(30, y,
                 570, y,
                 width, height/2);
    endShape();
    y += 1;
    
  } else if (t == false) {
  
    strokeWeight(9);
    if(y > width/2) {
      stroke(b1);
      b --;
    } else {
      stroke(b1);
      b ++;
    }
    
    beginShape();
    vertex(0, height/2);
    bezierVertex(30, y,
                 570, y,
                 width, height/2);
    endShape();
    y-=1;
  }
  
}

