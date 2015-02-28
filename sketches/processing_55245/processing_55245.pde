
/* YSDN Interactivity 1006 Assignment 2D
code by Anne Marie Hood
*/

int circle = 40;
int a = 255;
int b = 255;
int c = 255;
int d = 100;
float x= 100;
float y= 100;

void setup(){
  size (500,500);
  background (255);
  noStroke();
  fill (#71c9f1);
  rect (0,0,width/2,height);
  fill (0);
  rect (width/2,0,width/2,height);
  //creates the blue and black halves for the background
}

void draw (){
  fill (255,255,0);
  arc(width/2,height/2,103,103,PI/2, PI+PI/2);
  fill (255);
  arc(width/2,height/2,103,103,-PI/2, PI-PI/2);
  //creates the half moon and half sun
}

void mouseDragged(){
  fill (a,b,c,d);
  ellipse (x, y, circle, circle);
  
  if (mouseX>width/2) {
    circle= 8;
    x=random(255,500);
    y=random(0,500);
    //draws random small circles when the mouse is on the right half
  }  else if (mouseX<width/2){
    circle=40;
    x=mouseX-20;
    y=mouseY-20;
    //draws larger circles where the mouse is on the left side
    }
       
  if (mouseX>width/2) {
     c= 0;
     //the drawn circles on the right are yellow
  }  else if (mouseX<width/2){
      a= 255;
      b= 255;
      c=255;
      d=100;
      //the drawn circles on the left are white
    }
 }
 
void mousePressed(){
  fill (#71c9f1);
  rect (0,0,width/2,height);
  fill (0);
  rect (width/2,0,width/2,height);
  //when the mouse is clicked the screen is cleared
}
      

   
  

