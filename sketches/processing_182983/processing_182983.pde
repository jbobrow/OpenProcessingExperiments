
float posx;
float posy;
float velx = 2;
float vely = 2;
float sz = 10;
color relleno;
boolean dinsrectangle;

void setup() {
  size(600, 400);
  posx = width/2;
  posy = height/2;
  relleno = color(255);
}

void draw() {
  //background(0);
  noStroke();
  fill(0, 25);
  rect(0, 0, width, height);

  posx = posx + velx;
  posy = posy + vely;

  fill(relleno);
  ellipse(posx, posy, sz, sz);

  stroke(255, 0, 0);
  noFill();
  rect(width/6, height/4, 4*width/6, 2*height/4);

  if (posx<width/6+sz/2 || posx>5*width/6-sz/2) {
    velx = -velx;
  } 
  if (posy<height/4+sz/2 || posy>3*height/4-sz/2) {
    vely = -vely;
  }

  if (mouseX>width/6 && mouseX<4*width/6 && mouseY>height/4 && mouseY<2*height/4) {
    dinsrectangle=true;
  }

  if (dinsrectangle==true && mousePressed) {
    colorMode(HSB);
    relleno = color(random(255), 255, 255);
    posx = mouseX;
    posy = mouseY;
    sz++;
    colorMode(RGB);
  }
 if (sz>100) {
    sz=10;
  }
}

void mouseReleased() {
  velx = random(-5, 5);
  vely = random(-5, 5);
}
