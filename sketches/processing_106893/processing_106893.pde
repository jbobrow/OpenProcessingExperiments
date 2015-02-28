
int x=20;
int y=20;

int dx=0;
int dy=0;
void setup() {  //setup function called initially, only once
     size(200,300);
}

void draw() {  //draw function loops 
     background(222,25,255);
     ellipse(x,y,20,20);
     
     if(key=='d'){
       dx=1;
       dy=0;
     }
     
     if(key=='s'){
       dy=1;
       dx=0;
     }
     
     if(key=='a'){
       dx=-1;
       dy=0
     }
     
     if(key=='w'){ 
       dy=-1;
       dx=0;
     } 
     
     x=x+dx;
     y=y+dy;
     }
