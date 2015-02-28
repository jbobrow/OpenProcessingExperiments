
ball ball1;
food food1;
 
//setting up perimeter to contain ball character
int width = 700;
int height = 700;
  
void setup() {
  size(width,height);
    
  food1 = new food ();
  ball1 = new ball (350,675,50);
}
  
void draw(){
  background(0);
  
  food1.display();  
  ball1.display();
  ball1.keyPressed();
}

class food {
  float xpos, ypos; // variables
  
  food (){
    xpos = random(100, width - 100);
    ypos = random(100, height - 100);
  }
  
  void display(){
    fill(255);
    noStroke();
    ellipse(xpos,ypos,10,10);
  }
}
  
  
class ball {
  float x;
  float y;
  float speed;
  float w;
    
  ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
 
  }
    
  void display(){
    fill (255,20,245);
    noStroke();
    ellipse(x,y,w,w);
      
  }
 //key commands
//ball flies off page in response to key command
  void keyPressed() {
    if (key == CODED){
      if (keyCode == UP){
        y = y-5;
        //perimeter created with if statements under each keycode
                        if(y <= 25){
        y = 25;
                }
      }
       
      else if (keyCode == DOWN) {
        y = y + 5;
                if(y >= height-25){
        y = height-25;
                }
      }
    }if (keyCode == RIGHT) {
      x = x+5;
                            if(x >= width - 25){
        x = width - 25;
                 
                }
    } else if (keyCode == LEFT) {
      x = x-5;
                            if(x <= 25){
        x = 25;
                }
 
    }
  }
}

