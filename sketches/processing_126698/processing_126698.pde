
int x, y;
int vx, vy ;

void setup() {
  size(600, 600);
  x = 0 ;
  y = 250 ;
  vx = 5 ;
  vy = 4 ;
}

void chara(int a,int b) {
  
    pushMatrix();
    translate(275,286);
  rotate(map(b/15,0,10,0,0.7));
  
  translate(a-300,b-300);
  
    translate(mouseX,mouseY);

  strokeWeight(1);
  fill(255);
  stroke(0);

  line(20, 30, 30, 5);
  line(30, 5, 70, 5);
  line(80, 30, 70, 5);
  rect(5,30, mouseX/20,40);
  rect(93,30,mouseX/20,40);
  quad(5, 70, 95, 70, 75, 90, 25, 90);
  ellipse(50, 50, 80, 80);
  fill(mouseX,mouseY,150);
  ellipse(40, 40, 10, 20);
  ellipse(60, 40, 10, 20);
  ellipse(50,60, mouseX/10, 10);

  rect(15, 20, 10, 10);
  rect(75, 20, 10, 10);
  rect(15, 70, 10, 10);
  rect(75, 70, 10, 10);

  fill(0);
  text("0", 16.27, 30);
  text("0", 75.5, 30);
  text("0", 16.27, 80);
  text("0", 75.5, 80);
  text("1", 35.5, 45);
  text("1", 55.5, 45);


popMatrix();
}

void draw() {
  noCursor();
  background(200);
  background(#CED8F6);
  pushMatrix();

  fill(#F781F3);
  noStroke();
  ellipse(500, 500, 20, 20);
  ellipse(360, 450, 10, 10);
  ellipse(150, 115, 10, 10);
  ellipse(580, 450, 20, 20);
  fill(#F2F5A9);
  ellipse(300, 65, 15, 15);
  ellipse(660, 600, 20, 20);
  ellipse(100, 470, 20, 20);
  fill(#CeF6F5);
  ellipse(420, 420, 10, 10);
  ellipse(300, 400, 5, 5);
  ellipse(100, 100, 10, 10);
  ellipse(200, 200, 20, 20);
  fill(#FFFFFF);
  ellipse(100, 10, 15, 15);
  ellipse(650, 650, 80, 80);
  ellipse(10, 47, 20, 20);
  
  pushMatrix();
    fill(#FFFFFF);
    ellipse(220, 90, 500, 50);
    ellipse(600, 450, 500, 100);
    noStroke();
    rect(100, 300, 305, 60);  
    popMatrix();


  popMatrix();

  chara(x, y);
  x = x + vx ;
  y = y + vy ;
  if (x > 500) vx = -vx ;
  if (x < 0) vx = -vx ;
  if (y > 500) vy = -vy ;
  if (y < 0) vy = -vy ;



  if (mousePressed) {
    background(random(150), 200, random(200));
    background(#220A29); 
    
    pushMatrix();
    rotate(map(x, 20, 40, 0, radians(5)));
    fill(#0B0B3B);
    stroke(0,0,255);
    ellipse(200, 200, 150, 150);
    fill(#08298A);
    stroke(0,0,255);
    ellipse(300, 300, 250, 250);
    fill(#FF0040);
    popMatrix();

    pushMatrix();
    fill(#0B3861);
    stroke(0,0,255);
    rect(100, 300, 305, 60);
    line(220, 90, 500, 50);
    line(600, 450, 500, 100);  
    popMatrix();






    pushMatrix();   
    fill(#610B4B);
    scale(map(x, 0, 600, 0, 5));
    ellipse(500, 500, 20, 20);
    ellipse(360, 450, 10, 10);
    ellipse(150, 115, 10, 10);
    ellipse(580, 450, 20, 20);
    fill(#5FB404);
    ellipse(300, 65, 15, 15);
    ellipse(660, 600, 20, 20);
    ellipse(100, 470, 20, 20);
    fill(#B40431);
    ellipse(420, 420, 10, 10);
    ellipse(300, 400, 5, 5);
    ellipse(100, 100, 10, 10);
    ellipse(200, 200, 20, 20);
    fill(#0B614B);
    ellipse(100, 10, 15, 15);
    ellipse(650, 650, 80, 80);
    ellipse(10, 47, 20, 20);

pushStyle();
  line(1, random(200), 600, random(500));
  line(1, random(500), 600, random(500));
  line(1, random(300), 600, random(400));



    popMatrix();

    chara(int(x)-100, int(y)-100);
    chara(int(x)-250, int(y)-150);
    chara(int(x)+100, int(y)+300);
    chara(int(x)+250, int(y)+200);
    chara(int(x)+350, int(y)+300);

    PFont font;
    
    translate(random(600), 100);

    rotate(map(x, 200, 600, 0, radians(30)));
    textSize(50);
    fill(#B40431);
    text("See it caught me !", 150, 200);
    x=x+vx;
    if (x>width-45) {
      vx=-8;
    }
    if (x<40) {
      vx=8;
    }
    y=y+vy;
    if (y>width-45) {
      vy=-8;
    }
    if (y<0) {
      vy=8;
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

