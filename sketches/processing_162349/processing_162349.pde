
//moving a square

int width = 600;
int height = 600;
int x = width/2;
int y = height/2;
int s = 60; 
int speed = 10;


void setup(){
  size(width, height);
  smooth();
  fill (48, 88, 240);
  rectMode(CENTER);
  noStroke();
}

void draw(){
  background(44, 255, 250);
  rect(x, y, s, s); 
  
  if (keyPressed){
    
    if ((keyCode == UP)&&(y>s/2)){
      y = y - speed; 
    }else{
      y = y;
    }
    
    if ((keyCode == DOWN)&&(y<height-s/2)){
      y = y + speed; 
    }else{
      y = y;
    }
    
    if ((keyCode == LEFT)&&(x>s/2)){
      x = x - speed; 
    }else{
      y = y;
      }
      
      if ((keyCode == RIGHT)&&(x<width-s/2)){
      x = x + speed; 
    }else{
      y = y;
      }
    }
  }

  


