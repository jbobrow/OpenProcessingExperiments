
PImage sky;
PImage [] bird;
int frame = 0;
int direction = -1;
int x = 250;
int y = 250;
int speed = 20;
float rot = 0;
float desiredRot = 0;
/*boolean directionH = false; boolean directionV = false; boolean stall = false;
float movement;*/

void setup() {
  size (500, 500);
  bird = new PImage[4];
  for(int i = 0; i<bird.length; i++)
    bird[i] = loadImage("bigbird"+ i +".jpg");
  sky = loadImage("Cumulus_clouds_in_fair_weather.jpg");
}

void draw(){
  
  if (frame > 3) frame = 0;
    
  rot += (desiredRot-rot)*0.1;
  
  //movement = random(3000);
  image(sky,0,0,500,500);
  
  pushMatrix();
  translate(x, y);
  rotate(rot);
image(bird[frame], -38, -30, 100, 100);
  popMatrix();
  
  /*if (movement < 501) directionH = false;
  if (movement > 500 && movement < 1001) directionH = true;
  if (movement > 1000 && movement <1501) directionV = true;
  if (movement > 1500 && movement < 2001) directionV = false;
  if (movement > 1500) stall = false;
  if (stall == false) {
  image(bird[frame], x-50,y-50,100,100);
  } else if (directionH == false) {
    image(birl[frame],x-50,y-50,100,100);
    x-=20;
  } else if (directionH == true) {
    image(birr[frame],x,y,100,100);
    x+=20;
  } else if (directionV == true) {
    image(biru[frame],x-50,y-50,100,100);
    y-=20;
  }
  if (directionV == false) y+=20;*/
  if (mousePressed && mouseButton == LEFT) {
    frame++;
    speed = 5*direction;
  } else {
    speed = 1*direction;
  }
  y+=speed;
  if (y<=0) direction*=-1;
  if (y>=height-50) direction*=-1;
  }

