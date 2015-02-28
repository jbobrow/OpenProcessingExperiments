
void setup () {
  size (275,275);
  smooth();
}

void draw () {
  background(mouseY,mouseX,mouseY);

  //antennae
  stroke(30,20,55,55);
  strokeWeight(13);
  strokeJoin(ROUND);
  line(100,100,50,60);

  fill(0,100);
  ellipse (40,53,20,20);
  ellipse (40,53,30,20);

  //body  
  fill( mouseX, mouseY, 300);
  noStroke();
  rotate(PI/200);
  arc(width/2,height/2,200,200,HALF_PI-1.2,PI+2.8);

  //eye
  fill(200);
  ellipse (167,95,30,40);

  //pupil
  if (mousePressed && (mouseButton == LEFT)) {
    fill(0);
    ellipse (170,90,20,20);
  } 
  else {
    fill(0);
    ellipse (170,105,20,20);
  }
}

                
