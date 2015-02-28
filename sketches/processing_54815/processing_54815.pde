
class Billy {

  float Bx, By, Bsca;

  float XELL, XT2;
  float y3, y4, y5;
  float x3, x4, x5;
  float XN, XFLeft, XFRight;
  float mouth, YM, YEars;
  float AYL, AYR;

  float speed;

  float rx, ry;
  float x, y;

  Billy(float x, float y, float sca, float tempS) {
    Bx = x;
    By = y;
    Bsca = sca;

    speed = tempS;
  }

  void Willy() {
    XELL = random(-5, 5);
    XT2 = random(-18, -8);

    y3 = random(10, 20);
    y4 = random(55, 70);
    y5 = random(70, 90);

    x3 = random(8, 15);
    x4 = random(170, 190);
    x5 = random(140, 150);

    XN = random(-25, -10);
    
    AYL = random(140, 160);
    AYR = random(142, 162);

    XFLeft = random(-20, -10);
    XFRight = random(0, 10);

    mouth = random(3, 10);
    YM = random(80, 85);

    YEars = random(60, 70);


    pushMatrix();
    translate(Bx, By);

    //changes position & scale
    pushMatrix();
    translate(x, y);
    scale(Bsca);
    
    fill(color(random(100,200), random(10,200), random(100,200)));

    //hat
    noStroke();
    ellipse(XELL, 0, 10, 10);
    triangle(XELL, 0, XT2, 38, -XT2, 38);

    //neck
    rect(XN, 107, 33, 9);

    //arms
    rect(-46, AYL, 11, 11);
    rect(36, AYR, 11, 11);

    //feet
    rect(XFLeft, 205, 15, 10);
    rect (XFRight, 205, 15, 10);

    //ears
    rect(-45, YEars, 6, 14);
    rect(39, YEars, 6, 14);

    //head
    fill(0);
    stroke(color(random(200, 255), random(80,200), random(10, 100)));
    strokeWeight(4);
    beginShape();
    vertex(-y3, 42);
    vertex(y3, 42);
    vertex(35, y4);
    vertex(35, 80);
    vertex(y3, 102);
    vertex(-y3, 102);
    vertex(-35, 80);
    vertex(-35, y4);
    endShape(CLOSE);

    //body
    beginShape();
    vertex(-x3, 120);
    vertex(x3, 120);
    vertex(32, x5);
    vertex(32, x4);
    vertex(x3, 200);
    vertex(-x3, 200);
    vertex(-32, x4);
    vertex(-32, x5);
    endShape(CLOSE);
    
    //thunderbolt
    noStroke();
    fill(color(random(120,255), random(30,200), random(100,110)));
    beginShape();
    vertex(14, 139);
    vertex(22, 139);
    vertex(15, 151); 
    vertex(22, 151);
    vertex(4, 174);
    vertex(11, 157);
    vertex(6, 157);
    endShape(CLOSE);

    //eyes
    triangle(-18, 60, -12, 60, -15, 69);
    triangle(12, 60, 18, 60, 15, 69);
    
     //mouth
    rect(-15, YM, 30, mouth);

    popMatrix();
    popMatrix();
  }
}


