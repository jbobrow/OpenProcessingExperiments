
PImage img;
//PImage photo;
float speed = 2.0;
float move;

void setup() {  
  size(400, 400);
  photo=loadImage("http://ganduri.info/wp-content/uploads/2013/10/Minions-19.png");
img=loadImage("http://asi-roads.com/media/img/road.png");

}

void draw() {  
background(0,255);
 //  background(img);
//draw function loops 
  move=move+speed;
  
  image(img,0,0,400,400);
  image(photo,10,10,move,move,279,300);
  if (move > 400) {
  move=0;
 }
  
}
