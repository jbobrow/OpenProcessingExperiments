
void setup () {
  size(500,500);
  frameRate (1);
  smooth();
  
}


void draw() {
  
  background(0, 0, 255);
  stroke(200);
  strokeWeight(5);

  stroke(10);
  fill(255,0,0,125);
  rect(200,200,100,100);
  noFill();
  
  
  stroke(10);
  fill(0,255,0,125);
  ellipse(200, 200, 50, 50);
  noFill();
  
  /*stroke(10);
  fill(0,0,255,125);
  quad(300,300, 450,450, 320, 320, 390,350);
  noFill();*/
  
  /*these are the eyes:*/
  point(210, 200);
  point(200, 210);
  
  /*these are the nostrils:
  point(180, 170);
  point(170, 180);
  
  line(80, 180, 250, 350);*/
  
  line(250, 250, 350, 350);
  line(350, 350, 400, 400);
  
  
  stroke(10);
  fill(0,255,0,125);
  arc(140,145,140,140,0, PI/2);
  noFill();
  
  stroke(10);
  fill(0,255,0,125);
  arc(140,145,100,100,0, PI/2);
  noFill();
  
  stroke(10);
  fill(0,255,0,125);
  arc(340,345,240,240,0, PI/2);
  noFill();
  
  stroke(10);
  fill(0,255,0,125);
  arc(340,345,200,200,0, PI/2);
  noFill();
  
  stroke(10);
  fill(0,255,0,125);
  arc(340,345,150,150,0, PI/2);
  noFill();
  
  stroke(10);
  fill(0,255,0,125);
  arc(340,345,100,100,0, PI/2);
  noFill();
  
  stroke(10);
  fill(0,255,0,125);
  arc(340,345,50,50,0, PI/2);
  noFill();
  
}


