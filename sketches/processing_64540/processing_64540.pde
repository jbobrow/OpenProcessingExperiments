
float speed;
int diam ;
float x ;
float y ;
int i;
color c;
float angle = 0.3;

void setup() {
  background(255);
  size(200, 200);
  //logo = loadImage("lo-01.jpg");
  //logo.loadPixels();
  frameRate(100);
}

void draw() {

  speed = 2.5;
  diam = 20;
  x =1;
  y =1;
  fill(0);
  stroke(255);
  c = get(mouseX, mouseY);

  if (( mousePressed==true) && (i <1)) {

    x += random (-speed, speed);
    y += random(-speed, speed);
    fill(0);
    arc(random(width/2), random(height/2), diam, diam, PI, TWO_PI);
    i+=10;
  }
  else if ((blue(c) < 100) && (red(c) < 100)) { 

    for (int i = width/2; i<=200; i=i+2) {
      for (int j = height/2; j<=200; j=j+2) {
        x += random (-speed, speed);
        y += random(-speed, speed);
        x = constrain(x, mouseX-20, mouseY+70);
        y = constrain(y, mouseY-20, mouseY+70);
        angle += 0.1;
        float fr = map(cos(angle), 0, 1, 0.5, 2);
        //strokeWeight( abs(fr));
        stroke(255, 200);
        fill(y, 40, x, 200);
        ellipse(x, y, diam, diam);
      }
    }
  }
}


