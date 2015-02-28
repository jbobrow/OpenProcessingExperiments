

class Dot{// Class is a template for creating the object (which is the dot)
  
  PVector pos;//PVector is one of the variables where I can position the dot
  PVector vel; //PVector is one of the variables where I can change the velocity (change of position)
 
 
  Dot(PVector _pos, int _size){//This is set to help created the dot postion and size
  
    pos = _pos;// setting the code for the postion of the object
 
    vel = new PVector(random(66,50),random(50,30));
//This is the velocity where the position will be random.

     
     
}

 void thefunction(){//This is to show what the object is going to function as
    ellipse(pos.x,pos.y,10,10);//Setting out the dot and where it will move throgh the x and y 
    
}

void move (){//This is what the dot or the object is going to do.
 pos.add(vel); // add volocity to postion
 vel.add (turnarownd);

  
}

void bounce(){//When the dot is bouncing from one place to another, it is going to hit the wall of the canvas and comes back. This code tells the dot where to hit in order to react to the space around it.
  if (pos.x<0) vel.x = vel.x* -1;//flip your x velocity
  if (pos.y<0) vel.y = vel.y* -1;
  if (pos.x>width) vel.x = vel.x* -1;
  if (pos.y>height) vel.y = vel.y* -1; 
    
}

}


