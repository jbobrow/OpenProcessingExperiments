
int counter;
Ant a;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  a = new Ant(width/2,height/2);
}

void draw() {  //draw function loops 
  
  showAnt(a);
  
  
}


public class Ant{

   float x;
   float y;
   
   public Ant(float x, float y){
      this.x = x;
      this.y = y;
   }
   
   public void moveLeft(){
      x = x - 0.1;
   }
   
   public void moveRight(){
      x = x + 0.1;
   }
   
   public void moveDown(){
      y = y + 0.1;
   }
   
   public void moveUp(){
      y = y - 0.1;
   }
      
   
}

public void showAnt(Ant a){
   point(a.x,a.y);
}

                
                
