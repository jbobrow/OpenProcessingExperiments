
PImage a; 
PImage birds;
PImage teatime;
PImage britishlady;

PFont font1;
PFont font2;

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  a = loadImage("2.png");  
  birds= loadImage("4.png");
  teatime= loadImage("teatime.png");
  britishlady= loadImage("britishlady.png");

  font1 = loadFont("Craig-Regular-48.vlw");
  font2 = loadFont("TypoGardenDemo-250.vlw");

  //background(teatime);
}

void draw() {
  tint(100, 150, 200, 100);
  image(teatime,0,0);

  noTint();
  image(a, 30, 120, a.width/2, a.height/2);
  
frameRate(1);
  tint(150, 50, 200);
  image(birds,10,10,birds.width/4, birds.height/4);

  //tea bubbles
  frameRate(30);
  if ((mouseX < 550) && (mouseX >450) &&(mouseY <470) && (mouseY >400)&& (mousePressed)) {
    fill(random(100,200),random(100,200),random(100,200),200);
    ellipse(550, 420, 20,20);
    fill(random(140,255),random(150),random(42),100);
    ellipse(530, 400, 30,30);
    fill(random(100,200),random(100,200),random(100,200),200);
    ellipse(560,380,10,10);
    fill(random(140,255),random(150),random(42),100);
    ellipse(550, 360, 15, 15);
    fill(random(140,255),random(150),random(42),100);
    ellipse(530,350, 10,10);
    fill(random(180,255),random(200),random(60),200);
    ellipse(560,330,30,30);
    fill(random(140,255),random(150),random(42),150);
    ellipse(550,315,15,15);
    fill(random(140,255),random(150),random(42),100);
    ellipse(535,310,10,10);
    fill(random(140,255),random(150),random(42),200);
    ellipse(540,305,5,5);
  }

  //thought
  if ((mouseX < 470) && (mouseX >250) &&(mouseY <370) && (mouseY >200)&& (mousePressed)) {
    fill(250,210,5,150);
    ellipse(410,190,15,15);
    ellipse(400,200,10,10);
    ellipse(470,150,130,90);
    tint(random(200),random(150),random(200),200);
    image(a, 30, 120, a.width/2, a.height/2);
    fill(124,5,76);
    textFont(font1,35);
    text("tea time!",408,165);
  }

  //garden
  if (keyPressed) {
    if(key=='t') {
      frameRate(2);
      noStroke();
      fill(random(150,255),random(200),random(150));
      textFont(font2,200);
      text("tea time",30,600);
      tint(random(144),random(100),random(200),200);
      image(britishlady,40,130,britishlady.width/2, britishlady.height/2);
    }
  }
}


