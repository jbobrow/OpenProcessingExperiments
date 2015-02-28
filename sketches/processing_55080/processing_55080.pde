
import netscape.javascript.*;

float angle = 0;
float speed = 0.8;
float x = 0;
float y = 0;
float y0 = 100;
float w = random(5,30);


void setup (){
  size (500,200);
  noStroke();
  smooth();
  background(0);
}

void draw(){
    noStroke();
    fill(0,7);
    rect(0,0,width,height);
    fill (255, 100);
    angle += speed;
   if (x<width) {
       x ++;
   }else{
     x = 0;
   }

     y= y0 + 10 * sin(angle/w);
     ellipse(x,y,20,20);

  
}

