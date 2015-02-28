
ball ball1;
food food1;
 
//setting up perimeter to contain ball character
int width = 600;
int height = 600;
  
void setup() {
  size(width,height);
    
  food1 = new food ();
  ball1 = new ball (300,575,50);
}
  
void draw(){
  background(0);
  
  if (ball1.intersect(food1)){
    ball1.change();
    food1.reset();
  }
  
  food1.display();  
  ball1.display();
  ball1.keyPressed();
}

class food {
  float xpos, ypos; // variables
  float r;
  
  food (){
    xpos = random(100, width - 100);
    ypos = random(100, height - 100);
    r = 20;
  }
  
  void display(){
    fill(255);
    noStroke();
    ellipse(xpos,ypos,r,r);
  }
    
  void reset(){
    xpos = random(100, width - 100);
    ypos = random(100, height - 100);
  }
}
  
  
class ball {
  
  float x;
  float y;
  float speed;
  float r; //radius 
  color c = color(255,20,245);
  
    
  ball(float tempX, float tempY, float tempR) {
    x = tempX;
    y = tempY;
    r = tempR;
    speed = 0;
 
  }
    void change(){
    c = color(random(255), random(220),random(245));
  }
    
  void display(){
    fill (c);
    noStroke();
    ellipse(x,y,r,r);
      
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
    boolean intersect(food f) {
    
    float distance = dist(x,y,f.xpos,f.ypos); // Calculate distance
    
    // Compare distance to sum of radii
    if (distance < f.r+10) {
      return true;
    } else {
      return false;
    }
  }
}
