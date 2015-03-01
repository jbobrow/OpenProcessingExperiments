
int counter;
int x;
int y;



void setup() {  //setup function called initially, only once
  size(400, 400);
 }

void draw() {  //draw function loops 
background(0);
 fill(255,255,255);
 ellipse(x,y,20,20);
 if(key=='d'){
 x=x+1;
 }
 if(key=='s'){
 y=y+1;
 
 }
 
 }
