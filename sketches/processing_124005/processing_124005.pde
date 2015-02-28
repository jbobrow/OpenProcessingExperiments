
PImage photo;
int counter = 0;
PFont helvetica;
float grow = 20;

void setup() {
  size(740, 184);
  smooth();
  background(255);
  photo = loadImage("inmsLogo.png");
  helvetica = loadFont("HelveticaNeue-Bold-20.vlw");
}

void draw() {
  background(255);
  imageMode(CENTER);
  image(photo, 100, height/2);

  // COUNTER for Rotation
  if (counter < 360) {
    counter=counter + 1;
  } 
  else {
    counter = 0;
  } //println(counter);

  //ROTATION OF INMS LOG0
  if (mouseX > 200) {
    imageMode(CENTER);
    image(photo, 100, height/2);
  } 
  else if (mouseX < 200) {
    pushMatrix();
    translate(100, height/2);
    rotate(counter*TWO_PI/mouseX);
    translate(0, 0);
    filter(BLUR, .2);
    imageMode(CENTER);
    image(photo, 0, 0);
    popMatrix();
  }
  fill(0);
  textFont(helvetica);
  if (mouseY > height/2 - 20 && mouseY < height/2 + 10 && mouseX > 225 && mouseX < 690) {
    grow = random(20, 23);
    fill(random(255),random(255),random(255));
  }
  else { 
    grow = 20;
    fill(0);
  }
  textSize(grow);
  textAlign(CENTER);
  text("INFO-I 310 MULTIMEDIA ARTS & TECHNOLOGY", width/2+88, height/2);
  
}



