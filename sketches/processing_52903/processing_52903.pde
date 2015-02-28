
 PImage sum;
 PImage space;
 PImage saks;
 PImage ship;

void setup(){
 sum = loadImage("sum.png");
 space = loadImage("space.png");
 saks = loadImage("saks02.png");
 ship = loadImage("ship.png");
 frameRate (50);
size (900, 900);
 noStroke();
 smooth();
   background(255);
   
 imageMode(CENTER);


 } 
  
  void draw(){
    
 background(random(0, 255),random(0, 255),random(0, 255));
 
 image(space, width/2, height/2);
   
  image(ship,  mouseY, 230, 200, 200);
  
  if (mouseX >= 450){
    image (saks, width/2, height/2, pmouseX*1.5, pmouseY*2);
  }
  
else if (mouseX< 450){
  image (saks, width/2, height/2);
  }  
  image(sum, mouseX, mouseY,300,380);

}


