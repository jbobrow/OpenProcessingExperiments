
//* @pjs preload="nikko.png"; *
//* @pjs preload="Bone.png"; *
PImage nikko;
PImage bone;
int posX = 800;

void setup() {
  nikko = loadImage("nikko.png");
  bone = loadImage("Bone.png");
  size(1000, 1000);
}

void draw() {
  background(255);
  
  float speed = 5;
  float scale = map(sin(frameCount/speed), -1, 1, 100, 200);

  imageMode(CENTER);
  image(nikko, 500, 400, nikko.width/3, nikko.height/3);
  image(bone, width/2, height/2, bone.width*scale, bone.height*scale);

  image(nikko, 400, 300, nikko.width/2, nikko.height/2);
  image(bone, posX, nikko.height/2 - bone.height);
  posX--;
}



