


void setup() {
  size(400,400);
  noCursor();
}

void draw () {
//  translate(50,-50);
  
  background(0,30,40);
  stroke(20,130,220,90);
  strokeWeight(5);
  fill(5,250,200,70);
  rect(150,150,100,100);
  fill(155,220,250,120);
  rect(175,50,50,300);
  PImage q = get(150,150,100,100);
  for (int i = 0; i < 60; i++) {
    PImage x = get(100,150,160,190);
    set(i,20,x);
    set(i,i,x);
    set(300,0,x);
    set(i+120,i*3,x);
    set(i*3,i+120,x);
    set(i+220,i*4,x);
    set(i*4,i+220,x);
    set(i+120,i*5,x);
    set(i*5,i+290,x);
    set(i+420,i*4,x);
    set(i*4,i+390,x);
    set(i*2,i+350,q);
    set(300,100,q);
    set(200,180,q);
    set(mouseX,mouseY,x);
  }
  set(0,300,q);

}


