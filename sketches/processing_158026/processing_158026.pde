
int counter;
int x;
int y;
void setup() {  //setup function called initially, only once
  size(400, 400);
}

void draw() {  //draw function loops 
 ellipse(x,y,20,20);
 
 if (key== 'd')
 {//right
     
 x=x+1;}
 if(key== 's')
 {//left
 y=y+1;}
 if (key== 'a')
 {//down
 }
 if(key== 'w')
 {//up
 }
  }
