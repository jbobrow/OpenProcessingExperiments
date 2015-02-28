
import fisica.*;

FWorld world; //create world


void setup(){
   size(600,800); 
 Fisica.init(this); //initialize
 
 world = new FWorld();
// world.setEdges();

}

void draw(){
  background(200);

  
  FCircle b = new FCircle(random(20,50));
  b.setPosition(mouseX, mouseY);
  b.setVelocity(0, 200);
  b.setNoStroke();
  b.setFill(100, 100);
  if(mousePressed && (mouseButton == RIGHT)){
  world.add(b); 
  }
  
  world.draw();
  world.step(); 
  
    if (keyPressed == true) {   
    b.setFill(250,0,63, 100);
  }
  
 if (keyCode == DOWN) {
    world.setGravity(0, 1000);            
  }
 if (keyCode == UP) {   
    world.setGravity(0, -1000);
  }
  if (keyCode == LEFT) {   
    world.setGravity(-1000, 0);
  }
  if (keyCode == RIGHT) {   
    world.setGravity(1000, 0);
  }

  if (keyPressed == false){  
    b.setFill(100, 100);
    world.setGravity(0,0);
  }
  

} 

