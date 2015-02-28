
void setup() {
  size(800,400);
  background(0);
  strokeWeight(2.5);
}
  
void draw() {
  balloon(50,50);
  if(mousePressed) {
  balloon(150,50);
  balloon(250,50);
  }
}

void balloon(int x, int y) {
  pushMatrix();
  translate(x,y);
  fill(0,150,0);
 stroke(100);
 smooth();
 ellipse(250,100,60,80);//head
 fill(0);
 line(240,115,250,125);//left mouth
 line(250,125,260,115);//right mouth
 line(250,140,250,300);//string
 fill(0,130,0);
 triangle(250,140,238,150,262,150);//tie
 fill(255);
 
 fill(0);
 ellipse(240,100,10,10);//left eye
 ellipse(260,100,10,10);//right eye
 popMatrix();
}


