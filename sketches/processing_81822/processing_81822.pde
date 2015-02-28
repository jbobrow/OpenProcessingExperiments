
ball[] b=new ball[15];
PVector[] mPos;
float time,lastTime,restitution;
boolean oneDragging;


void setup(){
  size(800,800);
  
  mPos=new PVector[5]; //mouse position array
   for(int i=0;i<mPos.length;i++)
   mPos[i]=new PVector(0,0);
  
  for(int i=0;i<b.length;i++)
  b[i]=new ball();
  lastTime=millis();
  restitution=0.5;
  oneDragging=false;
}

void draw(){
  
  time=millis()-lastTime;
  lastTime=millis();
  
   background(150,200,230);
   mousePosition();   
      
 for(int i=0;i<b.length;i++){
            
        if(b[i].dragged==true){
      b[i].position=new PVector(mouseX,mouseY);
      b[i].velocity=getMouseVelocity();
        }
        
        collide();
        b[i].update();
        b[i].display();
      }
   
}


  void mousePosition(){
    
  for(int i=0;i<mPos.length-1;i++){
  mPos[i+1]=new PVector(mPos[i].x,mPos[i].y);
   }
   mPos[0]=new PVector(mouseX,mouseY);
    
  }


//Event Handlers
  
  void collide(){

    for(int i=0;i<b.length;i++){
     for(int j=0;j<b.length;j++)
          if(i!=j) {
          float xbox=(b[i].position.x/8)- (b[j].position.x/8);
          float ybox=(b[i].position.y/8)- (b[j].position.y/8);
          if( (xbox<=100 && xbox>=-100) && (ybox<=100 && ybox>=-100) )
          if( (sq(b[i].position.x-b[j].position.x)+sq(b[i].position.y-b[j].position.y)) < sq(b[i].radius+b[j].radius)){
           
            float distance,a2;
            PVector delta= new PVector(b[i].position.x,b[i].position.y);
            delta.sub(b[j].position);
            distance=delta.mag();
            PVector mtd=new PVector(delta.x,delta.y);
            
            if (distance == 0)  {
                 distance = b[i].radius + b[j].radius - 1;
                 delta.normalize();
              }
              mtd.mult((b[i].radius+b[j].radius-distance)/distance);
             
             mtd.div(2);
             b[i].position.add(mtd);
             b[j].position.sub(mtd);
            
            
            // impact speed

              PVector v = new PVector(b[i].velocity.x,b[i].velocity.y);
              v.sub(b[j].velocity);
              mtd.normalize();
              
              float vn=v.dot(mtd);// if the vn is > 0, then the 2 balls are intersecting, but they're moving away from each other already
              
              if(!(vn>0)){
              // impulse
              // the restitution is the ball's elasticity. 1 is elastic, < 1 is inelastic 
              float p = -((1+restitution) * vn) / 1;
              mtd.mult(p);
              mtd.div(2);
              // apply impulses
              b[i].velocity.add(mtd);
              b[j].velocity.sub(mtd);
              }
          }
          }
    }


   }

  
  PVector getMouseVelocity()          
  {
    return new PVector(mPos[0].x-mPos[mPos.length-4].x,mPos[0].y-mPos[mPos.length-4].y);
  }
  
  void mouseDragged(){
    PVector m;
    for(int i=0;i<b.length;i++){
      m=new PVector(mouseX,mouseY);
      m.sub(b[i].position);
      
      if(m.mag()<b[i].radius && b[i].dragged==false && oneDragging==false){
      b[i].dragged=true; oneDragging=true;}
      
      if(b[i].dragged==true){
      b[i].position=new PVector(mouseX,mouseY);
      b[i].velocity=getMouseVelocity();
  
      }
    }
   }
   
  
  void mouseReleased(){
    for(int i=0;i<b.length;i++){
    b[i].dragged=false;
    oneDragging=false;
    }
  }

class ball{
 
  PVector position,velocity;
  float radius;
  boolean dragged=false;

 ball(){                                      //CONSTUCTER
     
   radius=20;
   position=new PVector(random(radius,800-radius),random(radius,800-radius));
   velocity=new PVector(random(-20,20),random(-20,20));
 } 
 
 void display(){                              //DISPLAY 
  
  fill(230,50,0);
  strokeWeight(0.5);
  stroke(0);
  pushMatrix();
  translate(position.x,position.y);
  ellipse(0,0,radius*2,radius*2);
  popMatrix();


 }
 
 void update(){                               //UPDATE
    
    walls();
    
    if(velocity.mag()>0.01){
      PVector anti = new PVector(velocity.x,velocity.y);
      anti.normalize();
      anti.mult(0.03);
      velocity.sub(anti);
      
      PVector temp=new PVector(velocity.x,velocity.y);
      temp.mult(time*0.03);
      position.add(temp);
      
    }
    else velocity.limit(0);
     velocity.limit(50);
    
 }
 
 
 void walls(){
     
   if((position.x>width-radius && velocity.x>0) || (position.x<radius && velocity.x<0))
     velocity=new PVector(-velocity.x,velocity.y);
     
   
   if((position.y>height-radius && velocity.y>0) || (position.y<radius && velocity.y<0))
     velocity=new PVector(velocity.x,-velocity.y);
     
  
 }
 
  
}


