
void setup () {
  size (600,500);
  smooth ();

  //sky
  noStroke ();
  //strokeWeight (1);
  fill(93,152,196, 170);
  rectMode(CORNER);
  rect(0,0, width, 100);

  //ground
  fill(6,106,58);
  rect(0,100, width, height);
}

void draw () {
  noStroke ();
  smooth();

  //Beak
  fill (0);
  triangle(10,100,70,80,70,120);

  //Head
  fill (242,235,12);
  ellipse (100,100, 100,80);

  //Wings
  fill(0);
  triangle(200,30,180,70,220,70); //wing 1
  triangle(240,30,220,75,260,75); //wing 2

  //Body
  ellipseMode (CORNER);
  fill (242,235,12);
  ellipse(135,60,150,90);

  //Eye
  ellipseMode (CENTER);
  fill(0);
  ellipse (70,80,15,15);

  //Pupil
  fill (255);
  ellipse(70,80,6,6);

  //Legs
  stroke(0);
  strokeWeight(2);
  line(200,150,200,200); //leg 1
  //line
  line(220,150,220,200); //leg 2

  //Feet 1
  line(200,200,180,210);
  line(200,200, 220,210);

  //Feet 2
  line(220,200,200,220);
  line(220,200,240,220);

  //Draw clouds when mouse in sky

  //coordinates for sky = (0,0,600,100)

  int y = mouseY;
//if mouse is in the sky then draw candy rain
  if (y < 100) { //if the mouse is on the right side of the screeen then draw
  noStroke();
  fill (random (255), random (255), random (255));
    ellipse(mouseX, mouseY, 9, 9);
    
  }
  //else if mouse is on the ground then draw rocks
  else {
    strokeWeight(1);
    fill(139,69,19);
    ellipse(mouseX, mouseY,50,35);
  }
  
 
  //
  //}


  //void setup() { size(480, 120); fill(0, 102); smooth(); noStroke();
  //}
  //Response 53
  //void draw() { ellipse(mouseX, mouseY, 9, 9);
}




