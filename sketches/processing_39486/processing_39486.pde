
PFont myFont;
PImage cloud;
PImage waterinverse;
PImage fish;
PImage water;

int water_y=-800;
int fish_x=800;

void setup() {
  size(800, 800);
  String[] fontList = PFont.list();
  println(fontList);
  textFont(createFont("Lucida Sans Oblique", 10));

  water=loadImage("water.png");
  waterinverse=loadImage("waterinverse.png");
  cloud=loadImage("bg.png");
  fish=loadImage("fish.png");
  frameRate(10);
}

void draw () {

  if (water_y<200)
  { 
    translate(800, 200);
    rotate(HALF_PI);
    background(cloud);
    for (int i=0; i<width; i=i+1)
    {
      fill(random(0, 256));
      text("rain", i, random(100, 700) );
      textSize(10);
    }
    translate(800, 0);
    rotate(PI/2);
    water_y+=25;
    image(water, 0, water_y);
  }
  else
  { 
    background(waterinverse);
    fish_x-=30;
    image(fish, fish_x, 300);
    fill(0);
    textSize(20);
    text("END", fish_x+140, 370);
    if (fish_x<0)
    {
      water_y=-800;
      fish_x=800;
    }
  }
}


