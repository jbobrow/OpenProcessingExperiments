
class Neet extends Person{
  
  int initialRadius=5;
  
  
  Neet(){
    
    vision=20;
    Person closestPerson;
    //super();
    speed=8;
    radius=initialRadius;
    angleSpeed=21;
  }
  
  
  
  /*
  void move(){
    
    
    //if there is a nearby Person, move away from it
  
    //closestPerson=findNeighbor(this);
     
     
     x=x+2*(int)random(-2,2);
     y=y+2*(int)random(-2,2);
  }
  
    
*/
  
  void react(){
     
    if(age==0)
    {
      
      return;
    }
     age++;
     if(age%30==0)
     {
       //radius++;
       //speed=speed*.75;
     }
     

     
     
     
     
     Person tempP=findNeighbor(this);
     

     
     
     //PVector tempV=new PVector(tempP.trueX,tempP.trueY);
     //direction=location.sub(tempP.location);
     //PVector tempV2=new PVector(tempP.trueX, tempP.trueY);
     //PVector tempV3=this.location;
     
     
     goalDirection=PVector.sub(this.location, tempP.location); //moves away from others
     
      //goalDirection=PVector.sub(goal,new PVector(trueX, trueY));
     //println(goalDirection);
     //println(PVector.angleBetween(goal, direction));
     //if(trueY>goal.y)
     //if((lastAngle-PVector.angleBetween(goal,direction))>=0)  //changes direction if angle is moving away from goal
     //float curDistance=PVector.dist(new PVector(trueX+direction.x,trueY+direction.y),goal);
     
     
     
     
     float gTheta=getTheta(goalDirection);
     float dTheta=getTheta(direction);
     
     
     
     
     //if(curDistance>lastDistance)//if moved farther than last frame
     if(((gTheta>dTheta)&&(abs(gTheta-dTheta)<= radians(180)))  )     
     //if((gTheta-dTheta)< radians(180))       
     {
         //println("changing direction");
         //direction=changeAngle(direction, (float)10*-facingDirection); //change direction
         direction=changeAngle(direction, angleSpeed); //turn clockwise no noise
         //direction=changeAngle(direction, angleSpeed+noise(trueX,trueY)); //turn clockwise
     }
     
     /*
     else if(gTheta>radians(180) && (dTheta - gTheta) <= radians(180) )
     {
       
      direction=changeAngle(direction, (float)5); //turn clockwise
      
       
     }
     */
     
     
     else{ //otherwise stay normal direction
     
       
       //direction=changeAngle(direction, (float)10*facingDirection);
       direction=changeAngle(direction, -angleSpeed);//turn counter-clockwise no noise
       //direction=changeAngle(direction, -angleSpeed+noise(trueX,trueY));//turn counter-clockwise
     }
     
     limDirection=direction;
     
     
            //limDirection=PVector.sub(this.location, tempP.location); //moves towards others
             //limDirection=PVector.sub(this.location, tempP.location); //moves away from others
     
     
 
   
           limDirection.normalize();          //normalize speed vector
           trueX=trueX+limDirection.x*speed; //update location
           trueY=trueY+limDirection.y*speed; //update location
           location=new PVector(trueX,trueY); //update location
   
   
   
   checkDeath(tempP);
   
    }
 
 
 
 
    void display(){
     
      if(age>0)
      {
      color dColor=color(0,100,200);
      fill(dColor);
      //stroke(dColor);
     ellipse((int)trueX, (int)trueY, radius*2,radius*2);
      }
     
   }
 
 
 
 
 /*
 void testMove(){
   
  
  super.tmove(); 
 }
 
 */
  
  void checkDeath(Person tempP){
    
    
         if(distanceBetween(this,tempP)<radius)
     {
       //println("died");
       if(deathOn)
       {
       age=0;
       trueX=0;
       trueY=0;
       return;
       }
       else
       {
            trueX=random(width);
            trueY=random(height);
       }
       
     }
    
    
    
              if(radius==initialRadius*3|| trueX<0||trueX>width||trueY<0||trueY>height)
     {
           radius=initialRadius;
           speed=2;
                 trueX=random(width);
      trueY=random(height);
       
     }

     
  }
  
  
}

