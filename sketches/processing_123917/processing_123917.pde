
PImage photo;
int counter = 0;

void setup() {
  size(740, 184);
  smooth();
  background(255);
  photo = loadImage("inmsLogo.png");
}

void draw() {
  background(255);

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
  } else if (mouseX < 200) {
      translate(100, height/2);
      rotate(counter*TWO_PI/360);
      translate(0, 0);
      filter(BLUR, .2);
      imageMode(CENTER);
      image(photo, 0, 0);
    }
  }




