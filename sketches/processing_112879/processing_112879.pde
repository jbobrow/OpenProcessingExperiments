
float xPos;
float yPos;
float a= 45;

void setup(){
  size (600, 600);
  xPos = width/1.4;
  yPos = height/2.6;
  //by selecting random the colour of the background changes after every time it opens
  background(random (255), random (255), random(255), random(255));
  smooth();
}

void draw(){
fill(random (255), random (255), random (255), random(255));
ellipse(xPos, yPos, 64, 64);

a=a+1;
float xChange = cos(radians(a));
float yChange = sin(radians(a));

xPos += xChange *3;
yPos += yChange *2;

}




