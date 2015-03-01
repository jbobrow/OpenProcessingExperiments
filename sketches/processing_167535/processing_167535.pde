
PImage bg;
 PFont f;
int y;
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];
float eSize; // ellipse size
PImage img;
float angle;
float jitter;
float a = 0;
float b = 100;
float speed = 3;
PImage img4;

void setup(){

  size(960,617); 
  eSize = width/6;
  stroke(55,250,0);
 bg=loadImage("krmit.jpg");// bg = background image 
f = createFont("Davie-bold" ,100, true);
img=loadImage("wafflez2.png");
 img4 = loadImage("wafflez2.png");
 }

 
void draw(){
    background(bg);
  int which = frameCount % num;
  mx [which] = mouseX;
  my [which] = mouseY;
  for (int i = 0; i < num; i++) {
    int index = (which+1 + i)% num;
    ellipse (mx[index], my[index], i, i); 
  }
   { 
 
image(img,mouseX-295,mouseY-160);

 move();
    display();
  }
{  
if (mousePressed){ 
  stroke(255);
} else{
  stroke(0);
}
{ellipse (mouseX-1, mouseY, mouseX+1, mouseY);
ellipse (mouseX, mouseY-50, mouseX, mouseY+50);}
textFont(f,30);                
  fill(0,100,200);                         
  text("Where should my next vacation be?",430,180);
  if (mouseX>400){
    fill(10, 93,250,50);
  ellipse(mouseX, mouseY-15, 100, 100);
  } else 
  stroke(0,0,0,0);
  fill(220,270,200,50);
  ellipse(mouseX, mouseY-15, 100, 100);
}}
 
 void display() {
  image(img4,a,500);
}


void move() {
  a = a + speed;
  if (a > width) {
    a = -300;
  }}


