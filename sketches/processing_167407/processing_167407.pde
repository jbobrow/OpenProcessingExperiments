
PImage img;
float angle;
float jitter;
PImage img2;
PImage img3;
color c = color(0);
float x = 0;
float y = 100;
float speed = 3;
PImage img4;

void setup() {
  imageMode(CENTER);
  size(800,600);
  img = loadImage("Granite_Yosemite_P1160483.jpg");
  img2 = loadImage("rock.gif");
  img3 = loadImage("rocky copy.jpg");
  img4 = loadImage("you.jpg");
}
  void display() {
  image(img4,x,500);
}
// ok
void draw() {

  
 
  background(51);
  image(img2,0,0);
    image(img,0, 0,width/0.5, height/0.5);
    move();
    display();



  
  if (mousePressed) {
    image(img2, mouseX,mouseY); }
    else {image(img3,mouseX,mouseY,width/3,height/3);
   
  }
}
void move() {
  x = x + speed;
  if (x > width) {
    x = -300;
  }
}





