

PImage sea;
PImage coral;
PImage fish;

int x = 0;
int y = 150;
int direction = 1;

float angle = 0.0;

void setup() {

  size(700, 700);
  noStroke();
  smooth();

  sea = loadImage("sea.jpg");
  coral = loadImage("coral.png");
  fish = loadImage("fish.png");
}


void draw() {


  float seaX = map(mouseX, 0, width, 0, -20 );
  image(sea, seaX, 0);

  float coralX = map(mouseX, 0, width, -20, -100 );
  image(coral, coralX, 0);

  float fishX = map(mouseX, 0, width, 0, -1200 );
  image(fish, fishX, 0);


  //fish




  x = x + direction;

  if ( x > width ) {
    direction = -1;
  } 
  else if ( x < 0 ) {
    direction = 1;
  }

  if (direction == 1) {
    fill(#495CB9);
    beginShape();
    vertex(x, y);
    vertex(x+10, y+10);
    vertex(x+30, y-10);
    vertex(x+60, y-10);
    vertex(x+70, y);
    vertex(x+70, y+20);
    vertex(x+60, y+30);
    vertex(x+30, y+30);
    vertex(x+10, y+10);
    vertex(x, y+20);
    endShape(CLOSE);

    fill(#FFEE8B);
    beginShape();
    vertex(x+20, y);
    vertex(x+30, y-10);
    vertex(x+60, y-10);
    vertex(x+50, y+10);
    vertex(x+40, y-10);
    vertex(x+30, y+10);
    endShape(CLOSE);
  } 
  else {
    fill(#495CB9);
    beginShape();
    vertex(x, y);
    vertex(x-10, y+10);
    vertex(x-30, y-10);
    vertex(x-60, y-10);
    vertex(x-70, y);
    vertex(x-70, y+20);
    vertex(x-60, y+30);
    vertex(x-30, y+30);
    vertex(x-10, y+10);
    vertex(x, y+20);
    endShape(CLOSE);

    fill(#FFEE8B);
    beginShape();
    vertex(x-20, y);
    vertex(x-30, y-10);
    vertex(x-60, y-10);
    vertex(x-50, y+10);
    vertex(x-40, y-10);
    vertex(x-30, y+10);
    endShape(CLOSE);
  }



  //bubbles

  float xa = random(0, 50);
  float ya = random(0, 100);
  float xp = random(0, 700);


  fill(#FFFFFF, 60);
  ellipse( xp, mouseY, xa, xa);

  fill(#FFFFFF, 30);
  ellipse( xp+xa, xp+mouseY, ya, ya);

  fill(#FFFFFF, 70);
  ellipse( xp-xa, xp-mouseY, xa, xa);


  float circlex = random(30, 300);
  float circley = random(30, 300);

  noFill();
  stroke(#FFFFFF, 30);
  strokeWeight(2);
  ellipseMode(CENTER);
  ellipse( mouseX, mouseY, circlex, circley);




  //seaweed

   if (keyPressed) {
    
    if ((key == 's') || (key == 'S')) {

      pushMatrix();
      translate(width/2, height);
      rotate(angle);
      fill(#91D3A1, 160);
      rect(150, 0, 20, 60);
      rect(100, 0, 20, 30);
      rect(200, 0, 20, 90);
      angle += 0.1;
      popMatrix();
    }
    
    if ((key == 'l' ) || (key == 'L')) {

      //light

      int light1 = round( map(mouseY, 0, height, 000, 700));

      fill(#DCF5FA, 50);
      beginShape();
      vertex(340, -50);
      vertex(light1, 800);
      vertex(light1+200, 800);
      vertex(360, -50);
      endShape(CLOSE);
    }
  }
}


