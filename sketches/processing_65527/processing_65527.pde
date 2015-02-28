
PImage beginhorse;
PImage ideahorseface;
PImage endhorse;
PImage lightbulb;
PImage beginunicorn;
PImage endunicorn;

 
void setup() {
  size(600, 400);
  smooth();
  
endhorse = loadImage("endhorse.png");
beginhorse = loadImage("beginhorse.png");
beginunicorn = loadImage("beginunicorn.png");
ideahorseface = loadImage("ideahorseface.png");
endunicorn = loadImage("endunicorn.png");
lightbulb = loadImage("lightbulb.png");

  
  frameRate(1);
  imageMode(CENTER);
}
 
void draw() {
  background(0);

  float x = random(width);
  float y = random(height);
  float h_1 = random(400, 500);
  float h_2 = random(250, 500);
  float li = random(0, 600);
  float li2 = random(0,100);
  float u_1 = random(-100, 300);
  float u_2 = random(-100, 400);
  float d = random(100, 300);
  float eh_1 = random(0, 550);
  float eh_2 = random(180, 400);
  float idea1 = random(300, 600);
  float idea2 = random(0, 400);


    
    image(endhorse, h_1, h_2);
    image(beginhorse, eh_1, eh_2, d,d);
    image(lightbulb, eh_1, eh_2-200, d/2, d/2);
    image(ideahorseface, idea1, idea2, d+100, d+100);
    image(beginunicorn, x, y, d, d);
}

