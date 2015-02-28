
void setup() {
  size(480,360);
  smooth();
  background(255);
  frameRate(10);
  
  
  
  PImage crystalskull = loadImage ("crystalskull.jpg");
  PImage petridish = loadImage ("petridish.jpg");
 tint(255, 100);
 image(petridish,0,0);
  }

void draw() {
  
  
 PImage petridish = loadImage ("petridish.jpg");
 PImage crystalskull = loadImage ("crystalskull.jpg"); 
 
 background(255);
  
  translate(width/2,height/2);
  for(int i =0; i <360; i ++){
    rotate(radians(1));
   image(petridish,mouseX,mouseY);
  }
  
  
  tint(255, random(50,175));
  image(petridish,-240,-180);
  
 
    tint(255, random(50,100));
    image(crystalskull,-240,-180);
}


//symmetry groups: cyclical and dihedral. cyclical

