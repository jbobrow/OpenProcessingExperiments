
PImage a;
PImage b; 


void setup(){
  size(600,600);
  
 a= loadImage("001.jpg");
 imageMode(CENTER);
 
 b=loadImage("002.jpg");
 imageMode(CENTER);
 noCursor();
 
  
}



void draw(){
  image(a, 400, mouseY, a.width/4, a.height/4);
 image(b, 200, mouseY, b.width/4, b.height/4);
  
  
  
  
}


