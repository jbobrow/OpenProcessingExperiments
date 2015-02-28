
PImage img;
PImage light;
PImage light2;

float xNudge=0;
float yNudge=0;
color ray = color(237,28,36,50);
color ray2 = color(244,255,92);

void setup() {
  size(640,480);
  smooth();
  noStroke();
  ellipseMode (RADIUS);
  img = loadImage ("eyes.png");
  light = loadImage("light.png");
  light2 = loadImage("light2.png");
}

void draw() {
  background(163,109,122);
  if (mousePressed) {
    background(244,65,88);
  }

  image (img, 0,0);

  noStroke();
  fill(255);

  float a = dist(mouseX, mouseY, 538,40);
  float b = dist(mouseX, mouseY, 178,498);
  float c = dist(mouseX, mouseY, 167,226);

  if (a >= 200) {
    a=200;
  }
  ellipse (538,40,a,a);

  if (b >= 147) {
    b=147;
  }
  ellipse (178,498,b,b);

  if (c >= 66) {
    c=66;
  }
  ellipse (167,226,c,c);




  fill(0);
  if (a > 170) {
    float A = atan2(mouseY-40,mouseX-538);
    float angle = A;
    float radius = 170;
    float x = 538 + cos(angle)*radius;
    float y = 40 + sin(angle)*radius;
    float xa = 538 + cos(angle)*(radius+5);
    float ya = 40 + sin(angle)*(radius+5);

    noStroke();
    ellipse(x,y,30,30);  //black pupil

    stroke(255,100);
    strokeWeight(2);
    ellipse(xa,ya,30*.7,30*.7);   //white pupil line
    strokeWeight(1);
    stroke(163,109,122);
    ellipse(xa,ya,30*.55,30*.55);   //pink pupil line

    stroke(ray);
    strokeWeight(6);
    line(mouseX,mouseY,xa,ya);
    stroke(255,40);
    strokeWeight(4);
    line(mouseX,mouseY,xa,ya);
    
    stroke(255,100);
    strokeWeight(1);
    float laserangle = atan2(mouseY-ya, mouseX-xa);
    float laserradius = dist(mouseX, mouseY, xa, ya);
    float laserCos = cos(laserangle);
    float laserSin = sin(laserangle);
    int offset = 3 + (frameCount % 7);
    for (int i=offset; i<laserradius; i+=9) {
      float slx = xa + laserCos * (i-offset);
      float sly = ya + laserSin * (i-offset);

      float elx = xa + laserCos * i;
      float ely = ya + laserSin * i;
      
      line(slx, sly, elx, ely);      

    }
  } 

  else if (mousePressed) {
    xNudge = random(-4*2, 4*2);
    yNudge = random(-4*2, 4*2);

    fill(204,44,27);
    noStroke();
    ellipse (mouseX+xNudge,mouseY+yNudge,30*1.2,30*1.2);  //black pupil

    noFill();
    stroke(255,100);
    strokeWeight(2);
    ellipse(mouseX+xNudge,mouseY+yNudge,30*.7*1.2,30*.7*1.2);   //white pupil line
    strokeWeight(1);
    stroke(20,20,153);
    ellipse(mouseX+xNudge,mouseY+yNudge,30*.55*1.2,30*.55*1.2);   //pink pupil line

    fill(255);
    noStroke();
    ellipse(mouseX+xNudge+7,mouseY+yNudge+7,7*1.2,7*1.2);
    ellipse(mouseX+xNudge+16,mouseY+yNudge-3,4*1.2,4*1.2);
    
  }

  else {
    xNudge = random(-4, 4);
    yNudge = random(-4, 4);

    noStroke();
    ellipse (mouseX+xNudge,mouseY+yNudge,30,30);  //black pupil

    stroke(255,100);
    strokeWeight(2);
    ellipse(mouseX+xNudge,mouseY+yNudge,30*.7,30*.7);   //white pupil line
    strokeWeight(1);
    stroke(163,109,122);
    ellipse(mouseX+xNudge,mouseY+yNudge,30*.55,30*.55);   //pink pupil line

    fill(255);
    noStroke();
    ellipse(mouseX+xNudge+7,mouseY+yNudge+7,7,7);
    ellipse(mouseX+xNudge+16,mouseY+yNudge-3,4,4);
  }

  fill(0);
  if (b > 122) {
    float A = atan2(mouseY-498,mouseX-178);
    float angle = A;
    float radius = 122;
    float xx = 178 + cos(angle)*radius;
    float yy = 498 + sin(angle)*radius;
    float xxa = 178 + cos(angle)*(radius+4);
    float yya = 498 + sin(angle)*(radius+4);

    noStroke();
    ellipse(xx,yy,25,25);   //black pupil

    stroke(255,100);
    strokeWeight(1.8);
    ellipse(xxa,yya,25*.7,25*.7);   //white pupil line
    strokeWeight(1);
    stroke(163,109,122);
    ellipse(xxa,yya,25*.55,25*.55);   //pink pupil line

    stroke(ray);
    strokeWeight(6);
    line(mouseX,mouseY,xxa,yya);
    stroke(255,40);
    strokeWeight(4);
    line(mouseX,mouseY,xxa,yya);
    stroke(255,100);
    strokeWeight(1);
    float laserangle = atan2(mouseY-yya, mouseX-xxa);
    float laserradius = dist(mouseX, mouseY, xxa, yya);
    float laserCos = cos(laserangle);
    float laserSin = sin(laserangle);
    int offset = 3 + (frameCount % 7);
    for (int i=offset; i<laserradius; i+=9) {
      float slx = xxa + laserCos * (i-offset);
      float sly = yya + laserSin * (i-offset);

      float elx = xxa + laserCos * i;
      float ely = yya + laserSin * i;
      
      line(slx, sly, elx, ely);      

    }
  } 
  else if (mousePressed) {
    xNudge = random(-3*2, 3*2);
    yNudge = random(-3*2, 3*2);

    fill(204,44,27);
    noStroke();
    ellipse (mouseX+xNudge,mouseY+yNudge,25*1.2,25*1.2);   //black pupil

    noFill();
    stroke(255,100);
    strokeWeight(1.8);
    ellipse(mouseX+xNudge,mouseY+yNudge,25*.7*1.2,25*.7*1.2);   //white pupil line
    strokeWeight(1);

    stroke(20,20,153);
    ellipse(mouseX+xNudge,mouseY+yNudge,25*.55*1.2,25*.55*1.2);   //pink pupil line

    fill(255);
    noStroke();
    ellipse(mouseX+xNudge+7,mouseY+yNudge+7,6*1.2,6*1.2);
    ellipse(mouseX+xNudge+16,mouseY+yNudge-3,3*1.2,3*1.2);
  }

  else {
    xNudge = random(-3, 3);
    yNudge = random(-3, 3);
    noStroke();
    ellipse (mouseX+xNudge,mouseY+yNudge,25,25);   //black pupil

    stroke(255,100);
    strokeWeight(1.8);
    ellipse(mouseX+xNudge,mouseY+yNudge,25*.7,25*.7);   //white pupil line
    strokeWeight(1);
    stroke(163,109,122);
    ellipse(mouseX+xNudge,mouseY+yNudge,25*.55,25*.55);   //pink pupil line
    fill(255);
    noStroke();
    ellipse(mouseX+xNudge+7,mouseY+yNudge+7,6,6);
    ellipse(mouseX+xNudge+16,mouseY+yNudge-3,3,3);
  }

  fill(0);
  if (c > 51) {
    float A = atan2(mouseY-226,mouseX-167);
    float angle = A;
    float radius = 51;
    float xxx = 167 + cos(angle)*radius;
    float yyy = 226 + sin(angle)*radius;
    float xxxa = 167 + cos(angle)*(radius+3);
    float yyya = 226 + sin(angle)*(radius+3);

    noStroke();
    ellipse(xxx,yyy,15,15);   //black pupil

    stroke(255,100);
    strokeWeight(1.3);
    ellipse(xxxa,yyya,15*.7,15*.7);   //white pupil line
    strokeWeight(1);
    stroke(163,109,122);
    ellipse(xxxa,yyya,15*.55,15*.55);   //pink pupil line

    stroke(ray);
    strokeWeight(6);
    line(mouseX,mouseY,xxxa,yyya);
    stroke(255,40);
    strokeWeight(4);
    line(mouseX,mouseY,xxxa,yyya);
    stroke(255,100);
    strokeWeight(1);
    float laserangle = atan2(mouseY-yyya, mouseX-xxxa);
    float laserradius = dist(mouseX, mouseY, xxxa, yyya);
    float laserCos = cos(laserangle);
    float laserSin = sin(laserangle);
    int offset = 3 + (frameCount % 7);
    for (int i=offset; i<laserradius; i+=9) {
      float slx = xxxa + laserCos * (i-offset);
      float sly = yyya + laserSin * (i-offset);

      float elx = xxxa + laserCos * i;
      float ely = yyya + laserSin * i;
      
      line(slx, sly, elx, ely);      

    }
  } 
  else if (mousePressed) {
    xNudge = random(-2*2, 2*2);
    yNudge = random(-2*2, 2*2);

    fill(204,44,27);
    noStroke();
    ellipse (mouseX+xNudge,mouseY+yNudge,15*1.2,15*1.2);   //black pupil

    stroke(255,100);
    strokeWeight(1.3);
    ellipse(mouseX+xNudge,mouseY+yNudge,15*.7*1.2,15*.7*1.2);   //white pupil line
    strokeWeight(1);

    stroke(20,20,153);
    ellipse(mouseX+xNudge,mouseY+yNudge,15*.55*1.2,15*.55*1.2);   //pink pupil line

    fill(255);
    noStroke();
    ellipse(mouseX+xNudge+5,mouseY+yNudge+5,4*1.2,4*1.2);
    ellipse(mouseX+xNudge+11,mouseY+yNudge-2,2*1.2,2*1.2);
  }

  else {
    xNudge = random(-2, 2);
    yNudge = random(-2, 2);
    noStroke();
    ellipse (mouseX+xNudge,mouseY+yNudge,15,15);   //black pupil

    stroke(255,100);
    strokeWeight(1.3);
    ellipse(mouseX+xNudge,mouseY+yNudge,15*.7,15*.7);   //white pupil line
    strokeWeight(1);
    stroke(163,109,122);
    ellipse(mouseX+xNudge,mouseY+yNudge,15*.55,15*.55);   //pink pupil line
    fill(255);
    noStroke();
    ellipse(mouseX+xNudge+5,mouseY+yNudge+5,4,4);
    ellipse(mouseX+xNudge+11,mouseY+yNudge-2,2,2);
  }

  xNudge = random(-10, 10);
  yNudge = random(-10, 10);
  if (mousePressed) {
    image(light2, mouseX-100+xNudge,mouseY-100+yNudge);
  } 
  else {
    image(light, mouseX-100+xNudge,mouseY-100+yNudge);
  }
}


