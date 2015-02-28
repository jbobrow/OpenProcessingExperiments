
PImage dog_1;
PImage dog_2;
PImage dog_3;
PImage dog_4;
PImage dog_5;


   
void setup() {
  size(500, 600);
   frameRate(random(2,6.8));

   dog_1= loadImage("IMG_0032 copy.jpg");
   dog_2= loadImage("IMG_4965_copy.png");
   dog_3= loadImage("IMG_0039-copy.png");
   dog_4= loadImage("IMG_0417_copy.png"); 
   dog_5= loadImage("IMG_0052-copy.png");

  

  imageMode(CENTER);
}
   
void draw() {
  background(0);
  float x = random(width);
  float y = random(height);
  float d = random(200, 500);
  float k = random(100, 200);


  image(dog_1, y, height/2,500,600);
  image(dog_2, x, x, k+150,k+150);
  image(dog_5, 40,350, d, d);
  image(dog_3, width/2, height/2, d+300,d+300);
  image(dog_4, k+150,k+20, d+100, d+100);




}



