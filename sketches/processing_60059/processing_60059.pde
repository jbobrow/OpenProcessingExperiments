
void setup() {
size(200,600);
background(255);
noCursor();
frameRate(10);
}

void draw() {
  
  fill(255,120);
  rect(0,0,width,height);
  fill(80);
  rect(0,mouseY,200,600-mouseY);
  
  if(mousePressed) {
    
    fill(80);
    rect(0,10,width,height-10);
  }
  
  line(0,100,200,100);
  line(0,200,200,200);
  line(0,300,200,300);
  line(0,400,200,400);
  line(0,500,200,500);
}

