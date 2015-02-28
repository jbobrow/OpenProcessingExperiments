
int theHeight = 1000;

void setup(){
size(800, 1000); 
background(187,197,201);
smooth();
}

void draw(){
  noFill();
  stroke(255);
  
  //outline of cup
  stroke(255);
  ellipse (380, 280, 308, 88);
  line (226, theHeight - 720, 296, theHeight - 311);
  line (535, theHeight - 717, 486, theHeight - 312);
  ellipse (389, theHeight - 315, 191, 60);
  
  
  //top of straw
  line (498, theHeight - 842, 458, theHeight - 683);
  line (530, theHeight - 838, 486, theHeight - 690);
  ellipse (515, theHeight - 840, 31, 17);
  
  
  //middle straw
  line (497, theHeight - 687, 480, theHeight - 618); 
  line (457, theHeight - 682, 458, theHeight - 674);
  line (458, theHeight - 673, 445, theHeight - 607);
  
  //end of straw
  line (445, theHeight - 607, 332, theHeight - 333);
  line (477, theHeight - 615, 380, theHeight - 333);
  ellipse (356, theHeight - 333, 48, 8);
  
  //lemon
  pushStyle();
  fill(252, 204, 5);
  arc (347, theHeight - 620, 168, 51, .1 , PI + HALF_PI + .2);
  arc (347, theHeight - 632, 168, 51, .1 , PI + HALF_PI + .2);
  line(431, theHeight - 630, 431, theHeight - 625);
  line(363, theHeight - 658, 363, theHeight - 653);
  noStroke();
  triangle(431, theHeight - 630, 431, theHeight - 615, 420, theHeight - 615);
  triangle(363, theHeight - 658, 363, theHeight - 643, 345, theHeight - 648);
  popStyle();
  
  //water level
  pushStyle();
  stroke(150,150,180);
  arc(380, theHeight - 642, 262, 80, PI + HALF_PI - .35, PI + HALF_PI +.35);
  popStyle();
  pushStyle();
  stroke(170,170,200);
  arc(380, theHeight - 642, 262, 80, PI + HALF_PI +.35, PI*3 + HALF_PI - .35);
  popStyle();
}


