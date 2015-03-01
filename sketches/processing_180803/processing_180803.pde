
/*
Basic time control
*/

int x,y;
int cWidth = 20;
int startTime;
int pause = 10;
int dx = 1;
boolean vFlag = false;

void setup(){
  size(100,300);
  startTime = millis();

  x = 10;
  y = 10;
  
  
}

void draw(){
  
  background(255);
  ellipse(x, y, cWidth, cWidth);
  
  if( millis() >= startTime + pause ){

    //1. check if i hit a wall
    if( x >= width  ){  //right wall
      dx = -dx;
    }
    else if( x <= 0  ){  //left wall
      dx = -dx;
    }
    
    if( y >= height){ //bottom wall
      vFlag = false;
    }
    
    if( y <= 0 ){ //top wall
      vFlag = true;      
    }
    
    //2. set position (2 ways)
    x = x+dx;
    if(vFlag){
        y = y+3;
    }
    else y = y-3;
    
    //3. reset my counter
    startTime = millis();
  }
  
}


