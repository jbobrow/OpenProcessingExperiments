
//Name:
//Date:
//Project:

void setup() {  //setup function called initially, only once
  size(500, 250);
  background(255);  //set background white
  
}

void draw() {  //draw function loops 
   
   background(255);
   
   fill(255,0,0);
   ellipse(x,y,20,20);
   x = x + dx;
   y = y + dy;
   
   if (mousePressed) {
      x = mouseX;
      y = mouseY;
  }


   if (x < 500) {      //X axis colision
       dx = -9;
  }
   
   else if (x < 0) {
          dx = 9;
   }
   
   if (y > 250) {      //Y axis colison
       dy *= -1;
  }
  
   else if (y < 0)  {
      dy *= -1;
  }
  
 }
 
