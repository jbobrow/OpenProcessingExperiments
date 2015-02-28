
void setup() {
 size (800, 800);
 smooth();  
}

void draw(){
  
  background (241,241,241);
  
  stroke (112, 137, 155);  
  strokeWeight (1);
  noFill();

//big ellipse
ellipse (308, 400, 517, 517);
ellipse (492, 400, 517, 517);

//medium ellipse
ellipse (400, 310, 259, 259);
ellipse (400, 490, 259, 259);

//small ellipse
ellipse (335, 400, 131, 131);
ellipse (465, 400, 131, 131);

//center ellipse
ellipse (400, 400, 185, 185);

rect (334, 334, 131, 131);

line (171, 180, 400, 180);
line (400, 619, 628, 619);

}


void keyPressed() {

  saveFrame ("test_#####.png");
  println (frameCount);
  
}
