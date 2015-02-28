
wuermer[] balls;

//Messvariablen
float wDirection = 360;
float wSpeed = 2;
float fadeTime = 3;
color bg =color(0);


void setup() {
  size(700, 450);
  background(bg);
  noStroke();
  smooth();
  frameRate(40);

  // kreieren von wuermer in vielen Mengen
  balls = new wuermer[300];
  for (int i=0;i<balls.length;i++) {
    balls[i]= new wuermer(width/2, height/2, random(wDirection), wSpeed);
  }
}
void draw() {
  fill(bg, fadeTime);//nach einer bestimmten Zeit werden wuermer "gelöscht"
  rect(0, 0, width, height); // zeigt die Grösse an von der Fläche, die gelöscht werden soll.


  for (int i=0;i<balls.length;i++) {
    balls[i].update();
    balls[i].display();
  }

}


void neu() {
  // neue X-, Y-Position für wuermer
  for (int i=0;i<balls.length;i++) {
    balls[i].setPos(mouseX, mouseY);
  }
}

void mouseClicked() {
  neu();
}
// Gross oder klein w macht den Hintergrund Weiss (White).
// Gross oder klein b macht den Hintergrund Schwarz (Black).
// Gross oder klein r malt den Hintergrund zufällig.
void keyPressed() {
  if (key == 'w' || key == 'W') {
    bg = color(255, 255, 255);
    background(bg);
  }
  else if(key == 'b' || key == 'B'){
    bg = color(0);
    background(bg);
  }
  else if(key == 'r' || key == 'R'){
    bg = color(random(255),random(255),random(255));
    background(bg);
  }

}

class wuermer {
  float xpos, ypos;
  color farbe;
  float direction;
  float flood;
  float speed;

  wuermer(float myX, float myY, float myDirection, float mySpeed) {
    xpos = myX;
    ypos = myY;
    speed = mySpeed;
    direction = random(myDirection);
    farbe =  color(random(255), random(255), random(255));
  }
  void update() {

    flood = random(-2, 2);
    xpos += (cos( radians( direction ) ) * speed)+flood;
    ypos += (sin( radians( direction ) ) * speed)+flood;

    if (xpos>width || xpos < 0 || ypos > height || ypos < 0) {
      speed = speed*-1;
      direction = random(360);
      farbe =  color(random(255), random(255), random(255));
    }
  }
  void display() {
    fill(farbe);
    ellipse(xpos, ypos, 2, 2);
  }
  void setPos(float xp, float yp) {
    xpos = xp;
    ypos = yp;
  }
}
