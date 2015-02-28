
//var decloration

//change maximum number of balls
int num = 20;

float xpos[] = new float[num];
float ypos[] = new float[num];
float xvel[] = new float[num];
float yvel[] = new float[num];
int hue[] = new int[num];

//gravity + friction
float grav = 0.1;
float fric = -0.9;

void setup() {
  size(500,500);
  background(0);
  smooth();
  noStroke();
  colorMode(HSB,360,100,100);
  
  //create balls
  for(int i=0;i<num;i++){
    xpos[i] = width/2;
    ypos[i] = height/2; 
    xvel[i] = random(-3,3);
    yvel[i] = random(-10,-1);
    hue[i] = int(random(0,360));
  }
  
}

void draw() {
  //fade in background
  fill(0,0,0,90);
  rect(0,0,width,height);
  
  //cycle through all the balls
  for(int i=0;i<num;i++){
    //collision detection with floor
    if(ypos[i]> height-10) {
      ypos[i] = height-10;
      yvel[i] *= fric;
    }
    
    //apply balls velocity and gravity
    xpos[i] += xvel[i];
    ypos[i] += yvel[i];  
    yvel[i] += grav;
    
    //draw balls
    fill(hue[i],100,100,100);
    ellipse(xpos[i],ypos[i],20,20);
    
    //if mouse is held, balls are moved back to the center of the screen when they go off stage
    if (mousePressed) {
      if(xpos[i] < -10 || xpos[i] > width+10) {
        xpos[i] = mouseX;
        ypos[i] = mouseY;
      }
    }
    //if this is skipped, the balls just warp to the other side of the stage
    if(xpos[i] < -10) {
        xpos[i] = width+9;
    } else if (xpos[i] > width+10) {
        xpos[i] = -9; 
    }
    
    //each ball [i] checks if it is intersecting every other ball in the same arrays (defined as [j])
    for(int j=0;j<num;j++){
      if (dist(xpos[i],ypos[i],xpos[j],ypos[j])<=20){        
        if (xpos[i]>xpos[j]){
          
          //move balls outside of eachother so as to not get stuck
          xpos[i] += abs(xpos[i]-xpos[j])/4;
          xpos[j] -= abs(xpos[i]-xpos[j])/4;
          
          //bounce in opposite directions if they are not not moving in the same direction
          if (xvel[i]<0 && xvel[j]>0){
            xvel[i]*=-1;
            xvel[j]*=-1;
          }
          
        } else {
          //repeat for the opposite condition
          xpos[i] -= abs(xpos[i]-xpos[j])/4;
          xpos[j] += abs(xpos[i]-xpos[j])/4;
          
          if (xvel[i]>0 && xvel[j]<0){
            xvel[i]*=-1;
            xvel[j]*=-1;
          }
          
        }
        //repeat for y axis
        if (ypos[i]>ypos[j]){
          ypos[i] += abs(ypos[i]-ypos[j])/4;
          ypos[j] -= abs(ypos[i]-ypos[j])/4;
          
          if (yvel[i]<0 && yvel[j]>0){
            yvel[i]*=-1;
            yvel[j]*=fric;
          }
          
        } else {
          ypos[i] -= abs(ypos[i]-ypos[j])/4;
          ypos[j] += abs(ypos[i]-ypos[j])/4;
          
          if (yvel[i]>0 && yvel[j]<0){
            yvel[i]*=fric;
            yvel[j]*=-1;
          }
          
        }
        
      }
    }
    
    /* possible improvements
    -transfere velocity of one ball to another if they collide while moving in the same direction
    */
    
    
    
  }

}


