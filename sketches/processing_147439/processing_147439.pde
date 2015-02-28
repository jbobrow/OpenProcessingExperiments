
float bananna = 0;
int slow = 0;
int bob = 0;
int X2 = 0;
PImage picture;
PImage spriteSheet;
PImage[] sprite = new PImage[6];
PImage planet;

void setup(){
   size(720,720);
   picture=loadImage("background.png");
   spriteSheet = loadImage("SpriteSheet.png");
   planet = loadImage("planet.png");
   for(int i = 0; i < 6; i++)
   {
     sprite[i] = spriteSheet.get(i*90, 0, 80, 88);
   }
}

void draw(){
  image(picture,0,0);
  slow++;
  if(slow > 3)
    slow = 0;
     image(sprite[bob], 320, 500);
     if(slow == 3)
     bob++;
     if(bob > 5)
       bob = 0;
        bananna +=-.03;
  translate(355, 750);
  rotate(bananna);
  image(planet, -265, -185);
}


