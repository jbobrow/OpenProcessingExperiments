
PImage face;
PImage left;
PImage right;
PImage boom;
PImage cloud1;
PImage cloud2;
PImage cloud3;


void setup() {
  size(500,500);  
  smooth();
  frameRate(30);
  face=loadImage("face.png");
  right=loadImage("right.png");
  left=loadImage("left.png");
  boom=loadImage("boom.png");
  cloud1=loadImage("cloud1.png");
  cloud2=loadImage("cloud2.png");
  cloud3=loadImage("cloud3.png");
}

void draw() {
  background(#B8D5FC);
 
image(cloud1, 50, 350);
cloud1.resize(200,100);

image(cloud2, 300, 50);
cloud2.resize(300,300);

image(cloud3, 50, 50);
cloud3.resize(200,150);

image(right,mouseX+40,mouseY-10);
right.resize(50,50);

image(left,mouseX-40,mouseY-10);
left.resize(50,50);
  
  strokeWeight(10);
  line(mouseX+38,mouseY+30,pmouseX+38,pmouseY+80);
  line(mouseX+10,mouseY+30,pmouseX+10,pmouseY+80);

 image(face,mouseX,mouseY); 
  face.resize(50, 50);
  
if (mousePressed){
  image(boom,mouseX-125,mouseY-125);
  boom.resize(300,300);
}





}






