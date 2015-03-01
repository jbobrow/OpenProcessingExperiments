
Boolean moving = false;//for the code moving
int triangleA=400;//this is for triangle A (1)
int triangleB=100;//This is for triangle b (2)
int circleX=100;//this is for circle A(1)
int circleY=300;//this is for circle b(2)
void setup() {
size(600,600); //This is the size of the canvas
}
void draw() {
background(#00FFCE);//color for the background

fill(#FC05F1);//the colour of the triangle
  triangle(30,75, 58, 20, 86, 75);//this is for triangle 1, the shape of the triangle"x,y,x,y,x,y"
 
  fill(#FC05F1);// the colour of the triangle
  triangle(420, 75, 450, 20, 486, 75);//this is for triangle 2, the shape of it "x,y,x,y,x,y"
   
   
  fill(#FF0505);//the colour of the circle
  ellipse(50, 500, 50, 50);//this is for circle 1
  
 
  fill(#FF0505);//the colour of the circle
  ellipse(450, 500, 50, 50);//this is for circle 2

  fill(#059DFF);//the colour of the triangle
  if(mousePressed) { triangle(300,75, 300, 20, 200, 75);//if mouse is pressed triangle is created between the two triangles
   
    fill(#059DFF);
  }else rect(mouseX,mouseY,60,60);//if mouse not pressed a square remains with the movement of the mouse
   
  ellipse(circleX,circleY,100,100);//This is for the circle moving
 if (moving) circleX = circleX + 2;//The speed at which the circle moves
  
  fill(#C9FA08);  
  ellipse(circleX,circleY,100,100);// The circle moving
  
} void mousePressed() {
  moving=true;
  circleX=circleY-1;
 


  
  
   }

