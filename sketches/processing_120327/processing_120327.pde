

int x;            // X-coordinate
int y;             // Y-coordinate
int xSpeed;
int ySpeed;

 
 
void setup() {
size(400,400);

 
smooth();
//start position
x=0;
y=0;
//set initial speed
xSpeed=10;
ySpeed=6;
}
 
void draw() {
 
 x=x+xSpeed;
y=y+ySpeed;
 
//right boundary 
if (x >= width) {
  xSpeed = xSpeed * -1;
//ball bounces off the right hand side of the sketch window
// if position of ball is more than the width of the sketch window the x cordinate will now be multiplied by -1
   
}
//left boundary
if ( x<= 0){
   xSpeed = xSpeed * -1;
   //ball bounces off the left hand side of the sketch window
   // if position of ball is less than 0 the x cordinate will now be multiplied by -1
   
}
//bottom boundary
if (y >= height){
   ySpeed = ySpeed * -1;
   //ball bounces off the bottom of the sketch window
   //if position of ball is more than the height of the sketch window the y cordinate will now be multiplied by -1
}

//top boundary
if ( y<= 0){
  ySpeed = ySpeed * -1;
  //ball bounces off the top of the sketch window
   // if position of ball is less than 0 the y cordinate will now be multiplied by -1
}
  
  background( y, x, 100);
  //backgroung changes according to the X and Y cordinates of the ball. 
  // Y = red, x = green, and blue stays at 100
 
//draw neck

stroke(0);
fill(235,176,74);
ellipse(200,154,50,25);

stroke(0);
fill(235,176,74);
ellipse(200,179,50,25);

stroke(0);
fill(235,176,74);
ellipse(200,204,50,25);

//draw head
stroke(0);
fill(235,176,74);
ellipse(200,100,150,80);

// draw eyes

stroke(0);
fill(255);
ellipse(165,100,50,50);

stroke(0);
fill(255);
ellipse(235,100,50,50);

stroke(0);
fill(36,70,206);
ellipse(237,110,20,20);

stroke(0);
fill(36,70,206);
ellipse(167,110,20,20);


// draw mouth

stroke(0);
line(190,130,210,130);

//draw body

stroke(0);
fill(235,176,74);
ellipse(200,300,140,170);

stroke(0);
fill(mouseX,0,0); //position of mouse pointer on the x axis determines on weather the body of the alien is red or black
ellipse(200,300,100,130);


//draw feet

stroke(0);
fill(235,176,74);
ellipse(160,378,15,15);
stroke(0);
fill(235,176,74);
ellipse(175,380,15,15);
stroke(0);
fill(235,176,74);
ellipse(190,382,15,15);

stroke(0);
fill(235,176,74);
ellipse(210,382,15,15);

stroke(0);
fill(235,176,74);
ellipse(225,380,15,15);

stroke(0);
fill(235,176,74);
ellipse(240,378,15,15);

//draw arms
stroke(0);
line(100,200,150,270);
stroke(0);
line(300,200,250,270);

//draw hands

stroke(0);
fill(235,176,74);
ellipse(100,200,20,30);

stroke(0);
fill(235,176,74);
ellipse(300,200,20,30);

//bouncing ball

// grey ball bounces off the boundaries 
stroke(0);
fill(100);
ellipse(x+20,y+20,75,75);

if (mousePressed) {
  if (mouseButton == LEFT) {
   // if left mouse button is clicked, the ball is filled with white
   // if right mouse button is clicked, the ball is filled with black
stroke(0);
fill(255);
ellipse(x+20,y+20,75,75);
  }else {
    stroke(0);
fill(0);
  }
  ellipse(x+20,y+20,75,75);
}
}

  


