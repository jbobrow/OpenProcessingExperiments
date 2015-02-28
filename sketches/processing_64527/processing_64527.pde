
PImage e1;
PImage e2;
PImage e3;
PImage e4;
PImage g1;
float angle;
float cx,cy;
float rad=100;
float u;
float w;
float z;
float a=0;
float b=0;
int speed=3;


void setup() {
  size(600, 600);
  e1 = loadImage("1.jpg");
  e2 = loadImage("2.jpg");
  e3 = loadImage("3.jpg");
  e4 = loadImage("4.jpg");
  g1 = loadImage("gopher.png");
  imageMode(CENTER);
}
  
void draw() {
  float angle = (frameCount/20.0);
  float x =mouseX+cx+ cos(angle)*rad; //calculate any point on the C of a circle
  float y= mouseY+cy+ sin(angle)*rad;
  float w=mouseX+cx+ (cos(angle)*rad)*1.5; //calculate any point on the C of a circle
  float z=mouseY+cy+ (sin(angle)*rad)*1.5;
   
   
  background(0);
  tint(60);  
     image(g1,width/2,height/2,600,600);
noTint();
  pushMatrix();
  translate(150,150);
  image(e1, x, y, 50, 50);
  translate(150,-150);
  image(e3,x,y,100,100);
  popMatrix();
  image(e2,w,z,200,200);
//  
//  float a=a+1;
//  float b=b+1;
  image(e4,a,b,100,100);
   a=a+speed;
   b=random(1,150);
     if ((a > width) || (a < 0)) {
    speed=speed*-1;
     
   }

 
   
}


