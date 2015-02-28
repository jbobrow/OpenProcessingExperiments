
class Beetle {
  
  float x;
  float y;
  float fear = 0;
  float happiness;
  int state;
  float blu = 0;
  float z=0;
  boolean boo= false;
    
 Beetle(){
    this.state = 0;
    this.x = random(500);
    this.y = random(500);
    this.happiness = random(-255,255);
    
  }
  
  void bdraw(){
    color c = color(0-happiness-blu, happiness, blu, 150);
    fill(c);
    ellipse(x, y, 20, 20); 
    pulse();
  }
  
  void pulse(){
    if(radius(mouseX,mouseY) && z < 10 && boo == false){
    ellipse(x, y, 20+z, 20+z); 
    z++;
    }
    else if(radius(mouseX,mouseY) && z > 0){
      boo = true;
     ellipse(x, y, 20+z, 20+z); 
    z--; 
    }
    else boo = false;
  }
  
  void move(){
   if(fear > 0){fear--;}
   if(x<=10){ x = 10; blu = blu+0.5;}
   if(x>=490){ x = 490; blu = blu+0.5;}
   if(y<=10){ y = 10; blu = blu+0.5;}
   if(y>=490){ y = 490; blu = blu+0.5;}
    
    if (happiness > 0){
     state = 0; 
     happy();
    }
     if (happiness < 0){
     state = 1; 
     sad();
    }
  }
  
 boolean radius(int mx, int my){
    float distance = dist(mx,my,x,y);
    if(distance <10){
      return true;
    }
      return false;
    
  }
  
  //0state
  void happy(){
       if(happiness < 255){
       happiness++;
     } 
       if(happiness > 100){
          float distx = x - mouseX;
          float disty = y - mouseY;
          x = x - distx/500 + random(-fear,+fear);
          y = y - disty/500 + random(-fear,+fear);
         }
  }
  //1 state
  void sad(){
    
    if(happiness > -255){
       happiness--;
     }
     if(happiness < -254){
        float distx = x - mouseX;
        float disty = y - mouseY;
        if(x>10 && x<490){
        x = x + distx/500 + random(-1-fear,1+fear);
        }
        if(y>10 && y<490){
        y = y + disty/500 + random(-1-fear,1+fear);
        }
      }
  
  }
  //after pop
  void scare(float sacrex, float scarey){
   fear = 40;
   happiness = happiness - random(255);
  }
}


