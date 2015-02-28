
void setup(){
  size(300,300);
  background(255);
  fill(180,100);
}

float count=0;
float num=50;
float numOfRectangles=15;


void draw(){
  
  //controls the probability of red
  
    if(random(100)>80){
      fill(255,0,0);
    }
    else{
      fill(180,100);
    }
  
  
  //this controls the rectagnles placement vertically
  if(numOfRectangles>0){ 
    rectMode(CENTER);
    rect(random(width),height/2,10,height);
  }
  
   //controls the probability of blue
  
    if(random(100)>80){
      fill(0,0,255);
    }
    else{
      fill(180,100);
    }
  
  
  //this controls the rectagnles placement horizontally
  if(numOfRectangles>0){
    rect(width/2,random(height),width,10);
  }
  numOfRectangles--;
  /*could use count++ here to stop the random but the number of rectangles is 
  already defined so that will stop it*/
  
}
  
  
    
    
    

  

  

