
int x = 20;
int y = 20;

int dx = 0;
int dy = 0;

void setup() {  //setup function called initially, only once
  size(250, 250);

}


void draw() {  //draw function loops 
    background (255,255,255);
    ellipse(x,y,20,20);
    
    fill(0,0,0);
    rect(50, 100, 50, 50);
    

    if (keyPressed){
    
        fill(0,255,0);
        
      if (x>50 && y>50){
        dx = -dx;
        dy = -dy;
        }
       if (key == 'd' ){
           dx = 1 ;
           dy = 0;
            if (x>40 && y>40){
                dx = -dx;  
            }
       }
       else if (key == 'a'){
           dx = -1;
           dy = 0;
           
       }
       else if (key =='w'){
           dx = 0;
           dy = -1;
       }
       else if (key =='s'){
           dx = 0;
           dy = 1;
       }
  
       
    }
    else{
    
        fill(255,0,0);
        dx=0;
        dy=0;
    }
    
    x = x + dx;
    y = y + dy;
}
