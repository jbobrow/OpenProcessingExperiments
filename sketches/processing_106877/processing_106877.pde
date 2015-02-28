
int X=25;
int Y=25;
 
int dX=1;
int dY=1;
void setup() {  //setup function called initially, only once
  size(250, 250);
  
}
 
void draw() {  //draw function loops
    background(25,0,255)
    ellipse(X,Y,20,20);
     
    Y=Y+dY
     
    if(Y>250){
      dY=-dY
      X=X+100
    }
     
    if(Y<0){
      dY=-dY
      X=X+100
    }
     
    if(mousePressed){
      X=mouseX
      Y=mouseY
    }
}
