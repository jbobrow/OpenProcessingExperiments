
float r = PI/6; // initial rotation
void setup () {
  size (400, 400);
  smooth();
  background (0);
  noStroke();
}
void draw () {
    fill(1);
  ellipse (0,0,130,130);

  if (frameCount > 1) { //if statement to prevent drawing in the upper left corner
    rectMode (CENTER);
    pushMatrix ();
    translate (width/2, height/2); //move the origin point according to mouse value
    rotate (r);
    fill (random(255),random(255),10,40);
    rect (0, 0, 350,350,350,350); // use 0,0 to position where mouse is
    fill (random(255),random(255),10,60);
    rect (0, 0, 240,240,240,240);
    fill (random(255),random(255),10,80);
    rect (0, 0, 130,130,130,130);
    fill (0,90);
    rect (0, 0, 90,90,90,90);
    
        fill(1);
  ellipse (0,0,70,70);
    popMatrix ();
    r += PI/36; //increment angle – make smaller to slow rotation
  }
}


