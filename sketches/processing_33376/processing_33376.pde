
int y=0;

void setup() {
  
  size(500,500);
}

void draw() {
  
  background(255);
  for (int i=0; i<height; i++) {
    
    stroke(i,100,200);
    line(0,i,500,i);
  }
  for(int x=0;x<width+10;x+=10) {
    for(int y=0;y<height+10;y+=10) {
      noFill();
      stroke(50,50,100);
      ellipse(x,y,10,10);
    }
  }
  
 noStroke();
 fill(0);
 ellipse(width/2,y,20,20);
 y+=1;
}

