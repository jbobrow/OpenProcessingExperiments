
int circle = 120;
  
   
void setup(){
  size(500,1000);
  ellipseMode(CENTER);
  stroke(255);
  fill(0,0,0,80);
  smooth();
  background(0);
  smooth();
  
  
}
   
void draw(){

 noLoop();
  for(int y = 0;y <= 550;y = y + circle) {
        
  for(int x = 0; x <= 550; x = x + circle){
     ellipse(250,250,x,y);
     ellipse(250,500,x,y);
     ellipse(250,750,x,y);
      
      rotate(PI/85);
     
    
    }
  }
}


