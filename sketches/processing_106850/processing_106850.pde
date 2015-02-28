
int X=20;
int Y=20;

int dX=1;
int dY=1;
void setup()  {  //setup function called initially, only once
    size(250,250)

}

void draw()  {  //draw function loops
    background(230,205,255)
    ellipse(X,Y,20,20);

    Y=Y+dY

    if(Y>250){
     dY=-dY
    }
    
    if(Y<0){
      dY=-dY
    }
    
    if(mousePressed){
      X=mouseX
      Y=mouseY
    }
}
