
//ideas
//This is a sunflower which is getting too much rain, no sunlight.
//Play needs to help the sunflower collect little sun particals
//And eventrally break though the dark clouds covering the sky.
//Player will take countrol of the wind, moving the sunflower
//Sun particals will drop from the sky, as well as rains
//Player will want to collect sun particals, avoid rain drop.
//The sunflower will only be able to move a 2D plant. 
//This game is going to be mult phase
//Each phase has different amount of stuff droping
//Might add thunder as a higher level trap
//Power ups might be there as well
int x = 100;
int z = 0;
PImage[] images = new PImage[4];
void setup() {

  size(500, 500);
  images[0]  = loadImage("1.png");
  images[1]  = loadImage("2.png");
  images[2]  = loadImage("3.png");
}

void draw() {
  background(255);
  image(images[0], x, 200);
  if (keyPressed) {

    if (key == 'a' || key == 'A') {
      x--;
      image(images[1], x, 200);
      z++;
      if (z>=15) {
        image(images[0], x, 200);
      }
      if (z>=20) {
        z=0;
      }
    }

    if (key == 'd' || key == 'D') {
      x++;
      image(images[2], x, 200);
      z++;
      if (z>=15) {
        image(images[0], x, 200);
      }
      if (z>=20) {
        z=0;
      }
    }
  }
}


