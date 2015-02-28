
float initial_side = 50; 
Square[] squares = new Square[1];  
int count = 0; 
 
 
void setup(){ 
  size(800, 600); 
  background(0,0,0);
  smooth(); 
  colorMode(HSB, 100); 
  squares[0] = new Square(100, 100);
 
} 
 
 
 
void draw(){ 
  fill(100, 0, 0, 20);           
  //rect(0, 0, width, height); 
  for(int i=0; i < count; i++ ){ 
    if(squares[i] != null)
      squares[i].draw();  
  } 
} 
 
void mousePressed(){ 
  count++; 
  squares = (Square[]) expand(squares, count+1); 
  squares[count] = new Square(random(width-initial_side), random(height-initial_side));
} 
 

class Square{ 
  boolean growing = true;
  float obj_x, obj_y, obj_color; 
  float side = 0;
  
  Square (float x, float y){ 
    obj_x = x; 
    obj_y = y;  
    obj_color = random(100); 
    side = initial_side;
  } 
  
  void environmentCollision(){
    // right border 
    if(obj_x > (width - side)) growing = false;
    // left border    
    if(obj_x <= 0) growing = false;                 
     // bottom
    if(obj_y > (height-side)) growing = false;         
   // top 
    if(obj_y <= 0) growing = false;
 }
  
  void othersCollision(){
    for(int i=0;i<squares.length;i++){
      //VERTICAL COLLISION 
      
      if(obj_y+side > (squares[i].obj_y) && obj_y+side < squares[i].obj_y+squares[i].side){ 
        if(obj_x+side >= squares[i].obj_x && obj_x <= squares[i].obj_x+squares[i].side){
          growing = false;
          squares[i].growing = false;
          
        }
      } 
      
      //HORIZONTAL COLLISION
      if(obj_x+side > (squares[i].obj_x) && obj_x+side < squares[i].obj_x+squares[i].side){
        if(obj_y >= squares[i].obj_y && obj_y<= squares[i].obj_y+squares[i].side){
           growing = false;
           squares[i].growing = false;

        }
      }
    }
  }
   
  void draw(){ 
    fill(obj_color, 100, 100, 40);            
    rect(obj_x, obj_y, side, side); 
    environmentCollision();
    othersCollision();
    if(growing)
      side++;
  } 
} 


