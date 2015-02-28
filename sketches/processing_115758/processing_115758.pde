
int num_of_sparkles=1000;
float[] sparklesX= new float[num_of_sparkles];
float[] sparklesY = new float[num_of_sparkles];
float[] sparklesQ= new float[num_of_sparkles];
float[] sparklesP = new float[num_of_sparkles];

PImage wand;
PImage voldemort;
PFont harryPotter;
PFont marauder;
float gravity=3;
float air=5;
float sparklecolorgreen=random(210, 255);
int currentclick=0;
float magicSpell=0;
float x=0;
float y=0;
float timer=0;
float d=0;
float r=0;

void setup () {
  size(900, 450);
  noStroke();
  wand = loadImage("wand.png");
  voldemort = loadImage("voldemort.jpg");
  harryPotter = loadFont("harryPotter.vlw");
  marauder = loadFont("marauder.vlw");
  frameRate(30);
  smooth();
}

void draw () {
  background(0);
  println("x: " + mouseX + " y: " + mouseY);
  println(timer);
  fill(255, sparklecolorgreen, 0);
  image(wand, mouseX-60, mouseY-40);
  if (keyCode == '1')
  {
    spellA();
  }
  if (keyCode == '2')
  {
    spellB();
  }
  if (keyCode == '3')
  {
    spellC();
    r += 5;
    timer +=0.1;
    textFont(harryPotter);
    fill(0, 250);
    textSize(160);
    text("Harry Potter", 200, 150);
    textFont(marauder);
    textSize(88);
    text("I solemnly swear I'm up to no good", 30, 375);

    ellipse(120, 225, 18, 10);
    ellipse(105, 225, 7.5, 7.5);
    ellipse(140, 250, 18, 10);
    ellipse(125, 250, 7.5, 7.5);

    ellipse(180, 225, 18, 10);
    ellipse(165, 225, 7.5, 7.5);
    ellipse(200, 250, 18, 10);
    ellipse(185, 250, 7.5, 7.5);

    ellipse(240, 225, 18, 10);
    ellipse(225, 225, 7.5, 7.5);
    ellipse(260, 250, 18, 10);
    ellipse(245, 250, 7.5, 7.5);

    ellipse(300, 225, 18, 10);
    ellipse(285, 225, 7.5, 7.5);
    ellipse(320, 250, 18, 10);
    ellipse(305, 250, 7.5, 7.5);

    ellipse(360, 225, 18, 10);
    ellipse(345, 225, 7.5, 7.5);
    ellipse(380, 250, 18, 10);
    ellipse(365, 250, 7.5, 7.5);

    ellipse(360+60, 225, 18, 10);
    ellipse(345+60, 225, 7.5, 7.5);
    ellipse(380+60, 250, 18, 10);
    ellipse(365+60, 250, 7.5, 7.5);

    ellipse(360+60+60, 225, 18, 10);
    ellipse(345+60+60, 225, 7.5, 7.5);
    ellipse(380+60+60, 250, 18, 10);
    ellipse(365+60+60, 250, 7.5, 7.5);

    ellipse(360+60+60+60, 225, 18, 10);
    ellipse(345+60+60+60, 225, 7.5, 7.5);
    ellipse(380+60+60+60, 250, 18, 10);
    ellipse(365+60+60+60, 250, 7.5, 7.5);

    ellipse(360+60+60+60+60, 225, 18, 10);
    ellipse(345+60+60+60+60, 225, 7.5, 7.5);
    ellipse(380+60+60+60+60, 250, 18, 10);
    ellipse(365+60+60+60+60, 250, 7.5, 7.5);

    ellipse(360+60+60+60+60+60, 225, 18, 10);
    ellipse(345+60+60+60+60+60, 225, 7.5, 7.5);
    ellipse(380+60+60+60+60+60, 250, 18, 10);
    ellipse(365+60+60+60+60+60, 250, 7.5, 7.5);

    ellipse(360+60+60+60+60+60+60, 225, 18, 10);
    ellipse(345+60+60+60+60+60+60, 225, 7.5, 7.5);
    ellipse(380+60+60+60+60+60+60, 250, 18, 10);
    ellipse(365+60+60+60+60+60+60, 250, 7.5, 7.5);

    ellipse(360+60+60+60+60+60+60+60, 225, 18, 10);
    ellipse(345+60+60+60+60+60+60+60, 225, 7.5, 7.5);
    ellipse(380+60+60+60+60+60+60+60, 250, 18, 10);
    ellipse(365+60+60+60+60+60+60+60, 250, 7.5, 7.5);

    ellipse(360+60+60+60+60+60+60+60+60, 225, 18, 10);
    ellipse(345+60+60+60+60+60+60+60+60, 225, 7.5, 7.5);
    ellipse(380+60+60+60+60+60+60+60+60, 250, 18, 10);
    ellipse(365+60+60+60+60+60+60+60+60, 250, 7.5, 7.5);
  }

  if (timer > 36)
  {
    image(voldemort, 0, 0, width, height);
  }
  if (timer > 42)
  {
    background(0, 100, 0);
  }
  if (timer > 42.5)
  {
    background(0);
    exit();
  }
}

void spellA()
{
  magicSpell = 1;
  for (int i=0 ; i<num_of_sparkles ; i++) {
    ellipse(sparklesX[i], sparklesY[i], random(1, 5), random(1, 5));
    sparklesY[i]+=gravity;
  }
  if (mousePressed == true)
  {
    sparklesX[currentclick]=mouseX-60;
    sparklesY[currentclick]=mouseY-40;
    currentclick+=1;
    if (currentclick==num_of_sparkles) {
      currentclick=0;
    }
  }
}

void spellB()
{
  magicSpell = 2;
  fill(220, 80);
  x = random(-10, 10);
  y = random(-20, 20);
  for (int o=0 ; o<num_of_sparkles ; o++) {
    ellipse(sparklesQ[o], sparklesP[o], 15 + x, 15 + x);
    sparklesP[o]-=air;
    sparklesQ[o]+=y;
  }
  if (mousePressed == true)
  {
    sparklesQ[currentclick]=mouseX-60;
    sparklesP[currentclick]=mouseY-40;
    currentclick+=1;
    if (currentclick==num_of_sparkles) {
      currentclick=0;
    }
  }
}

void spellC()
{
  magicSpell=3;
  if (mousePressed == true)
  {
    fill(255, 200);
    ellipse(mouseX-60, mouseY-40, random(130, 140), random(130, 140));
  }
}

void mouseDragged() {
  if (magicSpell == 1)
  {
    sparklesX[currentclick]=mouseX-60;
    sparklesY[currentclick]=mouseY-40;
    currentclick+=1;
    if (currentclick==num_of_sparkles) {
      currentclick=0;
    }
  }
  if (magicSpell == 2)
  {
    sparklesQ[currentclick]=mouseX-60;
    sparklesP[currentclick]=mouseY-40;
    currentclick+=1;
    if (currentclick==num_of_sparkles) {
      currentclick=0;
    }
  }
  if (magicSpell == 3)
  {
    fill(255, 10);
    ellipse(mouseX-60, mouseY-40, random(130, 170), random(130, 170));
  }
}


