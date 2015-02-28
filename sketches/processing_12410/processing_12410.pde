
//snake thing
int x,y;

void setup() {
  size(1000,1000);
  background(255);
  x=20;
  y=20;
}

    
void draw() {
  for(int i=0;i<3;i++) {
    smooth();
    noStroke();
  
  if(keyPressed) {
    if (key == 'x' || key == 'X') {
    fill(0,80,0,30);
    y = y + 3;
    x = x + 10;
    ellipse(x,y,20,20);
  }
  
  }
    if(keyPressed) {
    if(key=='y' || key=='Y') {
      fill(0,80,0,30);
    y = y + 10;
    x = x + 3;
    ellipse(x,y,20,20);
      
}
  }
  if(keyPressed) {
    if(key=='i' || key=='I') {
      fill(0,80,0,30);
    y = y - 10;
    ellipse(x,y,20,20);
    }
  }
  if(keyPressed) {
    if(key=='j' || key=='J') {
      fill(0,80,0,30);
    x = x - 10;
    ellipse(x,y,20,20);
    }
    }
    if(keyPressed) {
    if(key=='l' || key=='L') {
      fill(0,80,0,30);
    x = x + 10;
    ellipse(x,y,20,20);
    }
  }
  
  if(keyPressed) {
    if(key=='k' || key=='K') {
      fill(0,80,0,30);
    y = y + 10;
    ellipse(x,y,20,20);
    }
  }
  }
  }


