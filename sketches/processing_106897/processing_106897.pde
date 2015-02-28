
int x=20;
int y=20;

int dx=0;
int dy=0;
void setup() {  //setup function called initially, only once
     size(200,300)

}

void draw() {  //draw function loops
     background(255,255,255) 
     ellipse(x,y,20,20);
     
     if(key== 'd'){
     dx=1;
     dy=0;
}
     if(key== 's'){
     dx=1;
     dy=0;
}
     if(key== 'a'){
     dx=1;
     dy=0;   
}
       
     if(key== 'w'){
     dx=-1;
     dy=0;  
     }
      
      x=y+dx;
      y=y+dy;
}
