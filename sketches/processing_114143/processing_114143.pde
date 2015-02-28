
int z;
int l;
float a, x, y;
float teta;
int b;
float c;
float d;
float angle;
float jitter;

void setup() {
  background(130, 216, 255);
  size(900, 600);
  frameRate (5);
  ellipseMode(CENTER);
}

void draw() {
  colorMode(RGB);
  background(130, 190, 200);

  for (int a=1; a<502; a+=1) {

    stroke(a/2, 50, 50);
    line(0, a, 1000, a);
  }
  //Prédios
  stroke(0);
  for (int a=0; a<50; a++)
    rect(a*20+random(15), 500, random(20, 40), -random(100, 200));
noFill();

  //luzes------


  for (float d = 0; d<320; d=d+15) {
    stroke(random(c), random(c), random(c));
    noFill();
    ellipseMode(CENTER);
    ellipse(450, 300, d, d);
  }

  //roda gigante---
  strokeWeight(1);
  noFill();
  stroke(190);
  ellipse(450, 300, 350, 350);
  ellipse(450, 300, 320, 320);
  if (second() % 2 == 0) {  
    jitter = random(-0.1, 0.1);

    fill(90);
    colorMode (HSB);
    for (int i=0; i<48; i++)
    {
      teta= i* PI/24 +mouseX * PI/width;
      x=167*cos(teta);
      y=167*sin(teta);
      fill(teta*255/48, 255, 255);
      ellipse(450+x, 300+y, 15, 15);
    }
  }

  colorMode (RGB);
  //estruturas/
  strokeWeight(3);
  line(450, 300, 400, 500);
  line(450, 300, 500, 500);

  strokeWeight(0);
  line(450, 140, 450, 460);
  line(290, 300, 610, 300);
  
  //piso/
  fill(90);
  strokeWeight(3);
  line(0, 500, 900, 500);
  rect(400, 480, 100, 20);

  //luz holofote
  noStroke();
  if (mousePressed) {
    fill(234, 200, 130, 90);
    quad(430, 500, 450, 500, mouseX+50, mouseY, mouseX-50, mouseY);
  
    }
  }



  void keyPressed() {
    if (keyCode == UP) {
      c = 255;
    }
    else if (keyCode == DOWN) {
      c = 0;
    }
  }

