
//declare 2D array of objects

circle[][] grid;

//number of columns and rows in the grid
 int cols=30;
 int rows=30;

void setup(){
  size(460,460);
  
  grid= new circle[cols][rows];

//initialize each element of circle array
  for (int i=0; i<cols; i++){
    for (int j=0; j<rows; j++){
    grid[i][j]=new circle(color(255,j*10,i*15,210),((i+1)*15),((j+1)*15),3);
   }
  }
}
  
  void draw(){
    background(0);
    
    //run each element of circle array
    for (int i=0; i<cols; i++){
      for (int j=0; j<rows; j++){
      grid[i][j].display();
      grid[i][j].grow();
      }
    }  
  }
  


class circle {
  
  float x;
  float y;
  int diam;
  color c;
  int speed=1;
  boolean launch;
  
  circle(color c_,float x_,float y_,int diam_){
    c=c_;
    x=x_;
    y=y_;
    diam=diam_;
  }
  
  void display(){
    noStroke();
    fill(c);
    ellipse(x,y,diam,diam);
  }
  
  void grow(){  
    
     
    if ((mouseX>(x-diam) && mouseX<(x+diam)) && (mouseY>(y-diam) && mouseY<(y+diam))){
      launch=true;
    } 
    
        if (launch) { 
      diam=diam+speed;
    }  
   
    if (diam>200){
      diam=0;
    }
  }
  
  
}
