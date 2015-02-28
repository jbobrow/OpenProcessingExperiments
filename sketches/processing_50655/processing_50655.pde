
//Ball bounce by Bogart Bockman 
//The Unpredictaball
float x;
float y;
float xV;
float yV;
float xa;
float ya; 



//runs once
void setup(){
  size(600,600);
  //Assign value
  reset();
}

//this is run at 60fps}
void draw(){
  background(0);
  yV += ya;//causes ball to accelerate downward each 
  x += xV;
  y += yV;
  if(x > 600){
    x = 600;
    xV *= -1;
    ya *= -1;
    }else if (x < 0){
    x = 0;
    xV *= -1;
  }
    if(y > 600){
    y = 600;
    yV *= -1;    
  }else if (y < 0){
    y = 0;
    yV *= -1;
    
  }


  ellipse(x,y,23,23);
  println(x);
  println(y);
  
}
/*weavermount helped debug and make this work. 
Without him I would still be at ther level of "Screen saver thing"
*/
void reset(){
  x = 10;//floor(random(0));
  y = 10;//floor(random(1,10));
  xV = 10;//floor(random(-10,10));
  yV = 0;//floor(random(-10,10));
  xa = .2;
  ya = .2;
  
}




