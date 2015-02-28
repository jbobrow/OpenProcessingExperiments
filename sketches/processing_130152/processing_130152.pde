
float timer=0.0;
float shapeScale=1;
float speedScale=1.178;
void setup() {
  size(500, 500);
  frameRate(60);
}
void draw() {
  timer = timer + (1.0/30.0);
  println("timer "+timer+"shapeScale "+shapeScale);
  if (timer<=5) {
    shapeScale = shapeScale + speedScale;
    background(0);
    pushMatrix();
    translate(width/2, height/2);
    scale(shapeScale);
    ellipse(0, 0, 10, 10);
    popMatrix();

    if (shapeScale>=50.0 || shapeScale<=0) {
      speedScale= speedScale*-1;
    }
  }
  if (timer>5.0&&timer<10) {
    
    println("hi");
    rectMode(CENTER);
    background(0);
    pushMatrix();
    translate(width/2, height/2);
    rotate(2+timer);
    rect(0, 0, 200, 200);

    popMatrix();
  }
  else if(timer>10){
   timer=0;
   shapeScale = 1.0;
   
  }
}


