
void setup() {
  size(640,480);
  background(0);
}


int x=0;
int y=480;

void draw() {
  
  stroke(255);
  strokeWeight(22);
  line(0,0,640,480);
  stroke(240);
  strokeWeight(22);
  line(0,25,640,455);
  stroke(225);
  strokeWeight(22);
  line(0,50,640,430);
  stroke(210);
  strokeWeight(22);
  line(0,75,640,405);
  stroke(195);
  strokeWeight(22);
  line(0,100,640,380);
  stroke(180);
  strokeWeight(22);
  line(0,125,640,355);
  stroke(165);
  strokeWeight(22);
  line(0,150,640,330);
  
  fill(255);
  noStroke();
  ellipse(320,240,300,300);
}



