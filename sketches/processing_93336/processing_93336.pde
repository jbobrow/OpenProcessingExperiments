
void setup (){
  size(400,400);
  background(255);
  
  
  }

int moveX=50;
int moveY=-50;
int i=0;

void draw(){
  
  line(moveX,5+i,5+i,moveY);
  moveX--;
  moveY++;
  i++;
  if( moveX==-50 && moveY==50){
    moveX=50;
    moveY=-50;
  }
  fill(100,0,255);
  ellipse(moveY,30,50,moveX);
  ellipse(moveY,100,50,moveX);
  ellipse(moveY,170,50,moveX);
  ellipse(moveY,230,50,moveX);
  ellipse(moveY,300,50,moveX);
  ellipse(moveY,370,50,moveX);
  

    stroke(255,0,255,50);
  }
    
    
  

  





