
int x, y;
int vx;
int vy;
void setup() {
  size(600, 600);
  x=0;
  y=height/2;
  vx=3;
  vy=7;
}
void draw() {
  if (mousePressed) {
    background(201,130,53);
    pushMatrix();
    //lief
    noStroke();
    fill(166, 224, 115);
    ellipse(425,90,50,120);
    ellipse(380,70,30,50);
    rect(380,75,40,20);
    ellipse(470,100,20,40);
    rect(430,100,40,20);
    fill(201,130,53);
    rect(390,135,470,30);
    popMatrix();

    //character

    chara(x-50, y-50);
    chara(x-170, y-50);
    chara(x+70, y-50);

    x=x+vx;
    if (x>width-170) {
      vx=-25;
    }
    if (x<145) {
      vx=20;
    }
    y=y+vy;
    if (y>width-140) {
      vy=-18;
    }
    if (y<30) {
      vy=30;
    }
    if (mousePressed) {
      if ((mouseX>x-100)&&(mouseX<x+100)&&(mouseY>x-100)&&(mouseY<y+100)) {
        x=mouseX;
        y=mouseY;
      }
    }
    pushMatrix();
    //lief
    noStroke();
    fill(90,134,43);
    ellipse(185,450,150,350);
    ellipse(60,470,80,150);
    rect(60,500,80,45);
    ellipse(350,350,110,200);
    rect(200,380,150,70);
    popMatrix();
  }else {
    background(134, 222, 85);
    //lief
    fill(84,147,58);
    triangle(350, 30, 350, 150, 450, 150);
    triangle(500, 30, 500, 150, 400, 150);
    triangle(425, 30, 375, 150, 475, 150);

    //character

    chara(x-50, y-50);
    chara(x-170, y-50);
    chara(x+70, y-50);

    x=x+vx;
    if (x>width-170) {
      vx=-10;
    }
    if (x<145) {
      vx=7;
    }
    y=y+vy;
    if (y>width-140) {
      vy=-3;
    }
    if (y<30) {
      vy=15;
    }
    if (mousePressed) {
      if ((mouseX>x-100)&&(mouseX<x+100)&&(mouseY>x-100)&&(mouseY<y+100)) {
        x=mouseX;
        y=mouseY;
      }
    }
    //lief
    fill(41, 131, 28);
    triangle(20, 400, 20, 600, 250, 600);
    triangle(350, 400, 350, 600, 120, 600);
    triangle(185, 400, 65, 600, 305, 600);
  }
}

void chara(int a, int b) {
  pushMatrix();
  translate(a, b);
  scale(map(b,0,height,1.0,2.0));
  if (mousePressed) {
    fill(a, b, a);
    //tail
    stroke(a, b, a);
    strokeWeight(10);
    line(50, 95, 90, 75);
    noStroke();
    //face
    ellipse(50, 50, 50, 50);
    //ears
    triangle(45, 30, 30, 60, 20, 20);
    triangle(55, 30, 70, 60, 80, 20);
    //body
    ellipse(50, 90, 45, 40);
    strokeWeight(10);
    fill(10, 1, 1);
    //mouse
    triangle(50, 65, 45, 70, 55, 70);
    //eyes
    stroke(10, 1, 1);
    strokeWeight(2);
    line(35, 45, 45, 55);
    line(35, 55, 45, 45);
    line(55, 45, 65, 55);
    line(55, 55, 65, 45);
    //view
    pushMatrix();
    noStroke();
    fill(120,219,242,180);
    ellipse(5,40,6,6);
    ellipse(9,60,9,9);
    ellipse(95,30,10,10);
    ellipse(80,65,4,4);
    popMatrix();
  }
  else {
    fill(b, b, a);
    //tail
    stroke(b, b, a);
    strokeWeight(10);
    line(50, 95, 90, 75);
    noStroke();
    //face
    ellipse(50, 50, 50, 50);
    //ears
    triangle(45, 30, 30, 60, 20, 20);
    triangle(55, 30, 70, 60, 80, 20);
    //body
    ellipse(50, 90, 45, 40);
    strokeWeight(10);
    fill(10, 1, 1);
    //eyes
    ellipse(40, 50, 5, 5);
    ellipse(60, 50, 5, 5);
    //mouse
    triangle(50, 65, 45, 70, 55, 70);
  }
  popMatrix();
}



