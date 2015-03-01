
int x = 10;
int y = 10;

void setup(){
  background(255,253,173);
  size(640,520);
  println("setup done!");
  frameRate(60);
}

void draw(){
  rectMode(CENTER);
    stroke(68,216,206);
    fill(68,216,206);
  ellipse(320,240,300,200); //body
    stroke(255,255,255);
    fill(255,255,255);
  ellipse(320-32,220,63,100);
  ellipse(320+32,220,63,100); //outer eyes
    stroke(162,22,43);
    fill(162,22,43);
  ellipse(320,300,15,20); //mouth
    stroke(55,59,59);
    fill(55,59,59);
  ellipse(210,355,165,60); //feet
  ellipse(210+220,355,165,60); //feet
    stroke(174,240,235);
    fill(174,240,235);
  ellipse(145,250,50,50);
  ellipse(495,250,50,50); //hands
      stroke(16,15,16);
    fill(16,15,16);
  ellipse(320-32,240,25,25);
  ellipse(320+32,240,25,25); //inner eye
}
