
void setup() {
  size(500, 500);
  background(0);
}

int count = 1;
int numoflines =150;

//*Draws every tenth line
void draw() {
  if (count%10==0) {
    stroke(count, 10, 100);
    line(count, 0, count, height);
  }
    
    if (numoflines >0){
    stroke(count, 10, 100);
    noFill();
    rect(0, random(500), height, width);
    }
    
    noFill();
    stroke(200, 0, count);
    ellipse(width/2, random(500), 20, count);
    ellipse(width/3, random(500), 20, count);
    ellipse(width/2-200, random(500), 20, count);
    ellipse(width/2+200, random(500), 20, count);
    ellipse(width*2/3, random(500), 20, count);
    stroke(200,0,0);
    ellipse(random(100,400),height/2,10,10);
    ellipse(random(100,400),height-200,10,10);
    ellipse(random(100,400),height-300,10,10);
    
    if(count%20==0){
    ellipse(width/2, height/2, count, count);
    }
  count++;
  numoflines--;
}


