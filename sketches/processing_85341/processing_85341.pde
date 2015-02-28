
Spider s;
Spider s2;
//Spider spiders[] = new Spider[10];

Drop[] drops = new Drop[5];

void setup() {
  size(500, 500); 
  smooth();

  s = new Spider(60, 0, 20, 1, true); 
  //s2 = new Spider(width - 50, 0, 20, 1);

  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }

  //for ( int i = 0; i < spiders.length; i++) {
  //spiders[i] = new Spider(int(random(width)), int(random(-200, 0)), 10, 2, false);
  //}
}

// draw
void draw() {

  background(#ED4102);
  if (mousePressed == true) {
    background(#1B4A83);
  }
  // draws the face
  draw_face();

  // spider comes down from the ceiling 
  s.update();
  s.render();
  //s2.update();
  //s2.render();
  //for ( int i = 0; i < spiders.length; i++) {
  //spiders[i].update();
  //spiders[i].render();
  //}

  // coldsweat drops come down from forehead
  if (mousePressed == true) {
    for (int i = 0; i < drops.length; i++) {
      drops[i].render();
      drops[i].update();
    }
  }
}

void draw_face() {
  // head 
  stroke(0); //black
  fill(#F2CD90); //neutral skin tone
  ellipse(250, 250, 300, 400);
  if (mousePressed == true) {
    fill(#8E8D90);
    ellipse(250, 250, 300, 400);
  }

  // left eye 

  noStroke();
  ellipseMode(CENTER);

  if ( s.is_spider_stopped == false) {
    fill(#484848); //gray eye 
    ellipse(200, 200, 20, 20);
    fill(#095A81); //blue eye center
    ellipse(200, 200, 7, 7);
  } 
  else {
    fill(#484848); //gray eye 
    ellipse(197, 203, 16, 16);
    fill(#095A81); //blue eye center
    ellipse(197, 203, 7, 7);
  }
  // left eyelid
  stroke(0);
  noFill();
  ellipse(200, 200, 40, 20);
  // left eyelash
  line(200, 180, 200, 190);
  line(180, 180, 190, 190);
  line(220, 180, 210, 190);

  // right eye 

  noStroke();
  ellipseMode(CENTER);
  if ( s.is_spider_stopped == false) {
    fill(#484848);
    ellipse(300, 200, 20, 20);
    fill(#095A81);
    ellipse(300, 200, 7, 7);
  } 
  else {
    fill(#484848);
    ellipse(297, 203, 16, 16);
    fill(#095A81);
    ellipse(297, 203, 7, 7);
  }
  // right eyelid
  stroke(0);
  noFill();
  ellipse(300, 200, 40, 20);
  // right eyelash
  line(300, 180, 300, 190);
  line(280, 180, 290, 190);
  line(320, 180, 310, 190);

  // right eyebrow
  if (mousePressed == true) {
    stroke(0);
    noFill();
    line(268, 180, 290, 180);
    line(290, 180, 320, 170);
  }


  // cheeks
  fill(#FC978C); //pinkish
  noStroke();
  ellipseMode(CENTER);
  ellipse(170, 325, 40, 40);
  ellipse(330, 325, 40, 40);
  if (mousePressed == true) {
    fill(#8E8D90);
    stroke(#8E8D90);
    ellipseMode(CENTER);
    ellipse(170, 325, 40, 40);
    ellipse(330, 325, 40, 40);
  }

  // mouth 
  stroke(255, 0, 0); //red
  curve(200, 350, 240, 360, 260, 360, 270, 350);
  if (mousePressed == true) {
    stroke(0); 
    fill(#656467);
    ellipseMode(CENTER);
    ellipse(245, 350, 50, 70);
  }

  // nose 
  stroke(0);
  noFill();
  line(250, 200, 230, 300);
  line(230, 300, 250, 300);

  // hair
  fill(0);
  noStroke();
  quad(180, 0, 100, 180, 180, 160, 210, 0);
  quad(200, 0, 190, 160, 260, 160, 250, 0);
  quad(240, 0, 270, 160, 340, 170, 320, 0);
  quad(300, 0, 350, 170, 400, 200, 380, 0);
}

class Drop {

  float x, y;
  float speed;
  int r; // drop radius

  Drop() {
    r = 5; 
    x = random(100, 400);
    y = random(170, height);
    speed = random(1, 5);
  }

  void render() {
    fill(255);
    noStroke();

 // drop shape/size
    for (int i = 0; i < r; i++) {
      ellipse(x, y+i*4, i*2, i*2);
    }
  }
  
  // cold sweat comes down from forehead and repeat
  void update() {
    y += speed;
    if (y > height) {
      y = 170;
    }
  }
}

// A class to describe a Spider shape

class Spider {

  //PShape s, web, body, leftleg1, leftleg2, leftleg3, leftleg4, rightleg1, rightleg2, rightleg3, rightleg4;
  //PFont ackbar;

  int x, y, circle_diam;
  int speed;
  boolean is_spider_stopped = false;
  boolean display_text;

  // this is your constructor. they are important and unique to classes.
  // they are used only at the moment of instantiation
  Spider(int _x, int _y, int _circle_diam, int _speed, boolean _display_text) {
    x = _x;
    y = _y;
    circle_diam = _circle_diam;
    speed = _speed;
    display_text = _display_text;
  }

  void update() {
    // Demonstrating some simple motion
    if (y <= height/2) {
      y = y + speed;
    }

    if (mousePressed == true) {
      y = y - speed * 2;
      y += int(random(-10, 10));
      y = constrain(y, 150, 249);
    }

    if (y >= height/2) {
      is_spider_stopped = true;
    }
    else {
      is_spider_stopped = false;
    }
  }

  void render() {
    // draw the spider and the web
    render_spider();

    // if the spider is stopped: y >= height/2
    if ( display_text == true) {
      if ( is_spider_stopped == true ) {
        // draw the text
        render_text();
      }
    }
  }

  void render_spider() {
    // Locating and drawing the shape

    fill(0);
    stroke(0);

    // Here, we are hardcoding a series of vertices

    // web
    stroke(255); //  white line
    line(x, 0, x, y);

    // spider body
    fill(0);
    noStroke();
    ellipse( x, y, circle_diam, circle_diam);
    // spider legs
    stroke(0);
    noFill();
    // right leg 1
    beginShape();
    vertex( x, y );
    vertex( x+30, y-20 );
    vertex( x+50, y-5 );
    endShape();
    // right leg 2
    beginShape();
    vertex( x, y );
    vertex( x+30, y-5 );
    vertex( x+55, y+15 );
    endShape();
    // left leg 1
    beginShape();
    vertex( x, y );
    vertex( x-30, y-20 );
    vertex( x-50, y-5 );
    endShape();
    // left leg 2
    beginShape();
    vertex( x, y );
    vertex( x-30, y-5 );
    vertex( x-50, y+15 );
    endShape();
  }
  
  void render_text() {
    textSize(18);
    textAlign(CENTER);
    //ackbar = loadFont("Ackbar-18.vlw");
    //textFont(ackbar);
    fill(255);
    text("Press", x, y + 50);
    text("Here", x, y + 65);
    text("Please", x, y + 80);
  }
}
