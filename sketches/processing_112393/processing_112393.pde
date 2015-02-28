
int num = 6;

color red;
color yellow;
color brown;
color orange;

void setup() {
  size(430, 430);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();
  noLoop();

  red = color(6, 95, 91);
  yellow = color(55, 95, 100);
  brown = color(29, 95, 45); //(29, 95, 50);
  orange = color(29, 95, 100);

  noStroke();
}

void draw() {
  background(brown);

  pushMatrix();
  translate(width/2, height/2);

  for (int i = 0; i < num*2;i++) {
    pushMatrix();
    translate(200*cos(radians(360*i/(num*2))), 200*sin(radians(360*i/(num*2))));
    rotate(radians(360*i/(num*2)+45));
    noStroke();
    fill(yellow);
    ellipse(0, 0, 130, 130);
    popMatrix();
  }

  for (int i = 0; i < num*2;i++) {
    pushMatrix();
    translate(180*cos(radians(360*i/(num*2)+45)), 180*sin(radians(360*i/(num*2)+45)));
    rotate(radians(360*i/(num*2)+45));
    noStroke();
    fill(orange);
    ellipse(0, 0, 150, 70);
    popMatrix();
  }

  for (int i = 0; i < num*2;i++) {
    pushMatrix();
    translate(150*cos(radians(360*i/(num*2)+45)), 150*sin(radians(360*i/(num*2)+45)));
    rotate(radians(360*i/(num*2)+45));
    noStroke();
    fill(red);
    ellipse(0, 0, 80, 80);
    popMatrix();
  }

  for (int i = 0; i < num*2;i++) {
    pushMatrix();
    translate(180*cos(radians(360*i/(num*2))), 180*sin(radians(360*i/(num*2))));
    rotate(radians(360*i/(num*2)+90));
    noStroke();
    fill(brown);
    flower(0, 0, 1.5);
    popMatrix();
  }

  fill(orange);
  ellipse(0, 0, 262, 262);

  fill(brown);
  ellipse(0, 0, 240, 240);

  for (int i = 0; i < num*20;i++) {
    pushMatrix();
    translate(131*cos(radians(360*i/(num*20))), 131*sin(radians(360*i/(num*20))));
    rotate(radians(360*i/(num*20)));
    noStroke();
    fill(brown);
    ellipse(0, 0, 5, 5);
    popMatrix();
  }

  for (int i = 0; i < num*2;i++) {
    pushMatrix();
    translate(130*cos(radians(360*i/(num*2))), 130*sin(radians(360*i/(num*2))));
    rotate(radians(360*i/(num*2)+90));
    noStroke();
    fill(yellow);
    flower(0, 0, 1);
    popMatrix();
  }

  fill(red);
  ellipse(0, 0, 200, 200);

  for (int i = 0; i < num*2;i++) {
    pushMatrix();
    translate(102*cos(radians(360*i/(num*2)+45)), 102*sin(radians(360*i/(num*2)+45)));
    rotate(radians(360*i/(num*2)+45));
    noStroke();
    fill(red);
    flower(0, 0, 1.5);
    popMatrix();
  }

  for (int i = 0; i < num*2;i++) {
    pushMatrix();
    translate(90*cos(radians(360*i/(num*2)+45)), 90*sin(radians(360*i/(num*2)+45)));
    rotate(radians(360*i/(num*2)+45));
    noStroke();
    fill(orange);
    ellipse(0, 0, 50, 40);
    popMatrix();
  }

  for (int i = 0; i < num*2;i++) {
    pushMatrix();
    translate(90*cos(radians(360*i/(num*2)+45)), 90*sin(radians(360*i/(num*2)+45)));
    rotate(radians(360*i/(num*2)+45));
    noStroke();
    fill(brown);
    ellipse(0, 0, 20, 10);
    popMatrix();
  }

  for (int i = 0; i < num*2;i++) {
    pushMatrix();
    translate(80*cos(radians(360*i/(num*2))), 80*sin(radians(360*i/(num*2))));
    rotate(radians(360*i/(num*2)));
    noStroke();
    fill(yellow);
    ellipse(0, 0, 20, 20);
    popMatrix();
  }

  for (int i = 0; i < num*2;i++) {
    pushMatrix();
    translate(60*cos(radians(360*i/(num*2))), 60*sin(radians(360*i/(num*2))));
    rotate(radians(360*i/(num*2)));
    noStroke();
    fill(yellow);
    ellipse(0, 0, 35, 35);
    popMatrix();
  }

  for (int i = 0; i < num;i++) {
    pushMatrix();
    translate(50*cos(radians(360*i/num)), 50*sin(radians(360*i/num)));
    rotate(radians(360*i/num));
    noStroke();
    fill(red);
    ellipse(0, 0, 30, 30);
    popMatrix();
  }

  for (int i = 0; i < num;i++) {
    pushMatrix();
    translate(50*cos(radians(360*i/num + 90)), 50*sin(radians(360*i/num + 90)));
    rotate(radians(360*i/num));
    noStroke();
    fill(orange);
    ellipse(0, 0, 40, 40);
    popMatrix();
  }

  for (int i = 0; i < num;i++) {
    pushMatrix();
    translate(40*cos(radians(360*i/num)), 40*sin(radians(360*i/num)));
    rotate(radians(360*i/num));
    noStroke();
    fill(yellow);
    ellipse(0, 0, 35, 15);
    popMatrix();
  }

  noStroke();
  fill(red);
  ellipse(0, 0, 70, 70);

  for (int i = 0; i < num*2;i++) {
    pushMatrix();
    translate(35*cos(radians(360*i/(num*2))), 35*sin(radians(360*i/(num*2))));
    rotate(radians(360*i/(num*2)));
    noStroke();
    if (i % 2 == 0) {
      fill(orange);
    } else {
      fill(brown);
    }
    ellipse(0, 0, 10, 10);
    popMatrix();
  }


  noStroke();
  fill(orange);
  flower(0, 0, 1.5);
  fill(brown);
  flower(0, 0, 0.8);



  popMatrix();
}

void flower(float x, float y, float s) {
  for (int j = 0 ; j < num; j++) {
    pushMatrix();
    translate(x, y);
    rotate(radians((360/ num) * j));

    for (int i = 10; i > 0;i--) {
      ellipse(0, i*1.2*s, s*i+3, s*i+3);
    }
    popMatrix();
  }
}



