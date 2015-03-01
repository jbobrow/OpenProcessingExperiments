
Rain r1;
PImage img;
int numDrops = 40;
Rain[] drops = new Rain[numDrops]; // Declare and create the array

void setup() {
  size(600,600, P2D);
  background(255);
  smooth();
  noStroke();
  //Loop through array to create each object
  for (int i = 0; i < drops.length; i++) {

    drops[i] = new Rain(); // Create each object
    r1 = new Rain();
  }
  // Images must be in the "data" directory to load correctly
  img = loadImage("cloud_PNG2.png");

}

void draw(){
  fill(255,80);
  rect(0,0,600,600);
  //Loop through array to use objects.
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }
  imageMode(CENTER);
  image(img, mouseX, mouseY);

}



class Rain {
  float x = -10;//random(mouseX-150, mouseX+150);
  float y = random(height-100);

  void fall() {
    y = y + 7;
    fill(0,10,200,180);
    ellipse(x, y, 10, 10);

    if(y>height){
      x = random(mouseX-150, mouseX+150);
      y = random(mouseY-50,  mouseY+90);
    }
  }
}



