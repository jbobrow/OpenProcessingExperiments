
//Ball bounce
int x;
int y;
int xV;
int yV;
 
 
//changes the size of the screen
void setup(){
size(300,300);
  
  //Assign value for each 
  x = 100;
  y = 250;
  xV = 5;
  yV = 5;
}
 
//this changes the background colour to black and makes the ball run at 60 feet per second}

void draw(){
  background(0);
  x += xV;
  y += yV;
  if(y > 300){
    yV= -5;
    }else if(y < 0){
    yV= 5;
  }
  
  //if x is greater than 300 then it's -2 but if x is less then 0 then it moves over 2
  if(x > 300){
    xV= -2;
    }else if(x < 0){
    xV= 2;
    
//drawing the circle, it's colour fill    
  }
  smooth(); 
  fill ( 199, 40, 60);
  ellipse(x,y,23,23);
  println(x);
  println(y);
   
}

                
                
