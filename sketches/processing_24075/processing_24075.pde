
class Flower{ //create flower



PVector pos; //position of the flower
PVector vel; //velocity of the flower

PVector acc;//acceleration = change in velocity



Flower(){ //special function - "constructor"-makes the object
  
  pos = new PVector(random(width),random(height),0);
  
  vel = new PVector(random(-4,4),random(-4,4),0);  

}

void render(){
   noStroke();
   fill(pos.x*0.5,pos.y*0.5,pos.x-pos.y,180);  
    ellipse(pos.x-10,pos.y-10,20,20); 
    ellipse(pos.x+10,pos.y-10,20,20); 
    ellipse(pos.x-10,pos.y+10,20,20);
    ellipse(pos.x+10,pos.y+10,20,20);
    fill(250,250,210,150); 
    noStroke(); 
    smooth();
    ellipse(pos.x,pos.y,20,20);  
  
  //draw the flower

}

void move(){//meke flowers move
  
  
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

