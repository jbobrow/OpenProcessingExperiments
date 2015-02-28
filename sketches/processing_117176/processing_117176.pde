
class Ball{
  float x;
  float y; 
  float speedX;
  float speedY;
  Ball(int temp_x, int temp_y) {
    x= temp_x;
    y= temp_y;
    speedX = 3;
    speedY = 7;
}

void display () { 
    noStroke();
    fill(122,0,0);
}

void update (){
  background (0);
  ellipse(x,y,30,30);
  x+= speedX;
  y+= speedY;
 
ellipseMode(CORNER);  
fill(0);
ellipse(25, 25, 50, 50);  
ellipseMode(CORNERS);  
fill(100);  
ellipse(25, 25, 50, 50);

 fill(122,0,0);
   ellipse(x,y,20,20);
   
   fill(122,0,0);
   ellipse(x,y,100,100);
   
   fill(122,0,0);
   ellipse(x,y,600,600);
   
   fill(122,0,0);
   ellipse(x,y,100,100);
   
   fill(122,0,0);
   ellipse(x,y,5,5);
   
   fill(122,0,0);
   ellipse(x,y,200,200);
   
   fill(122,0,0);
   ellipse(x,y,250,250);
   
   fill(122,0,0);
   ellipse(x,y,300,300);
     
   fill(122,0,0);
   ellipse(x,y,800,800);
   
   fill(122,0,0);
   ellipse(x,y,3,3);
      
   fill(122,0,0);
   ellipse(x,y,1,1);
   
  noStroke();
  fill(122);
  ellipse(random(width),random(height),x,y);
  fill(122);
  ellipse(random(width),random(height),x,y);
  fill(122);
  ellipse(random(width),random(height),x,y);

fill(122,0,0);
   ellipse(x,y,100,100);
 if (y > height){
    speedY *= -1;
  }
  if (y < 0){
    speedY*= -1;
  }
  if (x > width){
    speedX *= -1;
  }
  if (x < 0){
    speedX *= -1;


}
  }
}




