
//Code By Jake Gevalt

PImage mushroom;
PImage rock;
PImage obsidian;
PImage dragonfly;

int x;
int counter = 0;


void setup(){

  size (600,600);
  background (0);
  
mushroom = loadImage("mushroom.jpg");
rock = loadImage("rock.jpg");
obsidian = loadImage("obsidian.jpg");
dragonfly = loadImage("dragonfly.jpg");
x = 2;

}
void draw(){
  // Tint blue and set transparency
tint(120,100, 150, 60); 
 image(mushroom, 0, 0);
tint(150,200,150, 60);
image(rock,0,0);

tint (200,200,200,20);
image(obsidian, 0,0);

tint (255,225,255,10);
image(dragonfly,0,0);


fill (255,255,255,10);
ellipse (300,300, x, x);

frameRate = 2;

  x = round(x * random(1.05, 1.5));
}

void mousePressed() {
  x = 2;
 
}

void keyPressed(){
  save("circles"+counter+".jpg"); 
  key = ENTER;
    counter = (counter + 1);
}

