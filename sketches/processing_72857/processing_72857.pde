
//Sea Horses and Killerfish by Lea Brunetto
//I used her same story and code
//but I changed all of the numbers and pictures
//to make it more of my own
//I changed seahorse to mushroom in the code
//and I changed killerfish to mario in the code
//I also changed it by adding a different background and by adding text
Mushroom[] mushroom = new Mushroom[15];
 
 
 

 
  
 
 
 
 
 
void setup() {
 
 
 
 
 
  size(800,800);
 
 
 
 
 
   
 
 
 
 
 
   for (int i = 0; i < mushroom.length; i++ ) {
 
 
 
 
 
      mushroom[i] = new Mushroom(random(width), random(height), random(1,3));
 
 
 
 
 
   }
 
 
 
 
 
}
 
 
 
 
 
  
 
 
 
 
 
void draw() {
 
 
 
 
 
  background(255,255,255);
 
 
if (mousePressed == true){
  PFont font;
  font = loadFont("Andalus-48.vlw");
  textFont(font);
  fill(255, 0, 0);
  text("It's a me!", 400, 400);
  text("Mario!", 400, 430);
}
 
for (int x = 0; x <= 2000; x += 5){
  line(0, x, 2000, x);
}
for (int y = 0; y <= 2000; y += 5){
  line(y, 0, y, 2000);
}
 

 noFill();
for (int d = 2000; d > 0; d -= 10){
  ellipse(mouseX, mouseY, d, d);
}

 

for (int x = -16; x < 2000; x += 10){
  line(x, 0, x+15, 2000);
}
 
 

for(int y = 20; y <= 2000; y += 10){
  for(int x = 20; x <= y; x += 5){
    line(x, y, x-3, y-3);
  }
}
 
 if (mousePressed == true)
 
 
 
 
 
 for (int i = 0; i < mushroom.length; i++ ) {
 
 
 
 
 
    mushroom[i].swimfast();
 
 
 
 
 
    mushroom[i].mario();
 
 
 
 
 
    mushroom[i].display();
 
 
 
 
 
   
 
 
 
 
 
 } else {     
 
 
 
 
 
    for (int i = 0; i < mushroom.length; i++ ) {
 
 
 
 
 
      mushroom[i].swim();
 
 
 
 
 
      mushroom[i].display();
 
 
 
 
 
  }
 
 
 
 
 
}
 
 
 
 
 
}
 
 
 
class Mushroom {  
 
 
 
 
 
    
 
 
 
 
 
  float xpos;
 
 
 
 
 
  float ypos;
 
 
 
 
 
  float xspeed;
 
 
 
 
 
   
 
 
 
 
 
  Mushroom(float tempx, float tempy, float tempspeed) {
 
 
 
 
 
     
 
 
 
 
 
   println("a mushroom has been created");
 
 
 
 
 
     
 
 
 
 
 
   xpos = tempx; 
 
 
 
 
 
   ypos = tempy;
 
 
 
 
 
   xspeed = tempspeed;
 
 
 
 
 
  }
 
 
 
 
 
  
 
 
 
 
 
  void display() {
 
 
 
 
 
   PImage mushroom;
 
 
 
 
 
   mushroom = loadImage("mushroom.png");
 
 
 
 
 
   image(mushroom, xpos, ypos);  
 
 
 
 
 
  }
 
 
 
 
 
  
 
 
 
 
 
  void swim() {            
 
 
 
 
 
    xpos = xpos + xspeed;
 
 
 
 
 
    if (xpos > width) {
 
 
 
 
 
      xpos = 2;
 
 
 
 
 
    }
 
 
 
 
 
  }
 
 
 
 
 
    
 
 
 
 
 
  void swimfast() {            
 
 
 
 
 
    xpos = xpos + 35*xspeed;
 
 
 
 
 
    if (xpos > width) {
 
 
 
 
 
      xpos = 1;
 
 
 
 
 
    }
 
 
 
 
 
  }
 
 
 
 
 
    
 
 
 
 
 
  void mario() {
 
 
 
 
 
   PImage mario;
 
 
 
 
 
   mario = loadImage("smario.png");
 
 
 
 
 
   imageMode(CENTER);
 
 
 
 
 
   image(mario, mouseX, mouseY);  
 
 
 
 
 
     
 
 
 
 
 
   if ((xpos < mouseX + 60) && (xpos > mouseX - 60)) {
 
 
 
 
 
     if ((ypos < mouseY + 60) && (ypos > mouseY - 60)) {
 
 
 
 
 
       xpos+=60;
 
 
 
 
 
       ypos+=60;
 
 
 
 
 
         
 
 
 
 
       if ((xpos > 500) && (ypos > 500)) {
 
 
 
 
 
         xpos=random(0,400);
 
 
 
 
 
         ypos = random(0,400);
 
 
  
 
 
       }
 
 
 
 
 
         
 
 
 
 
 
     }
 
 
 
 
 
   }
 
 
 
 
 
  }
 
 
 
 
 
     
 
 
 
 
 
}

