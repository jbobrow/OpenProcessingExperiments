
//font name YDSSH-20
int card = 0;
PFont f;
PImage a, img1, img2, img3, img4, img5, img6, img7;
PShape shp;

void setup() {
  size(450,300);
  background(255);
  smooth();
  f = loadFont("YDSSH-20.vlw");
  a = loadImage("start.jpg");
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5_2.png");
  img6 = loadImage("7.jpg");
  img7 = loadImage("8.png");
  shp = loadShape("5.svg");
  textFont(f);
}

void draw() {
  if (card == 0) {
    image(a,0,0,450,300);
    text("start",390,290);
    text("Dream of Cup",160,210);
    
  }


  else if (card == 1) {
    image(img1,0,0,450,300);
    strokeWeight(2);
    fill(255);
    ellipse(60,150,90,90);
    ellipse(120,280,60,40);
    ellipse(380,200,75,75);
    line(160,101,190,230);
    line(312,140,285,270);
  }
  else if (card == 2) {
    image(img2,0,0);
    strokeWeight(2);
    stroke(0);
    ellipseMode(CENTER);
    ellipse(369,130,60,75);
    ellipse(250,75,50,50);
    ellipse(320,200,90,90);
    line(350,50,397,160);
    line(320,75,296,220);

    strokeWeight(3);
    line(400,0,400,260);
    line(0,200,400,260);
    text("OMG!! They crushed!",250,290);
  }
  else if (card == 3) {
    background(255);
    image(img3,0,0);
    strokeWeight(2);
    ellipseMode(CENTER);
    pushMatrix();
    cup(130,0,1);
    popMatrix();
    fill(0);
    textSize(30);
    text("A Brand new cup!",300,200,150,100);
  }
  else if (card == 4) {
    background(255);
    smooth();
    image(img4,-25,-30);
    stroke(255);
    pushMatrix();
    fill(201,255,247);
    frameRate(2.5);
    ellipse(random(450),random(100,300),10,10);
    ellipse(random(450),random(100,300),20,20);
    ellipse(random(450),random(100,300),45,45);
    ellipse(random(450),random(100,300),40,40);
    ellipse(random(450),random(100,300),50,50);
    ellipse(random(450),random(100,300),30,30);
    ellipse(random(450),random(100,300),15,15);
    ellipse(random(450),random(100,300),80,80);
    ellipse(random(450),random(100,300),25,25);
    ellipse(random(450),random(100,300),60,60);
    ellipse(random(450),random(100,300),62,62);
    popMatrix();
    stroke(0);
    cup(150,50,0.7);
    fill(0);
    text("the cup met water drop",255,290,200,100);
  }
  else if (card == 5) {
    background(255);
    pushMatrix();
    cup(150,50,0.7);
    popMatrix();
    circle(0,-120);
  }
  else if (card == 6) {
    image(img5,0,0);
    shape(shp,170,59);
    pushMatrix();
    rotate(PI/5.0);
    noFill();
    cup(250,0,0.5);
    popMatrix();
    fill(183,255,251);
    stroke(165,227,255);
    ellipse(200,50,50,60);
    ellipse(160,80,30,30);
    ellipse(300,100,70,67);
    ellipse(240,150,20,20);
    ellipse(180,120,30,50);
    ellipse(250,40,40,40);
    ellipse(340,60,35,35);
    ellipse(330,150,30,32);
    fill(255);
    textSize(20);
    text("the cup go up in the air",310,260,130,100);
  }
  else if (card == 7) {
    image(img6,0,0);
    pushMatrix();
    stroke(0);
    rotate(PI/-3.0);
    cup(-45,170,1);
    popMatrix();
    image(img7,0,0);
    stroke(255);
    strokeWeight(2);
    line(350,250,370,290);
    line(9,245,19,260);
    line(25,230,50,280);
    line(40,240,60,279);
    line(64,260,80,298);
    line(79,236,90,280);
    line(110,220,125,280);
    line(150,226,175,290);
    line(190,250,208,282);
    line(223,205,240,260);
    line(250,205,270,290);
    line(287,220,300,275);
    line(323,268,340,289);
    line(390,240,420,285);
  }
}
void mousePressed() {
  if (card == 0) {
    card = 1;
  }
  else if (card == 1) {
    card = 2;
  }
  else if (card == 2) {
    card = 3;
  }
  else if (card == 3) {
    card = 4;
  }
  else if (card == 4) {
    card = 5;
  }
  else if (card == 5) {
    card = 6;
  }
  else if (card == 6) {
    card = 7;
  }
  else if (card == 7) {
    card = 0;
  }
}



void cup(int x, int y, float s) {
  translate(x,y);
  scale(s);
  stroke(1);
  noFill();
  ellipseMode(CENTER);
  ellipse(95,60,150,50);
  ellipse(95,60,142,42);
  arc(95,250,80,50,0,PI);
  line(20,60,55,250);
  line(170,60,135,250);
}


void circle(int xx, int yy) {
  translate(xx,yy);
  noStroke();
  fill(201,255,247);
  ellipse(300,300,100,100);
  ellipse(280,380,20,20);
  ellipse(100,100,40,40);
  ellipse(140,400,70,70);
  ellipse(340,330,50,50);
  ellipse(400,360,30,30);
  ellipse(104,301,30,30);
  ellipse(345,234,30,30);
  ellipse(359,239,20,20);
  ellipse(200,321,70,70);
  ellipse(33,350,40,40);
  ellipse(59,350,40,40);
  ellipse(150,300,80,80);
  ellipse(0,460,40,40);
  ellipse(200,450,60,60);
  ellipse(300,450,20,20);
  ellipse(200,240,50,50);
  ellipse(130,230,60,60);
  ellipse(350,150,60,60);
  ellipse(40,320,60,60);
  ellipse(20,40,40,40);
  ellipse(340,460,50,50);
  ellipse(340,450,70,70);
  ellipse(50,230,45,45);
  ellipse(190,50,40,40);
  ellipse(200,320,60,60);
  ellipse(610,150,50,50);
  ellipse(400,270,100,100);
  ellipse(156,153,70,70);
}


