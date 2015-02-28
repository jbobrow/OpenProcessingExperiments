
float angle=0;

void setup() {
  size (900, 900);
  ellipseMode(CENTER);
}

void draw() {
  background(200);
  noStroke();
  //ellipse(width/2, height/2, 50,50);


  if (mousePressed==true) {
    angle +=0;
    //sun
    fill(0);
    text("sun",125,50);
    fill(255, 255, 0);
    ellipse(100, 50, 20, 20);

    //mercury
    fill(0);
    text("mercury",125,70);
    fill(100);
    ellipse(100, 70, 7, 7);

    //venus
    fill(0);
    text("venus",125,90);
    fill(255, 170, 0);
    ellipse(100, 90, 15, 15);

    //earth
    fill(0);
    text("earth",125,130);
    fill(64, 136, 255);
    ellipse(100, 130, 20, 20);

    //mars
    fill(0);
    text("mars",125,150);
    fill(255, 57, 3);
    ellipse(100, 150, 15, 15);

    //jupiter
    fill(0);
    text("jupiter",125,200);
    fill(224, 193, 136);
    ellipse(100, 200, 40, 40);

    //saturn
    fill(0);
    text("saturn",125,250);
    fill(224, 149, 136);
    ellipse(100, 250, 33, 33);
    
    //uranus
    fill(0);
    text("uranus",125,350);
    fill(117, 133, 175);
    ellipse(100, 350, 25, 25);

    //neptune
    fill(0);
    text("neptune",125,400);
    fill(63, 0, 255);
    ellipse(100, 400, 23, 23);

    //pluto
    fill(0);
    text("pluto",125,450);
    fill(255, 115, 0);
    ellipse(100, 450, 5, 5);
    
  }
  else {
    angle +=.25;
//  }

    pushMatrix();
    translate(width/2, height/2);

    rotate(radians(angle));
    //sun
    fill(255, 255, 0);
    ellipse(0, 0, 20, 20);

    //Mercury
    rotate(radians(angle+.75));
    fill(100);
    ellipse(0, 20, 7, 7);

    //venus
    rotate(radians(angle+1));
    fill(255, 170, 0);
    ellipse(0, 40, 15, 15);

    //earth
    fill(64, 136, 255);
    ellipse(0, 80, 20, 20);

    //mars
    rotate(radians(angle+.25));
    fill(255, 57, 3);
    ellipse(0, 100, 15, 15);

    //jupiter
    rotate(radians(angle+.75));
    fill(224, 193, 136);
    ellipse(0, 150, 40, 40);

    //saturn
    rotate(radians(angle-.75));
    fill(224, 149, 136);
    ellipse(0, 200, 33, 33);

    //uranus
    rotate(radians(angle-.25));
    fill(117, 133, 175);
    ellipse(0, 300, 25, 25);

    //neptune
    rotate(radians(angle-.8));
    fill(63, 0, 255);
    ellipse(0, 350, 23, 23);

    //pluto
    rotate(radians(angle+.75));
    fill(255, 115, 0);
    ellipse(0, 400, 5, 5);

    popMatrix();
  }
}
