
      boolean overStart=false,overRestart=false;
      int stage=0;
      float time,lastTime;
      
  Script play;
    
    void setup(){          //Setup Class
        play=new Script();
        noFill();
        size(1000,1000);
        lastTime=millis();
     }
    
    void draw(){            //Draw Class
    
              time=millis()-lastTime;
              lastTime=millis();
              translate(500,500);
              
              switch(stage){
                
                case 0: play.Menu();
                
                        if(mouseX <800 && mouseX> 200 && mouseY> 150 && mouseY< 350)
                          {overStart=true;}else {overStart=false;} 
                          
                break;
                case 1: play.GameLoop();
                        
                        if(play.gameOver) {stage=2;}
                        if(play.winGame) {stage=3;}
                        
                break;
                case 2: play.GameOver();
                        
                        if(play.time>100){
                        textSize(30);
                        text("RESTART",-70,60);
                        }
                        
                        if(mouseX >420 && mouseY >530 && mouseX <570 && mouseY <580)
                          {overRestart=true;}else {overRestart=false;}

                        
                break;
                case 3: play.Win();
                
                       if(play.time>100){
                        textSize(30);
                        text("RESTART",-70,60);
                       }
                        
                        if(mouseX >420 && mouseY >530 && mouseX <570 && mouseY <580)
                          {overRestart=true;}else {overRestart=false;}

                break;
              }
              
              
              
              
              
              
          
                
    }
    
    void mousePressed() {
      
                    if(overStart) { 
                        stage=1; 
                        overStart=false;
                    }
                    if(overRestart) { 
                        stage=1; play.Initialise(); 
                        overRestart=false;
                    }
                    

}

class Asteroid{
  
 PVector velocity, position;
 float si;
  boolean dead=false;

  Asteroid(){
   velocity=new PVector(3*cos(HALF_PI*random(4)),4*sin(HALF_PI*random(4)));
   position=RandomPos();
   si=random(50)+20;
  } 
  
  void display(int bw){
    
    ellipseMode(CENTER);
   strokeWeight(3);
   stroke(255,255,255,bw);
   noFill();
   if(!dead){
   ellipse(position.x,position.y,si,si);
   }

  }
  
  void update(){
    correct();
    PVector temp=new PVector(velocity.x,velocity.y);
    temp.mult(time*0.03);
   position.add(temp); 
  }
  
  void correct(){
     if(position.x>550){position.x=-540;}
     if(position.x<-550){position.x=540;}
     if(position.y>550){position.y=-540;}
     if(position.y<-550){position.y=540;}
  }
  
  PVector RandomPos(){
    
    PVector k=new PVector(random(1000)-500,random(1000)-500);
    
    if(k.x<300 && k.x>-300 && k.y<300 && k.y>-300){k=RandomPos();}
    
    return k;
  }
  
  
}


class Laser{
 
  PVector velocityL, starting, positionL,position;
  float ticker=0,ang;float life=50;
  boolean dead=false;
  
   Laser(float angle,PVector pos){
      ang=angle;
     velocityL=new PVector(20*cos(angle-HALF_PI),20*sin(angle-HALF_PI));
     positionL=new PVector(0,0);
     starting=pos;

   } 
   
   void display(){
           if(!isDead()){
                 correct();
                 PVector temp=new PVector(velocityL.x,velocityL.y);
                  temp.mult(time*0.03);
                 positionL.add(temp); 
                 position=new PVector(starting.x+positionL.x+12*cos(ang-HALF_PI),starting.y+positionL.y+12*sin(ang-HALF_PI));
                                  point(position.x,position.y);
                 ticker++;
           }else dead=true;
   }
   
   boolean isDead(){
     return ticker>life;
   }
   
     void correct(){
     if(positionL.x>550){positionL.x=-540;}
     if(positionL.x<-550){positionL.x=540;}
     if(positionL.y>550){positionL.y=-540;}
     if(positionL.y<-550){positionL.y=540;}
     }
   
  
}


/*
*
*
*
*
*
**/



class Script{
         
  /*
  *
  *
  *
  *
  *
  */
    
