
float angle;
float shake;

void setup() {
  size(250, 250);
  smooth();
  fill(0);
  frameRate(30);
  rectMode(CENTER);
  strokeWeight(3);
}

void draw() {
  background(0);
  // translated to the center of the page.
    translate(125,125);
  // the squares will rotate, and shake for every 2 seconds.
  if (second()%2 ==0) {  
    shake=random(-0.2,0.2);
  }
  angle = angle+shake;
  float a=cos(angle);
  rotate(a);
  // squares with different colour strokes
  stroke(255,93,165);
  rect(0,0,320,320);
  stroke(255,113,165);
  rect(0,0,280,280);
  stroke(255,133,165);
  rect(0,0,240,240);
  stroke(255,163,165);
  rect(0,0,200,200);
  stroke(255,183,165);
  rect(0,0,160,160);
  stroke(255,203,165);
  rect(0,0,120,120);
  stroke(255,223,165);
  rect(0,0,80,80);
  stroke(255,243,165);
  rect(0,0,40,40);

}


                
                                                                
