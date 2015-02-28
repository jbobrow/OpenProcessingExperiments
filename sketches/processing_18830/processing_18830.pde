
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
  line (226, height - 720, 296, height - 311);
  line (535, height - 717, 486, height - 312);
  ellipse (389, height - 315, 191, 60);
  
  
  //top of straw
  line (498, height - 842, 458, height - 683);
  line (530, height - 838, 486, height - 690);
  ellipse (515, height - 840, 31, 17);
  
  
  //middle straw
  line (497, height - 687, 480, height - 618); 
  line (457, height - 682, 458, height - 674);
  line (458, height - 673, 445, height - 607);
  
  //end of straw
  line (445, height - 607, 332, height - 333);
  line (477, height - 615, 380, height - 333);
  ellipse (356, height - 333, 48, 8);
  
  //lemon
  pushStyle();
  fill(252, 204, 5);
  arc (347, height - 620, 168, 51, .1 , PI + HALF_PI + .2);
  arc (347, height - 632, 168, 51, .1 , PI + HALF_PI + .2);
  line(431, height - 630, 431, height - 625);
  line(363, height - 658, 363, height - 653);
  noStroke();
  triangle(431, height - 630, 431, height - 615, 420, height - 615);
  triangle(363, height - 658, 363, height - 643, 345, height - 648);
  popStyle();
  
  //water level
  pushStyle();
  stroke(150,150,180);
  arc(380, height - 642, 262, 80, PI + HALF_PI - .35, PI + HALF_PI +.35);
  popStyle();
  pushStyle();
  stroke(170,170,200);
  arc(380, height - 642, 262, 80, PI + HALF_PI +.35, PI*3 + HALF_PI - .35);
  popStyle();
}