     int sizeX,sizeY,t,tStop,lastB,numAs,deadAs,time;
     Spaceship tom;
     Asteroid[] mars;
     Star[] star;
     int numBullets;
     Laser[]blip;
     boolean gameOver,winGame;
  
  Script(){              
                    Initialise();       
                            
          } 
                          
        void Menu(){                          //Whats on the Menu?
          
          background(0,0,0,255);
                  
                  drawStars();
                  
                           ellipseMode(CENTER);   
            strokeWeight(3);
            stroke(255);
           ellipse(0,-250,800,300);
           textSize(100);
           
           textSize(100);
           text("ASTEROIDS",-270,-220);
           textSize(30);
           text("Created By Thomas Torr",-170,-40);
           textSize(20);
           text("Use the arrow keys to fly \nto break, press down\nto shoot press left-ctrl\nclick the logo to start",-100,40);
           text("Remember: in space, no one can hear you scream.\n       Also, there's no air resistance. Good luck",-220,210);
           
        
        }
        
  void GameLoop(){        //Where the magic happens
        
                  
                    background(0,0,0,255);
                    
                                      drawStars();
 
                        tom.display();
                        fire();
                        
                        for(int i=0;i<numBullets;i++){ //draw bullets
                              blip[i].display();
                              
                              if(blip[i].isDead() && t-lastB>80){
                                  numBullets--;
                                  }
                                  
                                                                            //Contact Kill for laser on Asteroids
                                                                            
                                             for(int j=0;j<numAs; j++){
                                                       
                                              if(!blip[i].dead && !mars[j].dead && blip[i].position.dist(mars[j].position)<mars[j].si)
                                               {mars[j].dead=true;deadAs++;tStop=t;}
                                                    }
                                  
                                  
                              }
                              
                              
              
                      for(int i=0;i<numAs;i++){    //draw asteroids
                              mars[i].display(255);
                              mars[i].update();
                              
                                                                          //Contact Kill for asteroids on your pretty lil face
                                                              
                              for(int j=0;j<6;j+=2){
                                      if(!mars[i].dead && mars[i].position.dist(new PVector(tom.rot[j]+tom.position.x,tom.rot[j+1]+tom.position.y)) < mars[j].si-20 )
                                      {tom.dead=true; mars[i].display(200);tStop=t;}
                                      
                              }
                      }
                 
                 if(tom.dead) gameOver=true;
                 
                 if(numAs-deadAs==0) winGame=true;
                      
        t++;
        }
        
  void Win()
  {
    
        time=t-tStop;
    if (time>255){time=255;}
    
    
                    background(0+time);
                    drawStars();
                    
               if(time>70){
                    textSize(100);
                    fill(0,0,0);
                    text("WIN",-100,0);
               }      
                    if(time<255){
                        for(int i=0;i<numAs;i++){    //draw asteroids
                                  mars[i].display(255-time);
                                  mars[i].update();}
                    }
                    
                    tom.display();
                        fire();
                    t++;
        
        
  }
          
  void GameOver(){              //GameOverScreen
          
    time=t-tStop;
    if (time>255){time=255;}
    
    
                    background(0+time);
                    drawStars();
                    
               if(time>70){
                    textSize(100);
                    fill(0,0,0);
                    text("GAMEOVER",-250,0);
               }      
                    if(time<255){
                        for(int i=0;i<numAs;i++){    //draw asteroids
                                  mars[i].display(255-time);
                                  mars[i].update();}
                    }
                    t++;
                    
 
                }
                    
                    
        
  void fire(){
          if(!tom.dead && keyPressed && keyCode==CONTROL && numBullets<100  && t-lastB>12){
            
            
            blip[numBullets]=new Laser(tom.angle,tom.position);
            lastB=t;
            numBullets++;
            
          }
        }
        
  void Initialise(){
          
          //Initialise Variables
                    tom=new Spaceship();
                    star=new Star[1000];
                    
                    t=0;
                    numAs=30;
                    blip=new Laser[100];
                    numBullets=0;
                    mars=new Asteroid[numAs];
                    tStop=0;
                    deadAs=0;
                    gameOver=false;
                    winGame=false;
                    tom.dead=false;
                    lastB=0;
                    
                            for(int i=0;i<numAs;i++){    // Astroid Field
                            mars[i]=new Asteroid();
                            }
                            for(int i=0;i<1000;i++){  // Milky Way
                            
                                if(i<900){star[i]=new Star(1);}
                                else if(i<951){star[i]=new Star(2);}
                                else star[i]=new Star(3);
                            }
          
        }
        
