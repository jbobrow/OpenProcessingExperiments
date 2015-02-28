
int x_position=1;
int x_speed=10;
 
void setup() {
  size(400, 400);
}
 
void draw() {
  background(0);
  x_position=x_position+x_speed;
  ellipse(x_position, 200, 50, 50);
 
 
  
  if (x_position>400) {
    
    x_speed=-10;
    ellipse(x_position, 200, 50, 50);
  }
  
  if (x_position<0) {
   
    x_speed=10;
    ellipse(x_position, 200, 50, 50);
  }
}
     
                
