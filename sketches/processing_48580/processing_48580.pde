
void setup() {

  size(600, 400);
  smooth();
}

void draw() {
  
  background(242, 204, 238);

fill(255);
ellipse (300, 200, 400, 200);

  // iris
  strokeWeight(2);
  stroke (16, 106, 220);
  fill(16, 106, 198);
  float x = map (mouseX, 0, width, 150, 440);
  float y = map (mouseY, 0, height, 170, 230);

  ellipse (x, y, 150, 150);

 fill(0);
 ellipse (x, y, 20, 20);
 fill(255);
 ellipse (x, y, 5, 5);

  //outline of eye

  noFill();
  ellipse(300, 200, 400, 200);

  stroke(242, 204, 238);
  strokeWeight(60);
  noFill();
  ellipse(300, 200, 450, 250);

  stroke(0);
  strokeWeight(10);
  noFill();
  ellipse(300, 200, 400, 200);

  //pink eyeliner
  stroke(240, 184, 247);
  strokeWeight(4);
  noFill();
  ellipse(300, 200, 390, 190);

  // arcs

  stroke (0);

  arc(300, 200, 700, 300, PI, TWO_PI-PI/2);
  arc(300, 200, 700, 300, TWO_PI-PI/2, TWO_PI);

  stroke(240, 184, 247);
  arc(300, 200, 700, 300, 0, PI/2);
  arc(300, 200, 700, 300, PI/2, PI);
  //arc(300, 200, 700, 300, PI, TWO_PI-PI/2);

  //crows feet

  stroke(0);
  strokeWeight (2);
  line (550, 200, 580, 180);
  line (550, 200, 580, 200);
  line (550, 200, 580, 220);

  line (25, 200, 150, 130);
  line (25, 200, 150, 270);
  line (470, 142, 550, 200);
  line (470, 258, 550, 200);

  // and draw a circle in that position
  //fill(0);
  //ellipse(x-10, y-10, 15, 15); 
  //fill(255);
  //ellipse(x-10, y-10, 5, 5); 



  //ellipse ((width/2) + mouseX * 0.5, (height/2) mouseY * 0.5, 40, 40);
}

void mousePressed(){
  if (mousePressed = true);
  fill (0);
    ellipse(300, 200, 400, 200);

//  background(255,0,100);
}

