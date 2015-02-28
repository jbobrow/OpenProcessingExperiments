
int x = 50;
int y = 10;
int k = 20;
int r = 5;


void setup() {
  size(1000,1000);
  background(0);
}

void draw() {
  
  x=x+50;
  y=y+10;
  k=k=20;
  r=r+1;
  
  if(x>400){
    x=0;
  }
  
  if(r>75){
    r=35;
  }
  
  fill(random(255),random(255),random(255),60);
  if(mousePressed){
    ellipse(mouseX,mouseY,r,r);
  }
}
  
void mousePressed() {
  ellipse(mouseX,mouseY,50,50);
  strokeWeight(random(1));
  stroke(random(255),random(255),random(255),100);
}

void keyPressed() {
  strokeWeight(1);
  line(0,0,random(255), random(255));
  stroke(random(20,200));
}



                
                
