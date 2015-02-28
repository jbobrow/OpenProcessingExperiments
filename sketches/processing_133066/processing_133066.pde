
  println("hallo!");
  
  //canvas size and color
  background( #924f42 );
  size (400,400);
  
  //hair
  fill(#483c32);
  noStroke();
  ellipse (200,200,200,200);
  
  //cut hair
  fill (#924f42);
  rectMode(CENTER);
  rect(200,300,200,100);
  
  //face
  fill (#eea2ad);
  noStroke();
  ellipse (200,200,150,150);
  
  
  
  //arc(50, 50, 20, 20, 180,  HALF_PI);
  //arc(230,180, 30, 30, 0, PI+QUARTER_PI, OPEN);
  //arc(180,230, 30, 30, 0, PI+QUARTER_PI, OPEN);

  // eyes
  stroke(#000000);
  strokeWeight(4);
  noFill();
  arc(165, 180, 40, 40, 0, PI );
  arc(230, 180, 40, 40, 0, PI );
  
  //mouth
  noFill();
  stroke(#8b0a50);
  arc(200, 220, 50, 50, 0, PI);