        void drawStars(){
          
                               for(int i=0;i<1000;i++){    //draw stars
                              star[i].display();
                              star[i].update();
                              }
          
        }
   
}


class Spaceship{
 
 PVector position,velocity,acceleration;
 float[] dots=new float[6];
 float[] rot=new float[6];
 float angle=0;
 float maxSpeed;
 boolean dead=false;

 float s;  //size of ship

  Spaceship(){      //Constructor
   
   position=new PVector(0,0);
   velocity=new PVector(0,0);
   acceleration=new PVector(0,0);
   s=20; 
  
    
  
  dots[0]=0; dots[1]=-s;
  dots[2]=s/3; dots[3]=s/2;
  dots[4]=-s/3; dots[5]=s/2;
  
  
  } 
  
                  void display(){
                    
                    if(!dead){
                    Rotate();
                    accelerate();
                    stroke(255);
                    fly();
                    correct();
                    //line(-500,0,500,0);    //Plane
                    //line(0,-500,0,500);
                    
                    strokeWeight(3);
                    triangle(rot[0] +position.x,rot[1]  +position.y,
                              rot[2] +position.x ,rot[3] +position.y,
                                rot[4] +position.x ,rot[5]  +position.y);
                    }
                    
                  }
  
  void fly(){
    
    velocity.add(acceleration);
    PVector temp=new PVector(velocity.x,velocity.y);
    temp.mult(time*0.03);
    position.add(velocity);
    
  }
   
      
  void Rotate(){
    float dongle;
    
    if(keyPressed && keyCode == RIGHT){dongle=0.3;}
       else if(keyPressed && keyCode == LEFT){dongle=-0.3;}
       else{dongle=0;}
    
        for(int i=0; i<6;i+=2){   
            rot[i]=dots[i]*cos(dongle)-dots[i+1]*sin(dongle);      //2 arrays swapping data, each time rot goes to dots it rotates;
            rot[i+1]=dots[i+1]*cos(dongle)+dots[i]*sin(dongle);
        }
        
        for(int i=0; i<6;i++){
            dots[i]=rot[i];
        }
        angle+=dongle;
  }

  void accelerate(){

        if(keyPressed && keyCode == UP){acceleration=new PVector(cos(angle-HALF_PI),sin(angle-HALF_PI));}
       else if(keyPressed && keyCode == DOWN){acceleration=new PVector(-velocity.x*0.2,-velocity.y/2);}
         else if(velocity.mag()>6){acceleration=new PVector(-velocity.x*0.1,-velocity.y*0.1);}
         else{acceleration=new PVector(0,0);}
        
  }
  
    void correct(){
     if(position.x>550){position.x=-540;}
     if(position.x<-550){position.x=540;}
     if(position.y>550){position.y=-540;}
     if(position.y<-550){position.y=540;}
  }
  
  boolean contact(Asteroid a){
   
   return true;
  }
  
 

}



class Star{
  
 PVector velocity, position;
 float si;
 color co;

  Star(int num){
   velocity=new PVector(  0.003*cos(HALF_PI*random(2))  ,0.004*sin(HALF_PI*random(2)) );            
   position=new PVector(random(1000)-500,random(1000)-500);
   si=random(4);
   
   switch(num){
     case 1: co =color(random(255));break;
     case 2: co =color(random(60),random(30),random(30));break; //Red shift
     case 3: co =color(random(40),random(20),random(100));break; //Bule shift
   }
   
  } 
  
  
  void display(){
   strokeWeight(si);
   stroke(co);
   point(position.x,position.y);
  }
  
  void update(){
    correct();
   position.add(velocity); 
  }
  
  void correct(){
     if(position.x>550){position.x=-540;}
     if(position.x<-550){position.x=540;}
     if(position.y>550){position.y=-540;}
     if(position.y<-550){position.y=540;}
  }
  
  
}




