
int x, y;
int vx, vy ;

void setup() {
  size(600, 600);
  x = 0 ;
  y = 250 ;
  vx = 5 ;
  vy = 4 ;
}

void draw() {
  background(200);
  background(#061346);
  pushMatrix();

  fill(#37F013);
  ellipse(500, 500, 20, 20);
  ellipse(360, 450, 10, 10);
  ellipse(150, 115, 10, 10);
  ellipse(580, 450, 20, 20);
  fill(#FFF303);
  ellipse(300, 65, 15, 15);
  ellipse(660, 600, 20, 20);
  ellipse(100, 470, 20, 20);
  fill(#F013AE);
  ellipse(420, 420, 10, 10);
  ellipse(300, 400, 5, 5);
  ellipse(100, 100, 10, 10);
  ellipse(200, 200, 20, 20);
  fill(#FFFCFE);
  ellipse(100, 10, 15, 15);
  ellipse(650, 650, 80, 80);
  ellipse(10, 47, 20, 20);

  popMatrix();







  chara(x, y);
  x = x + vx ;
  y = y + vy ;
  if (x > 500) vx = -vx ;
  if (x < 0) vx = -vx ;
  if (y > 500) vy = -vy ;
  if (y < 0) vy = -vy ;

  if (mousePressed) {
    background(200);
    background(#A2F7EF); 
    //sun
    pushMatrix();
    rotate(map(x, 200, 600, 0, radians(5)));
    fill(#FA1212);
    ellipse(400, 400, 300, 300);
    fill(#050000);
    popMatrix();

    //   croud
    pushMatrix();
    fill(#FFFFFF);
    ellipse(100, 300, 305, 60);
    ellipse(220, 90, 500, 50);
    ellipse(600, 450, 500, 100);  
    popMatrix();






    pushMatrix();   
    fill(#37F013);
    scale(map(x, 0, 600, 0, 5));
    ellipse(500, 500, 20, 20);
    ellipse(360, 450, 10, 10);
    ellipse(150, 115, 10, 10);
    ellipse(580, 450, 20, 20);
    fill(#FFF303);
    ellipse(300, 65, 15, 15);
    ellipse(660, 600, 20, 20);
    ellipse(100, 470, 20, 20);
    fill(#F013AE);
    ellipse(420, 420, 10, 10);
    ellipse(300, 400, 5, 5);
    ellipse(100, 100, 10, 10);
    ellipse(200, 200, 20, 20);
    fill(#FFFCFE);
    ellipse(100, 10, 15, 15);
    ellipse(650, 650, 80, 80);
    ellipse(10, 47, 20, 20);



    popMatrix();

    chara(int(x)-200, int(y)-200);
    chara(int(x)-250, int(y)-150);
    chara(int(x)+100, int(y)+300);
    chara(int(x)+250, int(y)+200);
    chara(int(x)+350, int(y)+300);

    PFont font;

    rotate(map(x, 200, 600, 0, radians(30)));
    textSize(50);
    fill(#5105FA);
    text("*good morning*", 150, 200);
    x=x+vx;
    if (x>width-45) {
      vx=-5;
    }
    if (x<40) {
      vx=5;
    }
    y=y+vy;
    if (y>width-45) {
      vy=-5;
    }
    if (y<0) {
      vy=5;
    }

    if (mousePressed) {

      if ((mouseX>x-100)&&(mouseX<x+50)&&(mouseY>y-100)&&(mouseY<y+50
        )) {
        x=mouseX;
        y=mouseY;
      }
    }
  }
}   


void chara(int a, int b) {
  pushMatrix();
  translate(a, b); 
  //year
  pushMatrix();
  translate(50, 30);
  scale(map(a, 0, 600, 0, 5));
  rotate(map(b, 0, 600, 0, radians(3600)));
  strokeWeight(1.5);
  triangle(-30, -20, -10, 0, -40, 0);
  triangle(30, -20, 40, 0, 10, 0);
  //chuushin-50,30
  popMatrix();

  //inside year
  pushMatrix();
  translate(50, 30);
  scale(map(a, 0, 600, 0, 3));
  fill( map(a, 0, 600, 0, 277), map(b, 0, 600, 0, 277), 0);
  triangle(30, -15, 35, -2, 15, -2);
  triangle(-30, -15, -35, -2, -15, -2);
  //chuushin-50,30
  popMatrix();

  //face
  fill(250, 250, 252);
  rect(20, 30, 60, 40, 7);
  line(40, 30, 40, 35);
  line(60, 30, 60, 35);
  line(50, 30, 50, 33);


  //body
  fill(a, b, 240);
  triangle(50, 70, 70, 90, 30, 90);

  //eye
  line(30, 50, 40, 50);
  line(60, 50, 70, 50);

  //hands
  fill(250, 250, 252);
  line(30, 80, 40, 80);
  line(60, 80, 70, 80);
  ellipse(30, 80, a/20, a/20);
  ellipse(70, 80, a/20, b/20);

  //foots
  line(40, 90, 40, 100);
  line(60, 90, 60, 100);
  ellipse(60, 97, a/30, a/30);
  ellipse(40, 97, a/30, a/30);

  //nose
  fill(10, 9, 9);
  ellipse(50, 50, 3, 3);

  //mouse
  fill(250, 250, 252);
  stroke(240, 53, 165);
  ellipse(50, 60, a/40, a/40);

  //hige
  stroke(5, 5, 5);
  line(15, 55, 25, 55);
  line(15, 65, 25, 65);
  line(75, 55, 85, 55);
  line(75, 65, 85, 65);

  popMatrix();
}



