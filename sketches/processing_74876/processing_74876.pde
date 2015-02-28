
 //Snake
    void setup() {
      size(600,600);
      fill(0);
      frameRate(5);
    }
    
    int len = 0;
    int maxLen = 2;
    int x = 20;
    int y = 20;
    int size1 = 20;
    int size2 = 20;
    int food_size1 = 20;
    int food_size2 = 20;
    int xVel = 0;
    int yVel = 0;
    boolean spin = false;
    
    void draw() {
    
          if (len == 0)
        background(255,255,255);
      if (len < maxLen)
        len += 1;
      else
        len = 0;
      snake();
      food();
      
 
      
    }
   
    
    void snake() {
      rect(x,y,size1,size2);
      x += xVel;
      y += yVel;
      
    }
    
    void food() {
      if (x>=300 && x<320 && y >= 300 && y < 320)
        fill(255,255,255);
        rect(300,300,food_size1,food_size2);
    
       if (x>=400 && x<420 && y >= 100 && y < 120)
        fill(204, 102, 0);
        rect(400,100,food_size1,food_size2);
  
        }
    
       
    void keyPressed() {
     if (key == CODED) {
       if(keyCode == UP) {
         xVel = 0;
         yVel = -20;
       } else if (keyCode == DOWN) {
         xVel = 0;
         yVel = 20;
         
       }
       if(keyCode == LEFT) {
         yVel = 0;
         xVel = -20;
         size1 = size1 + 10;
         size2 = size2 + 10;
         food_size1 = food_size1 + 10;
         food_size2 = food_size2 + 10;
       } else if (keyCode == RIGHT) { 
         yVel = 0;
         xVel = 20;
         size1 = size1 - 10;
         size2 = size2 - 10;
         food_size1 = food_size1 - 10;
         food_size2 = food_size2 - 10;
         
       }
     }
    }

    void mousePressed(){
        translate(width/2, height/2);
rotateX(radians(60));
rect(-26, -26, 52, 52);
spin = true;
    }


