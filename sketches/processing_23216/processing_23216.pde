
void setup () {
  size(300,300);
  background(255);
}

void draw() {
  
smooth();
background(255);
  //draw head
  ellipse(75,50,50,50);
  //draw body
  ellipse(75,100,50,50);
  ellipse(75,150,50,50);
  rectMode(CENTER);
  //draw eyes
  fill(mouseX,mouseY,100);
  ellipse(65,50,10,20);
  ellipse(85,50,10,20);
  //draw stinger
  line(75,25,75,10);
  
  
}


