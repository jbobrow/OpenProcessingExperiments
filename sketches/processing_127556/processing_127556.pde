
//tomas aldana
//12142142335
//this keyboard is different from american keyboard

int x=50;
int y=50;

int dx=9;
int dy=5;



void setup() {  //setup function called initially, only once
size(500,500);
background(500); 


}

void draw () {  //draw function loops
   
   ellipse(x,y,20,20,2);
   x = x + dx;
   y = y + dy;
   
   if (mousePressed){
   x = mouseX;
   y = mouseY;
    }
    /************************/
  if  (x > 500) {
      dx = -9;
 
  }
      else if (x < 0) {
        dx = 9;
   }
   
   /************************/
   
 if (y > 250)   {   //Y axis collision
dy *= -1;          //the same as dy = dy*(-1)
}
else if (y < 0) {
dy *= -1;
   }
}
