

size(500, 500);
background(255);
smooth();



for (int x=10 ; x<=width; x+=20) {//spacing of the dots horizontally

  for (int y=10; y<=width; y+=20) { //spacing of the dots vertically
    pushMatrix();//sets up the first grid
    translate(250, 250);
    rotate(radians(10));
    strokeWeight(20);
    stroke(random(200), random(200), 40, 80);
    point(x, y);  
    popMatrix();

    pushMatrix();//sets up the second grid
    rotate(radians(10));
    translate(175, 100);
    strokeWeight(10);
    stroke(random(200), random(200), 40, 80);
    point(x, y);  
    strokeWeight(1);
    stroke(200, 10);
    rotate(radians(5));
    //line(-x,-x,x*2,height);
    line(-x, -x, x*2, height);

    popMatrix();

    pushMatrix();
    rotate(radians(10));
    translate(0, 0);
    strokeWeight(5);
    stroke(random(200), random(200), 40, 80);
    point(x, y);  
    popMatrix();
  }
}


