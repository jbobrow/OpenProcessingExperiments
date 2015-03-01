
int counter;
int x;
int y;

void setup() {  //setup function called initially, only once
  background(255);
  size(400, 400);
}

void draw() {  //draw function loops 
    ellipse(x, y, 20, 20);
if (key =='d'){           //right
    x = x+1;}
if (key == 's') {       //down
    y = y+1;}
if (key == 'a') {         //left
    x =x-1;}
 if (key == 'w') {       //up
    y=y-1;}
    
}
