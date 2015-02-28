
//*code written by Erika Sternberg

//defining variables, one for adding to positio
//second for decreasing postion and third to define radius
int a = 100;
int b = 500;
int r = 200;

//sketch draws the following once,
//stays consistant throughout sketch
void setup(){
  size (600,600);
  background (#EDDFEA,50);
  noStroke();
  smooth();
}

//this portion is constinuously redrawn
void draw() {
//second background hides trail of the circles
  background (#EDDFEA,10);
//mouse position affecting RGB values 
//gradually changes fill colour based on mouse movement
  fill (mouseX/2,mouseY/2,50,65);
  ellipse (a,height/2,r,r);
  ellipse (b,height/2,r,r);
  fill (mouseX,mouseY,50,65);
  ellipse (width/2,a,r,r);
  ellipse (width/2,b,r,r);
 
//codes defining motion 
  a += 2;
  b -= 2;
  
//if statements for repitition
  if(a>300) {
    a = 100;
  }
   if(b<300) {
    b = 500;
  }
}


