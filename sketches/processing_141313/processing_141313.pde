
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
  
  if (ball1.intersect(food1)){
    ball1.change(); //trying to create a change in ball color when it intersects
    food1.reset(); // food will reset upon intersection
    
  }
  
  food1.display();  //display food
  ball1.display();  // display ball
  ball1.keyPressed(); // make sure key commands work... not sure if this is necessary
  
}

class food {
  float xpos, ypos; // variables for food
  
  food (){
    xpos = random(100, width - 100);
    ypos = random(100, height - 100);
  }
  
  void display(){
    fill(255);
    noStroke();
    ellipse(xpos,ypos,10,10);
  }
    
  void reset(){
    xpos = random(100, width - 100);
    xpos = random(100, height - 100);
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
    c = color(255, random(255),245);
  }
    
  void display(){
    fill (c);
    noStroke();
    ellipse(x,y,r,r);
      
  }
 //key commands
//ball moves in response to key command
  void keyPressed() {
    if (key == CODED){
      if (keyCode == UP){
        y = y-5;
        //perimeter created with if statements under each keycode
                        if(y <= 25){
        y = 25;
                }
      }
       
      if (keyCode == DOWN) {
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
    } 
    if (keyCode == LEFT) {
      x = x-5;
                            if(x <= 25){
        x = 25;
                }
 
    }
  }
    //need help here trying to get the intersection to work.
    boolean intersect(food f) {
    
    float distance = dist(x,y,f.x,f.y); // Calculate distance
    
    // Compare distance to sum of radii
    if (distance < r + f.r) {
      return true;
    } else {
      return false;
    }
  }
}
