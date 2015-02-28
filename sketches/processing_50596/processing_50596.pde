
//Ball bounce by Bogart Bockman 
int x;
int y;
int xV;
int yV;


//runs once
void setup(){
  size(600,600);
  //Assign value
  x = 100;
  y = 250;
  xV = 5;
  yV = 5;
}

//this is run at 60fps}
void draw(){
  background(0);
  x += xV;
  y += yV;
  if(y > 600){
    yV= -5;
    }else if(y < 0){
    yV= 5;
  }
  if(x > 600){
    xV= -7;
    }else if(x < 0){
    xV= 7;
  }
     
  ellipse(x,y,23,23);
  println(x);
  println(y);
  
}


