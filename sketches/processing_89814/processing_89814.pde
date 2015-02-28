
PImage unicorn;
PImage rabbit1;
PImage horse;

void setup(){
  size(500, 500);
  unicorn= loadImage("unicorn.png");
  rabbit1= loadImage("rabbit1.png");
  horse= loadImage("horse.png");
  
  frameRate(random(5));
  imageMode(CENTER);
}

void draw(){
  background(0);
  float x= random (10, 200); // setting the range
  float y= random (300, 400);
  float z= random (230, 350);
  
  image(unicorn, x, z, 200, 200);
  image(rabbit1, z, x, 400, 400);
  image(horse, z, y, 300, 300);
 
  
  
  }



