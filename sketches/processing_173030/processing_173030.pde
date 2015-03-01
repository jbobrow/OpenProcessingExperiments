
PVector position, velocity, gravity, force, centre, mouse;

void setup(){
  size(400, 400);
  position = new PVector(50,50);
  velocity = new PVector(2, 0.6);
  gravity = new PVector(0, 0.1);
  force = new PVector();
  centre = new PVector(0.5*width, 0.5*height);

  strokeWeight(10);
  
}

void draw(){
  background(255);
  mouse = new PVector (mouseX, mouseY);
  force.set(gravity);
  force.add(  forceFromMouse()  );
  velocity.add(force);
  velocity.mult(0.998);
  position.add(velocity);
  
  bounce();
  point(position.x, position.y);
}

void bounce(){
  if(position.x > width){ 
    velocity.x  = -velocity.x;
   }else if (position.x<0){  
       position.x = 0;
     velocity.x = -velocity.x;
  }
  
   if(position.y > height){ 
    velocity.y  = -velocity.y;
   }else if (position.y<0){  
       position.y = 0;
     velocity.y = -velocity.y;
  }
}
 
 PVector forceFromMouse(){
   mouse.sub(centre);
   mouse.mult(0.001);
   return mouse.get();
}


