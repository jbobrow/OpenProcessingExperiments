
mover[] ball = new mover[20];
float r = 18;
float dista_max = 200 ;

void setup(){
  background(0);
  size(900,500);
  for(int i = 0;i < ball.length;i++){
    ball[i] = new mover(ball,i);
  }
}

void draw(){
  smooth();
  fill(0);
  rect(0,0,width,height);
  for(int i = 0;i < ball.length;i++){
    ball[i].update();
    ball[i].checkEdges();
    ball[i].collision();
    ball[i].display();
  }
}



    
    
    
      
      
  
  


