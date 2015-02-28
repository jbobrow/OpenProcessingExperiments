
float Ax;
float Ay;
float Bx;
float By;
float Cx;
float Cy;
float x=120;
float y=0;
 int speed = 1;
 
void setup(){
size(700,700);
smooth();
frameRate(55);
colorMode(HSB,359,100,100,100);
 
}
 
void draw(){
  Ax = (mouseX);
  Ay = (mouseY-100);
  Bx = (mouseX-100);
  By = (mouseY+100);
  Cx = (mouseX+100);
  Cy = (mouseY+100); 
  background(0);
  fill(255);
 
  //ellipse(Ax,Ay,10,10);
  //ellipse(Bx,By,10,10);
  //ellipse(Cx,Cy,10,10);
  
x = x + speed;
if ((x > 245) || (x < 0)) {
  speed = speed *-1;
}
 

 mouseY = mouseY+speed;
if ((mouseY > width) || (mouseY < 0)) {
  speed = speed *-1;
} 
 mouseX = mouseX+speed;
if ((mouseX > width) || (mouseX < 0)) {
  speed = speed *-2;
}
if (mousePressed){
  for(int j=0; j<700; j+=9){
   noFill();
   stroke(359,100,100);
   strokeWeight(1);
   line(Ax,Ay,j,j);
   stroke(231,100,100);
   line(Bx,By,j,j);
   stroke(58,100,100);
   line(Cx,Cy,j,j);
   stroke(x,100,100);
   triangle(Ax,Ay,Bx,By,Cx,Cy);
   scale(.8);
   strokeWeight(1/.8);
  }
   
}
}


