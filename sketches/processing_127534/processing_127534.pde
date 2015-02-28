
//Camila Diaz
//1/9/14    
//Screen saver

int x=50;    //variables
int y=50;

int dx=9;    //velocity
int dy=5;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  
}

void draw() {  //draw function loops
    fill(0,0,204) 
    ellipse(x,y,50,50);
    fill(127,0,255);
    ellipse(y,x,50,50);
    fill(255,255,0);
    ellipse(mouseX,mouseY,60,60);
    
   
     x = x + dx;
     y = y + dy;
 
 if (x > 500) {        //X axis collision
     dx=-9;
 }
 else if (x < 0) {
     dx=9;
 }  
 
 if (y > 500) {             //Y axis collision
     dy *= -1;            //the same as dy = dy*(-1)
 }    
 else if (y < 0) {
     dy *= -1;
}
}
