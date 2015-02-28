
int dm= 30;
float x1 = dm;
float x2 = dm;
int direction1 =1;
int direction2 =1;
float speedGreen = 0.5;
float speedRed = 1.0;

void setup(){
  size(300, 100);
}

void draw(){
  background(200);
  
    if((x1+dm==width-x2)||(x1-(dm/2)==0)) {
    direction1= -direction1;
    
  }
  if ((x1+dm==width-x2)||(width-x2+(dm/2)==width)){
    direction2 = -direction2;
  }
   

  fill(0, 255, 0);
  x1 += speedGreen*direction1;
  ellipse(x1, height/2, dm, dm); 
  
  fill(255, 0, 0);
  x2 += speedRed*direction2;
  ellipse(width-x2, height/2, dm, dm);
}  

