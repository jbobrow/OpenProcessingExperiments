
PImage unicorn;
PImage rabbit1;
PImage horse;
PImage back;
 
void setup(){
  size(500, 500);
  unicorn= loadImage("frame-0000.png");
  rabbit1= loadImage("sci-arc-2.png");
  horse= loadImage("guy.png");
  back= loadImage("wood.png");
  frameRate(random(4));
  imageMode(CENTER);
}
 
void draw(){
  background(255);
  float x= random (10, 200); // setting the range
  float y= random (300, 400);
  float z= random (230, 350);
  image(back, y,x,400,598);
  image(unicorn, x, z, 100, 136);
  image(rabbit1, z, x, 100, 126);
  image(horse, z, y, 100, 158);

  noFill();
  strokeWeight(5);
  rect(x,z, 200,random(180));
   noFill();
  strokeWeight(5);
  rect(x-30,y, 500,random(180));
  
   
   
  }



