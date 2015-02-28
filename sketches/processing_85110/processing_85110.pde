

class Drop {//create a object
  
  PVector pos;//positon of the drop
  PVector vel;//velocity of the drop
  color c;//colour of the drop
  float s; //size
  
  Drop (PVector _pos, color _c, float _s){//function--"constructor"-makes the drop
     pos = _pos;//take the incoming information and store it
     c = _c;
     s = _s;
     vel = new PVector (0,0);
     
   }
   
   void render(){ 
     fill(255,255,255);//fill the drop 
     noStroke();
     ellipse(pos.x,pos.y,s,s);//draw the drop on the screen
          
     //draw a drop
   
   
   }
   
   void move(){//make drops move
      pos.add(vel);//add the velocity vector to our position
      PVector gravity = new PVector(0, 0.1);//create a new vector--gravity
      vel.add(gravity);//add gravity vector 
   
   
   }
  
}

