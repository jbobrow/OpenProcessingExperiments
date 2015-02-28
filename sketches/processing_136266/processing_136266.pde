
int x;
int y;
int valor=100;

void setup() {
    size(500,500);
    background(50);
    x=0;
    y=0;
    frameRate(10);
}

void draw(){
  para();
  
}
void para() {
  for(x=-valor; x<100 ; x++) {
    y=(x*x)/20;
  //fill(random(20),random(75,40),random(x+y),5);
  noFill();
  stroke(random(250),random(20,145),random(20,45));
  strokeWeight(random(0,2));
  ellipse(x+250,y+55,random(50,62),random(20,30));
  }
  }
void keyPressed(){
background(50);
}
