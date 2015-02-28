

float Y = 0;
float X = 0;
void setup(){
  background((color)225, 200, 5);
  size(500, 500);
}

 void draw() {  
  background(0,0,0);
   X = X+ 2;
   Y = Y+ 2;
fill(255,255,255);
ellipse(275,Y,80,80);
ellipse(235,X,45,45);
if(Y>500){
   Y=22;
}
if(X>500){
  X=0;
}
}    


