
/* @pjs preload="space.jpg, dog.png, demon.png, cat.png"; */
float catx = 300;
float caty = 250;
float demonx = 100;
float demony = 300;
float dogx = 300;
float dogy = 300;
float easing = 0.05;
PImage space;
PImage dog;
PImage demon;
PImage cat;
Cat gcat = new Cat();
Demon hdemon = new Demon();
Dog doge = new Dog();
 
void setup(){
  size(500, 500);
  space = loadImage("space.jpg");
  dog = loadImage("dog.png");
  demon = loadImage("demon.png");
  cat = loadImage("cat.png");
}
 
void draw(){
  image(space,0,0);
  gcat.draw();
  catx = catx + cat.xspeed;
  caty = caty + gcat.yspeed;
   
  if(catx > height-gcat.xsize || catx < 0){
    gcat.xspeed *= -1;
  }
   
  if(caty > height-gcat.ysize || caty < 0){
    gcat.yspeed *= -1;
  }
   
  gcat.xsize -= 0.1;
  gcat.ysize -= 0.1;
   
  if(gcat.xsize <= 0){
    gcat.xsize = 0;
  }
   
  if(gcat.ysize <= 0){
    gcat.ysize = 0;
  }
   
  hdemon.draw();
  demonx = demonx + hdemon.xspeed;
  float waveSpeed = 0.1;
  float waveHeight = 10;
  demony = 250 + sin(demonx * waveSpeed) * waveHeight;
   
  if(demonx > width-70){
    hdemon.xspeed *= -1;
  }
   
  if(demonx < 0){
    hdemon.xspeed *= -1;
  }
   
  doge.update();
  doge.draw();
   
}
 
class Cat{
  float xspeed = 2;
  float yspeed = 3.5;
  float xsize = 90;
  float ysize = 170;
   
  void draw(){
    image(cat, catx, caty, this.xsize, this.ysize);
  }
}
 
class Demon{
  float xspeed = 3;
   
  void draw(){
    image(demon, demonx, demony); 
  }
}
 
class Dog{ 
  float speed = 1;
  float xsize = 67;
  float ysize = 168;
   
  void update(){
    float toX = demonx - dogx;
    float toY = demony - dogy;
     
    if(dist(demonx, demony, dogx, dogy) < 100){
    dogx = dogx + (toX*easing);
    dogy = dogy + (toY*easing);
    }
     
    if(dist(demonx, demony, dogx, dogy) < 8){
      this.xsize += 20;
      this.ysize += 30;
       
      demonx = 2000;
      demony = 2000;
    }
  }
   
  void draw(){
    image(dog, dogx, dogy, this.xsize, this.ysize);
  }
}



