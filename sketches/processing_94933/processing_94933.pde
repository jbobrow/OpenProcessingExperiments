
int rig = -40;
int lef = +40;

void setup(){
  size (500, 500); //define size of canvas
  background (255);
  strokeWeight (4);
}
 
void draw (){
  rig = rig + 1;
  rig = min(0, rig);
  lef = lef - 1;
  lef = max(0, lef);
  fill (172, 237, 236);
  rect (0, 0, 500, 400);
  fill (15, 75, 2);
  rect (0, 300, 500, 400);
  fill (15, 75, 2);
  triangle (390, 250, 440, 10, 490, 250); //tree
  fill (118, 81, 25);
  rect (430, 250, 20, 50); //wood
  fill (239, 240, 116);
  ellipse (10, 10, 150, 150);
  fill (180, 159, 53);
  ellipse (180, 180, 70, 70);
  ellipse (320, 180, 70, 70);
  ellipse (250, 450, 300, 400);
  ellipse (250, 250, 200, 200);
  fill (10);
  ellipse (250+rig, 230, 40, 50);
  ellipse (250+lef , 230, 40, 50);
  noFill();
  arc(250, 290, 40, 40, PI/2, PI); //Smile
  arc(250, 290, 40, 40, 0, PI/2);
  arc(160, 440, 40, 40, PI/2, PI); //left claw
  arc(160, 440, 40, 40, 0, PI/2); 
  line (140, 440, 140, 410);
  line (180, 440, 180, 410);
  arc(330, 440, 40, 40, PI/2, PI); //right claw
  arc(330, 440, 40, 40, 0, PI/2);
  line (310, 440, 310, 410);
  line (350, 440, 350, 410);
}

