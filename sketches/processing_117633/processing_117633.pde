
int myState = 0;
int myCounter = 50;

PImage Antelope;
PImage Arches;
PImage ASGlacier;
PImage Bear;
PImage Canyon;
PImage DevilsTower;
PImage GlacierTent;
PImage OceanBuddies;
PImage PrairieDog;
PImage River;

void setup() {
Antelope = loadImage("Antelope.jpg");
Arches = loadImage("Arches.jpg");
ASGlacier = loadImage("ASGlacier.jpg");
Bear = loadImage("Bear.jpg");
Canyon = loadImage("Canyon.jpg");
DevilsTower = loadImage("DevilsTower.jpg");
GlacierTent = loadImage("GlacierTent.jpg");
OceanBuddies = loadImage("OceanBuddies.jpg");
PrairieDog = loadImage("PrairieDog.jpg");
River = loadImage("River.jpg");
  
  size(500, 500);
  
  noStroke();
}

void draw() {

myCounter = myCounter - 1;
if (myCounter < 0) {
 myState = myState + 1;
if (myState > 8) {
 myState = 0;
} 
myCounter = 300;
}

background(255);

switch(myState) {

  case 0:
  fill(50, 200, 70);
image(ASGlacier, 0, 0);
    break;

  case 1:
    image(PrairieDog, 0, 0);
    break;

  case 2:
    image(Arches, 0, 0);
    break;

  case 3:
image(Antelope, 0, 0);
    break;

  case 4:
image(Bear, 0, 0);
    break;

  case 5:
image(DevilsTower, 0, 0);
    break;

  case 6:
image(Canyon, 0, 0);
    break;

  case 7:
image(GlacierTent, 0, 0);
    break;

  case 7:
image(River, 0, 0);
break;

case 8:
image(OceanBuddies, 0, 0);
    break;
}
}


