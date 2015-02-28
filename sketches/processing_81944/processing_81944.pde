
class Ball {
  
  float r; // radius
  float x,y;
  float xspeed,yspeed;
  color c = color(100,50);
  float xdirt=1;
  float ydirt=1;
  
  // Constructor
  Ball(float tempR, color tempC,float tempXs, float tempYs) {
    r = tempR;
    c = tempC;
    x = random(216,434);
    y = random(141,359);
    xspeed = tempXs;
    yspeed = tempYs;
  }
  
  void move() {
    x += xspeed*xdirt; // Increment x
    y += yspeed*ydirt; // Increment y
    
    // Check horizontal edges
    if (x >440-6  || x <210+6 ) {
      xdirt *= -.95;
      
    }
    
    // Check vertical edges
    if (y > 365-6 || y <135+6) {
      ydirt *= - .95;
    }
    
    
  }
  
  //move the ball
  void control(){
    if(keyPressed && (key==CODED)){
      if(keyCode==LEFT){
        x-=2.3;
        if(x<216){
          x=216;
        }
      }else if(keyCode==RIGHT){
        x+=2.3;
        if(x>434){
          x=434;
        }
      }else if(keyCode==UP){
        y-=2.3;
        if(y<141){
          y=141;
        }
      }else if(keyCode==DOWN){
        y+=2.3;
        if(y>359){
          y=359;
        }
      }
    }
  }
  
  void hit(){
    for(int i=0;i<balls.length;i++){
      Ball balls2 = balls[i];
      
      if(balls2 != this){
        float totalsize = balls2.r+r;
        
        float xdis = abs((balls2.x+int(2*balls2.r))-int(x+2*r));
        float ydis = abs((balls2.y+int(2*balls2.r))-int(y+2*r));
        
        if(abs(xdis)<abs(totalsize) && abs(ydis)<abs(totalsize)){
          if(abs(xdis)>abs(ydis)){
            xdirt*=-1;
          
            
            while(abs(xdis)<abs(totalsize)){
              if(x>balls2.x){
                x++;
                balls2.x--;
              }else{
                x--;
                balls2.x++;
              }
              xdis=abs((balls2.x+int(2*balls2.r))-int(x+2*r));
            }
          }
          
          else if(abs(ydis)>abs(xdis)){
            ydirt*=-1;
            
            while(abs(ydis)<abs(totalsize)){
              if(y>balls2.y){
                y++;
                balls2.y--;
              }else{
                y--;
                balls2.y++;
              }
              ydis=abs((balls2.y+int(2*balls2.r))-int(y+2*r));
            }
          }
          else{
            xdirt*=-.95;
            ydirt*=-.95;
          }
        }
      }
    }
  }
  
 
  
  // Draw the ball
  void display() {
    stroke(0);
    fill(c);
    ellipse(x,y,r*2,r*2);
     // After the ball is displayed, the color is reset back to a darker gray.
    
  }
  
  void display2(){
    noStroke();
    fill(54,156,255);
    ellipse(x,y,10,10);
  }
}


