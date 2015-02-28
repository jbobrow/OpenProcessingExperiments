

Ball [] newBalls = new Ball[3000];
int numBalls = 0;
//boolean moving = false;


void setup(){
  smooth();
  size(600,600);
  frameRate(60);
}
    
void draw (){
  background(255);

  
  for(int i=0; i< numBalls; i++){
    newBalls[i].make();
    
    //if(moving == true){
      //newBalls[i].move();
    
   //millis() = current time since program launch
   if(millis() > 10000){
    newBalls[i].move();   }
    if(millis() > 10000){
    //newBalls[i].stop();
  }
    }
    
  }
//}


  
void mouseDragged(){
   //moving = !moving;
   
   newBalls[numBalls] = new Ball(mouseX, mouseY);
   numBalls++;
}

//void keyPressed(){
  //moving = !moving;
//}



class Ball {
  color black;
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float acc;
  int rad;
  //int startTime;
  
  Ball(float xTemp, float yTemp) {
    rad = (15);
    black = color(0);
    xpos = xTemp;
    ypos = yTemp;
    xvel = 5;
    yvel = 5;
    acc = 0.95;
  }
  
  void make(){
    noStroke();
    fill(0);
    ellipse(xpos,ypos,rad,rad);
  }

  void move(){
    //xvel += acc;
    yvel += acc;
    ypos += yvel;
    //xpos += xvel;
    
//    if(ypos + yvel + acc > height){
//      ypos = height-10;
//      yvel = 0;
//      acc = 0;
//    }
  
    if(ypos > height -10 || ypos <= 10){
      yvel *= -.9;
 
    }if(xpos >= width -10 || xpos <= 10 ){
      xvel= -.8*xvel;
  }
  

}
}

