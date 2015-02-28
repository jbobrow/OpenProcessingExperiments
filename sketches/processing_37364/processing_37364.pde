
int directionx;
int directiony;
int x;
int y;

void setup(){
  size(600,600);
directionx =2;
directiony =6;
x = 350;
y = 50;
}

void draw(){
x += directionx;
y += directiony;
  strokeWeight(2);
             if(x < 300) { 
              stroke(255, 242, 0);} 
            else{
              stroke(1, 255, 193);
                }
            if(y < 300) { 
              fill(57, 242, 34);} 
            else{
              fill(185, 39, 193);
                }
ellipse(x,y,40,40);
if(x > 600){
      directionx = -7;}
      if(x < 0){
      directionx = 4;}
   
if(y > 600){
      directiony = -5;}
      if(y < 0){
      directiony = 2;}

}

