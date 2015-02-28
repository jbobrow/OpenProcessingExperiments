
PImage img;
PImage img2;
PImage img3;
float z = 200;
float z2 = 200;
float x = 300;
float y = 50;
float angle; 
float theta = 0.6;
int time1 = 1000;
int time2 = 4000;
int time3 = 6000;
int time4 = 6000;

void setup()
{
   size(600, 400, P3D);
  smooth();
  noStroke();
  img = loadImage("pic3.jpg");
  img2 = loadImage("pic1stick.png");
  img3 = loadImage("pic2dog.png");
    
}
 
 void draw() {

  
background(img);



int currentTime = millis();
if (currentTime > time2) {
  z2 -= 5;
} else if (currentTime > time1) {
  z2-=5;
}
translate(x,y,z2);
image(img3,width/6,150);


 
  
  // Translate to a point before displaying a shape there
  translate(x,y,z);
  rectMode(CENTER);
  rotateX(theta);
  rotateY(theta);
  image(img2,0,0); 
  theta += 0.1;
  z-= 30 ;

 }

