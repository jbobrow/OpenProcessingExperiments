
PImage poe;
float x;
float y;
float x2;
float y2;

void setup(){
  size(600,723);
  poe = loadImage("POE.png");
  
 smooth();
  x=0;
  y=0;
  x2=0;
  y2=0;
  
  translate(0,height/2);
  imageMode(CENTER);
}

void draw(){
  background(250);
   fill(0);  
   x = mouseX-20;
   y = mouseY-25;
   x2 = mouseX+37;
   y2 = mouseY-25;
   x = constrain(x,260,282);
   y = constrain(y,238,248);
   x2= constrain(x2,328,344);
   y2= constrain(y2,243,250);
   
  
  ellipse(x,y,8,8);
  ellipse(x2,y2,8,8);
  image(poe,width/2,height/2);
  
   println("x" +mouseX);
   println("y" +mouseY);
}

