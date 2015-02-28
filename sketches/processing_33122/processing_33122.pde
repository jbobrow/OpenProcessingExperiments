
float x = 200;
float y= 300;
int object_x_speed= -4;
int object_y_speed= -4;
PImage img;



void setup() {
  size(800,600);
  background(0);
  img = loadImage("img.jpg");
  noStroke();
  smooth();
  frameRate(30);
}

void draw() {
  background(255);
  imageMode(CENTER);
  image(img,x,y); 
  x+=object_x_speed;
  y+=object_y_speed;
  println("X value="+ x);
  println("Y value="+ y);  

  if(x+50 > width || x-50< 0) {
    object_x_speed*=-1;
  }
  
  if(y+50 > height || y-50< 0) {
    object_y_speed*=-1;
  }
  if (20> dist(x,y,mouseX,mouseY)) {
    object_x_speed*=-1;
    object_y_speed*=-1;
  }
}

