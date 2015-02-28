
AnalogClock analogClock;
PShape clok;
PImage arw1;
PImage arw2;
PImage am, pm, sun, moon;




void setup() {
  size(450, 450, P3D);
  smooth();
  analogClock = new AnalogClock(width/2, height/2);
  //ÁîªÂÉè„Éï„Ç°„Ç§„É´Ë®≠ÂÆö

  clok = loadShape("clock.svg");
  arw1 = loadImage("arw1.png");
  arw2 = loadImage("arw2.png");
  am = loadImage("am.png");
  pm = loadImage("pm.png");
  sun = loadImage("sun.png");
  moon = loadImage("moon.png");
}

void draw() {
  background(255);
  analogClock.getTime();
  analogClock.display();
}

class AnalogClock extends Clock {
  float x, y;

  AnalogClock(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void getTime() {
    super.getTime();
  }

  void display() {
    //Áõ§

    //Èáù„ÅÆËâ≤

    //ÊôÇ
    pushMatrix();
    translate(width/2, height/2);
    float mappedY = map(mouseY, 0, height,  PI/4, -PI/4);
    float mappedX = map(mouseX, 0, width, -PI/4, PI/4);
    rotateY(mappedX);
    rotateX(mappedY);

    pushMatrix();
    fill(255);
    translate(0,0, -50 );
    smooth();
    shape(clok,-150, -100,300,300);  
    // AM PM
    if (h > 11) {
       image(pm, 35, 107);
    } else {
       image(am, 35, 107); 
    }
    // sun moon
    if (h > 17 || h < 6) {
      image(moon, 60, 107);
    } else {
      image(sun, 60, 107);
    }
   
    
    popMatrix();

    pushMatrix();
    fill(255);
    translate(0,0, -100 );
    ellipse(0,0,130,130);   
    popMatrix();

    // HOURS
    pushMatrix(); 
    translate(25,20);
    rotate((h + m/60.0) % 12 * TWO_PI/12 + PI);
   
    image(arw2,0,0);
    popMatrix();

    //MINUTES
    pushMatrix();
    translate(14,10);
    rotate((m + s/60.0) * TWO_PI/60 +PI);
    tint(255);
    image(arw1, 0, 0);
    popMatrix();



    //SECONDS
    pushMatrix();
    rotate(s * TWO_PI/60 + PI);
    pushMatrix(); 

    rotate(radians(175));
     fill(255, 0, 0);
    ellipse(0, 0, 10, 10);
    
    strokeWeight(3);
    line(0, 0, 0, -120);
    popMatrix();
    ;
    popMatrix();

    popMatrix();
    
   
    
    
   
    
    
    
  }
}

class Clock {
  int h, m, s;
  Clock() {
  }

  void getTime() {
    h = hour();
    m = minute();
    s = second();
  }
}




