
PImage dog_1;
PImage dog_2;
PImage dog_3;
PImage dog_4;
PImage dog_5;
float x,y;
float r;
float xspeed, yspeed;


   
void setup() {
  size(500, 600);
   frameRate(random(8));

   dog_1= loadImage("IMG_0032 copy.jpg");
   dog_2= loadImage("IMG_4965_copy.png");
   dog_3= loadImage("IMG_0039-copy.png");
   dog_4= loadImage("IMG_0417_copy.png"); 
   dog_5= loadImage("IMG_0052-copy.png");
   
  x = width/2;
  y= height/2;
  xspeed= random(-10,10);
  yspeed= random(-10,10);
  
  r=map(abs(xspeed), 0, 10, 200,10);
  

  

  imageMode(CENTER);
}
   
void draw() {
  background(0);
  float x = random(width);
  float y = random(height);
  float d = random(200, 500);
  float k = random(100, 200);


  image(dog_1, width/2, height/2,500,600);
 
  

 
  fill(random(255),random(255),random(255));
  ellipse(x,y,r,r);
    fill(random(255),random(255),random(255));

  ellipse(x,x,y/4,y/4);
      fill(random(255),random(255),random(255));

  ellipse(y,y,y/2,y/2);
  
   image(dog_2, x, x, k+150,k+150);
  image(dog_5, 40,350, d, d);
  image(dog_3, width/2, height/2, d+300,d+300);
  image(dog_4, k+150,k+20, d+100, d+100);


 

}



