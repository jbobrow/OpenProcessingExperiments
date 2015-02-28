
int x=20;
int y=20;

int dx=0;
int dy=1;

void setup()  {  //setup function called initially,only once
     size(300,250);
}

void draw()  {  //draw function loops
background(8,50,255)
    ellipse(x,y,20,20);
    
    y=y+dy;
    
    if(y>250){
       dy=-dy;
       }
       
       
       
       
    if(mousepressed)}
       x=mouseX;
       y=mouseY;
       }
}
