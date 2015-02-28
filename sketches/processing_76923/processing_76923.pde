
PImage img;

   
 float xPos;
 float yPos;
   
 float xVel = 5;
 float yVel = 6;
 
void setup() {
size(500,500);
img = loadImage("image.jpg");
// img variable will be this image
 xPos = width/2;
 yPos = height/2;
}
void draw() {
background(255);
image(img,0,0);

 xPos = xPos + xVel;
  yPos = yPos + yVel;
    
  if (yPos + 30 > height || yPos - 30 < 0 ){
      yVel = yVel * -1;}
        
   if (xPos + 30 > width || xPos - 30 < 0 ){
      xVel = xVel * -1;}
  
  fill(224, 45, 70);
  noStroke();
  ellipse(xPos,yPos,70,70);
}

