
    /* @pjs preload= "sea.jpg"; */
    
void setup() {

  size(700, 700);
  noStroke();

  PImage img;
    img = loadImage("sea.jpg");
    image(img, 0, 0);

  int x = random(50,300);
  int y = random(30,100);
  int xp = random(0, 700);

  //bubbles

  fill(#FFFFFF, 100);
  ellipse( xp, xp, x, x);

  fill(#FFFFFF, 100);
  ellipse( xp+x, xp+x, y, y);

  fill(#FFFFFF, 80);
  ellipse( xp-x, xp-x, x, x);

 

}

void draw() {
    
int x = random(30, 500);
int y = random(30, 500);
int z = random(00, 700);

noFill();
stroke(#FFFFFF, 30);
strokeWeight(2);
ellipseMode(CENTER);
ellipse( 350, 350, x, y);

noFill();
stroke(#FFFFFF, 30);
strokeWeight(2);
bezier(0,z,0,z,56,z,213,z);
bezier(213,z,369,z,416,z,512,z);
bezier(512,z,634,z,700,z,700,z);


}




