
int anzahl = 10;
int value= 0;

float winkel = 0;
float speed;
float f;


void setup ()
{
  size (500, 500);
  smooth ();

  rectMode (CENTER);
  noStroke ();
}

void draw()
{
  background(0); 

  if (winkel > TWO_PI) {
    winkel = 0;
  }

  frameRate(10);

  for (int i=0; i < 20; i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate (winkel);

    if (mousePressed) {
      stroke(4);

      fill (random(0,255),random(0,255),random(0,255));
      //scale(random(7));
      ellipse (0, 0, 700 - i * 40, 700 - i * 40);
    } else {


      winkel = winkel + 0.004;
    }
    popMatrix();

    fill(0);
  }

  line (100, 60, 60, 100);
  line (60+80, 100, 20+80, 60);




  fill (0);
  noStroke();
  ellipse(100, 60, 80, 60);

  fill (125);
  speed=random(-2,2);
  f=width/2+speed;
  ellipse(f-150, 60, 40, 30);

  pushMatrix();  
  translate(78, 50);
  fill(255);
  rotate(PI/3.5);
  ellipse(33, -30, 15, 35);
  popMatrix();

  pushMatrix(); 
  translate(78, 55);
  fill(255);
  rotate(-PI/3.5);
  ellipse(0, 0, 15, 35);
  popMatrix();

  
    float x = map (mouseX, 0, width, 83, 78);
    float x2 = map (mouseX, 0, width, 120, 115);

    fill (#FF0000);
    stroke (0);
    ellipse(x, 60, 10, 10);
    ellipse(x2, 60, 10, 10);
  
}

