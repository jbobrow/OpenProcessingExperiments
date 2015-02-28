
Circle[] circles = new Circle [12];

PImage woman;
PImage sky;
PFont font;
float womanTint = .1;

Timer timer;

int state;

float gravity = random(0.1, 0.3);

MinuteHand minuteHand = new MinuteHand();

void setup() {
  size(500, 600);
  smooth();
  frameRate(30);

  imageMode(CENTER);
  font = loadFont("KodchiangUPC-50.vlw");
  woman = loadImage("woman.png");
  sky = loadImage("sky.jpg");

  timer = new Timer (7850);

  circles[0] = new Circle (250, 60, 255, 255, 0, 100);
  circles[1] = new Circle (340, 90, 255, 196, 0, 100);
  circles[2] = new Circle (410, 160, 255, 166, 0, 100);
  circles[3] = new Circle (440, 250, 250, 100, 0, 100);
  circles[4] = new Circle (410, 340, 255, 0, 0, 100);
  circles[5] = new Circle (340, 410, 255, 0, 98, 100);
  circles[6] = new Circle (250, 440, 222, 0, 222, 100);
  circles[7] = new Circle (160, 410, 133, 2, 222, 100);
  circles[8] = new Circle (90, 340, 0, 0, 255, 100);
  circles[9] = new Circle (60, 250, 0, 222, 222, 100);
  circles[10] = new Circle (90, 160, 0, 255, 0, 100);
  circles[11] = new Circle (160, 90, 169, 222, 0, 100);
}

void draw() {  
  
  background(0);
  tint(255,255,255,100);
  image(sky,250,250);

  fill(20);
  rect(0,500,500,100);

  stroke(255);
  strokeWeight(1);
  line(0,500,500,500);
  strokeWeight(2);
  
  fill(255);
  textAlign(CENTER);
  textSize(24);

  if (state == 0) {
    textFont(font, 60);
    text("CORRESPONDANCES", 250, 562);
  }

  else if (state == 1) {
    for (int i = 1; i < circles.length -10; i++){
    circles[i].bounce();
    text("I was once sent to a researcher in light therapy because", 250, 535);
    text("I had a sudden depression no one could explain.", 250,550);
    text("My doctor was trying to determine if light therapy would help.", 250,575);
    }
  }
  else if (state == 2) {
    for (int i = 1; i < circles.length -9; i++){
    circles[i].bounce();
    text("He attached a computer to my wrist which I wore for", 250, 535);
    text("3 days and 3 nights.", 250,550);
    text(" It measured my Circadian rhythms.", 250,575);
    }
  }

  else if (state == 3) {
    for (int i = 1; i < circles.length -8; i++){
    circles[i].bounce();
    text("After reviewing the results, he concluded that", 250, 525);
    text("light would do me no good.", 250, 540);
    text("\"The problem\", he explained,", 250,565);
    text("\"is that you have the Circadian clock of a cavewoman.\"", 250,580);
    }
  }

  else if (state == 4) {
    for (int i = 1; i < circles.length -7; i++){
    circles[i].bounce();
    text("Not knowing if this was good or bad,", 250, 525);
    text("I naturally asked him to explain.", 250, 540);
    text("He told me that I have a 26.5 hour day and that aside from that,", 250,565);
    text("I am impervious to my environment.", 250,580);
    }
  }

  else if (state == 5) {
    for (int i = 1; i < circles.length -6; i++){
    circles[i].bounce();
    text("So, tonight I had a revelation:", 250, 525);
    text("if synesthesia stems from the oldest part of the brain,", 250, 540);
    text("doesn't it make sense that it would", 250,565);
    text("show up in the mind of a cavewoman?", 250,580);
    }
  }

  else if (state == 6) {
    for (int i = 1; i < circles.length -5; i++){
    circles[i].bounce();
    text("Further, if it is also true that in evolutionary terms,", 250, 525);
    text("synesthetes represent the future,", 250,540);
    text("doesn't that make sense too,", 250,565);
    text("since time is circular?", 250, 580);
    }
  }

  else if (state == 7) {
    for (int i = 1; i < circles.length -4; i++){
    circles[i].bounce();
    text("He was wrong about light, by the way.", 250, 535);
    text("As it turned out, I used reflected light to cure my depression.", 250,565);
    }
  }

  else if (state == 8) {
    for (int i = 1; i < circles.length -3; i++){
    circles[i].bounce();
    text("I discovered that by looking at reflections,", 250, 535);
    text("I could travel out of my feelings.", 250,565);
    }
  }

  else if (state == 9) {
    for (int i = 1; i < circles.length -2; i++){
    circles[i].bounce();
    text("Of course,", 250, 535);
    text("I didn't realize that I wasn't actually going anywhere.", 250,565);
    }
  }

  else if (state == 10) {
    for (int i = 1; i < circles.length -1; i++){
    circles[i].bounce();
    text("Nor could I see that my emotional life was", 250, 535);
    text("the underside of a Mobius Strip I'd managed to flip over,", 250,550);
    text("by viewing the world upside down.", 250, 580);
    }
  }

  else if (state == 11) {
    for (int i = 1; i < circles.length; i++){
    circles[i].bounce();
    text("From that angle, I could spot the necessary shapes", 250, 535);
    text("into which I poured my inchoate feelings.", 250,570);
    }
  }

  else if (state == 12) {
    for (int i = 0; i < circles.length; i++){
    circles[i].bounce();
    text("And by the time I developed the pictures,", 250, 535);
    text("the emotional shapes had gelled.", 250,570);
    }
  }
  
  else {
    minuteHand.stop();
    
    for (int i = 0; i < circles.length; i++){
      circles[i].helium();
    }
    
    for (int i = 0; i < circles.length; i++){
    circles[i].y += random (-1, -3);
    }

    for (int i = 0; i < circles.length; i++){
    circles[i].x += 1*circles[i].speed;
    }

    womanTint += .9;
    tint(255, 255, 255, womanTint);
    image(woman, 180, 500*.82);

    strokeWeight(1);
    stroke(255, 255, 255, womanTint);
    line(250, 250, 233, 500*.67);
    line(250, 250, 231, 500*.68);
    line(250, 250, 232, 500*.65);
    line(231, 500*.68, 205, 500*.82);
    line(233, 500*.67, 205, 500*.82);
    line(232, 500*.65, 205, 500*.82);
  }

  if (timer.isFinished()) {
    state++;
    timer.start();
  }

  minuteHand.display();
  minuteHand.update();

  resetMatrix();

  for (int i = 0; i < circles.length; i++){
    circles[i].display();
    }
}



