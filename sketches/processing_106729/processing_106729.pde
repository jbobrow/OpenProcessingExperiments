
int x = 20;
int y = 20;

int dx = 0;
int dy = 0;

void setup() {  //setup function called initially, only once
  size(550, 550);
  
}

void draw() {  //draw function loops 
  
  
  ellipse(x,y,20,20);
  
  if (keyPressed){
  
      fill(random(250),random(255),0);
   
       if(key == 'd'){
       dx = 10;
       dy = 0;
           }
       else if(key == 'a'){
       dx = -10 ;
       dy = 0;
       }
       
       else if(key == 'w'){
       dy = -10;
       dx = 0;
       }
       
       else if(key == 's'){
       dy = 10;
       dx = 0;
       }
   
  }
  
  else {
      fill(random(255),random(100),random(100));
  }
  
  if(mousePressed){
  x=mouseX;
  y=mouseY;
  dy=0;
  dx=0;
  }
  
  
  x = x + dx;
  y = y + dy;
  
}
