
int square_width = 15;
float acceleration = 0.0;

class Square{
  float x,y,theta;
  float direction;
  
  Square(float a, float b, float t)
  {
    x = a;
    y = b;
    theta = t;
    direction = 1.0;
  }
  
  void change_angle(float t){
    theta = t;
  }
  
  void change_Xcoord(float i){
    x = i;
  }
  
  void change_Ycoord(float i){
    y = i;
  }
  
  void change_direction(float d){
    direction = d;
  }
}


Square squaresArray[][];

/**
 * initialize the default squares
 */
void generate_squares(){
  squaresArray = new Square[height/square_width][width/square_width];
  for (int y = 0; y < height/square_width; y++) {
    for(int x = 0; x < width/square_width; x++){
      squaresArray[y][x] = new Square(x*square_width,y*square_width,0);
    }  
  }

}

void setup() {
  size(510, 600);
  background(255);
  frameRate(30);
  noFill();
  
  generate_squares();
}

void mouseClicked(){
  for (int y = 1; y < squaresArray.length - 1; y++) {
    for(int x = 1; x < squaresArray[y].length - 1; x++){
      int a = Math.round(random(0,1));
      if(a == 0)
        a = -1;
      
      squaresArray[y][x].change_direction((float)a);
    }
  }
}

void draw(){

  // refresh screen
  background(255);
  
  
  float should_move;  // decides whether we should change Y coord
  if(!mousePressed)   // if user is dragging
  {
    acceleration = acceleration/1.1;
    should_move = 0.0;
  }
  else        // the user let go
  {
    acceleration = (mouseX - pmouseX)*0.007;
    should_move = 1.0;
  }
  
  // loop through to draw squares
  for (int y = 1; y < squaresArray.length - 1; y++) {
    for(int x = 1; x < squaresArray[y].length - 1; x++){
      
      Square square = squaresArray[y][x];
      
      pushMatrix();
      
      // rotate the square by theta
      translate((int)square.x,
            (int)square.y);
      rotate(square.theta);
      
      // record new angle
      square.change_angle(square.theta + 
                  acceleration*(y/height + 1)*
                  (y*random(0.0,0.05) * 
                  square.direction));
      
      // record new y location (squares slowly shift downward)
      square.change_Ycoord(square.y + 
                  abs(acceleration)*
                  should_move*
                  ((y*y)/100.0));
      
      // draw the rectangle
      rect(0,0,square_width,square_width);
      
      popMatrix();
    }
  }
}

