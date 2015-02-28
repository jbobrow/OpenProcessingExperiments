
int ballSpawn;              //counting variable for array
int ballMax;
ball[] balls;               //array containing the balls
boolean collision = false;  //toggles edge collision of type 1 balls
boolean maxBallsReached = false;
float bounciness = 0.35;     // edit for more or less bounce, default .35

void setup() {
  size(1024, 768, P2D);
  background(30, 50, 60);
  ballSpawn=0;
  noStroke();
  fill(128);
  ballMax = 300;
  balls = new ball[ballMax+20];
  smooth();
}

void draw() {                
  
  //println(frameRate);
  if (ballSpawn > ballMax) {
    if (maxBallsReached == false) {
      maxBallsReached = true;
    }
    ballSpawn = 0;
  }
  
  if(mousePressed && mouseButton == LEFT) {    //spawns new type 1 ball with semi-random/fuzzy color, size, and velocity
    int c = int(random(180,210));              
    int s = int(random(20,40));
    float mX = (mouseX-pmouseX)*10+random(-20,20);
    float mY = (mouseY-pmouseY)*10+random(-20,00)-3;
    balls[ballSpawn+1] = new ball(1, s, c, mouseX, mouseY-8, mX, mY);
    ballSpawn++;
  } 
  
   if(mousePressed && mouseButton == RIGHT) {    //spawns new type 2 ball with semi-random color and size and random velocity and direction.
    for (int i=0; i<2; i++){
    int c = int(random(200,230));
    int s = int(random(20,40));
    float mX = random(-300,300);
    float mY = random(-300,300);
    balls[ballSpawn+1] = new ball(2, s, c, mouseX, mouseY-4, mX, mY);
    ballSpawn++;
    }
    
    
  } 
  // print(ballCount); // diagnostics
  // if(ballSpawn>1){println(balls[1].age);}
  
          //this redraws the frame with all spawned balls.
  if (maxBallsReached == false){
    background(30, 50, 60);
    for(int i=ballSpawn; i>0;  i--){
      balls[i].ballUpdate();
      balls[i].ballMove();
    }
  }
  else{
    background(30, 50, 60);
    for(int i=ballMax; i>0;  i--){
      balls[i].ballUpdate();
      balls[i].ballMove();
  }
  
  
  }
}

class ball {
  
  float dim;         //diameter
  float speedX = 0;  //horizontal speed in px per second
  float speedY = 0;  //vertical speed in px per second
  color col;         //color
  float xpos;        //horizontal position
  float ypos;        //vertical position
  float age;         //age in seconds
  int ttl;           //for collision; times bounced
  int type;          //for different types of ball, currently right or left click
  int fade = 255;    //transparency
  float fadeSpeed = 3.05; //fade speed
  
  
  ball(int itype, float idim, color icol, float ixpos, float iypos, float ispeedX,  float ispeedY) { 
    
    dim = idim;
    col = icol;
    xpos = ixpos;
    ypos = iypos;
    speedX = ispeedX;
    speedY = ispeedY-10;
    age = 0;
    ttl = 16;
    type = itype;

  }
  
  
    void ballMove() {              // moves the ball according to new variables
         xpos += speedX/frameRate;
         ypos = ypos + (speedY/frameRate);
         age = age+(1/frameRate);
    }
    
    void ballUpdate() {            // calculates new variables (such as speed, size, etc.)
      // ----------------- TYPE 1
     
     
      if(fade==0){} //increases performance of type 2 by ceasing calculation, but doesn't get rid of the balls themselves
      else if(ttl==0) {} //increases performance of type 1 balls when colliding by the same method
      else if(xpos + dim < 0 || xpos-dim > width || ypos-dim >height) {} // and the same for type non-colliding.
      
      else if(type==1){
        if(age <=4/30){
          dim = dim+age*0.5;
        }
        else if(age <= 8/30 && age >= 5/30){
          dim = dim+age*0.2;
        }    
        fill(col, int((255/8)*ttl));
        ellipse(xpos, ypos, dim, dim);
        speedY = speedY+11;
        
        // edge collision detection
        if(collision==true){
          
          if(xpos+dim/2 >= width && speedX >= 0) {     // detects if out of frame and checks if moving outwards.
            ttl--;
            speedX = (speedX*(-1))*0.5*bounciness;
            speedY = speedY *0.8*bounciness;
          }
          
          if(xpos-dim/2 <= 0 && speedX <= 0) {
            ttl--;
            speedX = (speedX*(-1))*0.7*bounciness;
            speedY = speedY *0.8*bounciness;
          }
          
          if(ypos+dim/2 >= height && speedY >= 0) {
            ttl--;
            speedY = (speedY*(-1))*0.5*bounciness;
            speedX = speedX*0.7*bounciness;
          } 
        }
      }
      
      
      // ---------------- TYPE 2
      
      else if(type==2){
        
        // spawn size animation
        if(age<0.1){                           //initial, smaller size
          dim=5+random(-1,1);
        }
        
        if(age > 0.1 && age <= 0.4){           //the balls blows up
          dim = dim+10*age*(0.5+random(-.5,.5));

        }    
        if(age > .4 && age <= .5){             //the balls shrinks a bit again
          dim = dim-age*0.9;
        }  
      
        if(age > .5 && age <= 2){              //the ball continues to very slowly shrink
          dim = dim*0.995;
        }     

        // fade animation
        if(age > .4 && fade > 100) {
          fade = int(fade-(fadeSpeed*frameRate));
        }
        
        else if(fade<=100){
          fade = int(fade*0.95);
        }
        
        
        // draw routine
        fill(col, fade);
        ellipse(xpos, ypos, dim, dim);
       
        // movement
        
        if(age == 0){
          speedX=speedX*3;
          speedY=speedY*3;    
        } 
        
        if(age > 0 && age < .4){
          speedX=speedX*0.6;
          speedY=speedY*0.6;    
        } 
        
        if(age <= 0.4){
          float memSpeedX = speedX;
          float memSpeedY = speedY;
          speedX = memSpeedX*(1.6-.8*age)*0.95;
          speedY = memSpeedY*(1.6-.8*age)*0.95;
        }
                

      }      
    }  
}
  


