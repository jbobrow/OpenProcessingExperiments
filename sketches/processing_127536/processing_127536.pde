
//tomas aldana
//12142142335
//this keyboard is different from american keyboard

int x=7;
int y=5;

int dx=5;
int dy=5;



void setup() {  //setup function called initially, only once
size(750,500);
background(255); 


}

void draw () {  //draw function loops
fill(0,255,0)
   line(x,y,5,5,2);
   x = x + dx;
   y = y + dy;
    
  if  (x > 750) {
      dx = -5;
 
  }
      else if (x < 0) {
        dx = 2;
   }
 if (y > 500)   {   //Y axis collision
dy *= -1;          //the same as dy = dy*(-1)
}
else if (y < 0) {
dy *= -1;
   }
}
