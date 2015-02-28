
Rain r1;

int numDrops = 100;
Rain[] drops = new Rain[numDrops];

float mx;
float my;
float easing = 0.05;
int radius = 30;


void setup() {
  size(1200, 600);
  background(0);



  smooth();
  noStroke();
  for (int i = 0; i < drops.length; i++) {

    drops[i] = new Rain(); 
    r1 = new Rain();

   
  }
}



void draw() {

  for (int i = 1; i < 600; i++) {
    line(600+i*20, 0, 1200, i*20);
    stroke(0, 200, 220);
    strokeWeight(.25);
  }


  for (int i = 1; i < 600; i++) {
    line(600-i*20, 0, 0, i*20);
    stroke(0, 200, 220);
    strokeWeight(.25);
  }

  fill(0, 50);
  rect(0, 0, 1200, 600);
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }


  fill(0);
  ellipse(600, 400, 100, 125);
  stroke(255);
  fill(255);
  ellipse(600, 425, 75, 75);
  ellipse(590, 365, 20, 40);
  ellipse(608, 365, 20, 40);
  fill(255, 200, 0);
  triangle(590, 375, 608, 375, 599, 395);
  ellipse(585, 465, 35, 20);
  ellipse(615, 465, 35, 20);
  fill(0);
  ellipse(595, 365, 10, 15);
  ellipse(603, 365, 10, 15);
  fill(0);
  stroke(0, 200, 220);
  triangle(560, 365, 540, 415, 560, 405);
  triangle(640, 365, 660, 415, 640, 406);


  if (abs(mouseX - mx) > 0.1) {
    mx = mx + (mouseX - mx) * easing;
  }
  if (abs(mouseY - my) > 0.1) {
    my = my + (mouseY- my) * easing;
  }

  
  fill(255);  
  ellipse(mx, my, radius, radius);
}


class Rain {
  float r = random(1200);
  float y = random(-height);

  void fall() {
    y = y + 10;
    fill(0, 10, 200, 180);
    ellipse(r, y, 10, 10);

    if (y>height) {
      r = random(1200);
      y = random(-200);
    }
  }
}
