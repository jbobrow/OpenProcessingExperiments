
void setup() {
  size(250,250);
  colorMode (HSB,width);
  frameRate (20);
  background (0);
  
}


int x = 0;

void draw() {  
 
  if(x < 100){
 
    fill(x,width,width);
   noStroke();
   ellipse (width/2,height/2, x, x);
    x++;
  }

 if(x == 150){
 
    fill(x,width,width);
   noStroke();
   ellipse (width,height, x, x);
    x++;
 }
  if(x > 150){
 
    fill(x,width,width);
   noStroke();
   ellipse (width/2,height/2, 50, 50);
    x++;
  }
   
 
fill(x,width,width);{
  
   ellipse (x,x, 50, 50);
   x++;
  }
 
  }


