
class Snow{ //create a kind of object



PVector pos; //position of the snowflake
PVector vel; //velocity of the snowflake

PVector acc;//acceleration = change in velocity



Snow(){ //special function - "constructor"-makes the object
  
  pos = new PVector(random(width),random(height),0);
  
  vel = new PVector(random(-5,5),random(-5,5),0);  

}

void render(){
  stroke(255);
  
  line(pos.x,pos.y,pos.x+4,pos.y+4);
  line(pos.x,pos.y+2,pos.x+4,pos.y+2);
  line(pos.x+4,pos.y,pos.x,pos.y+4);
  //draw the snowflake

}

void move(){//meke snow move
  //vel.add(acc);//add the acc to your velocity
  
  pos.add(vel);//add the velocity ector to your position
  
  
  if(pos.x<0){ //when it's off the left hand edge, change the velocity
    vel.x = vel.x*-1;
  }
  
  if(pos.x>width){ //when it's off the right hand edge, change the velocity
    vel.x = vel.x*-1;
  }
  
  if(pos.y<0){ //when it's off the top edge, change the velocity
    vel.y = vel.y*-1;
  }
  
  if(pos.y>height){ //when it's off the bottom edge, change the velocity
    vel.y = vel.y*-1;
  }
}




}

