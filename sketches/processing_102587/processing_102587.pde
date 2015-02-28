
void setup (){  
size (640,480);
smooth();
}

//define color names
color red= color(255, 0, 0);
color blue= color(0, 0, 255);
color black= color(0, 0, 0);
//assign to value a color
int value = blue;
int value2 = blue;
int value3 = blue;
boolean overBox = false;
boolean overBox2 = false;
boolean overBox3 = false;
//define ball aprameteres
float ballX = 400;
float ballY = 0;
float speedX =16;
float speedY =32;
int hittime = 0;
int hit = 0;
int miss = 0;
//rect appear aparameters
float r1x = random(1,560);
float r1y= random (1,400);
float r2x = random(1,560);
float r2y= random (1,400);
float r3x = random(1,560);
float r3y= random (1,400);

void draw (){
background (255);
stroke(0);

// Test if the cursor is over the box 
if (mouseX > r1x && mouseX < r1x+80 && mouseY > r1y && mouseY < r1y+80 && mousePressed == true) 
      {
       overBox = true;  
      }       
if (overBox) 
             {
              value = red;
              overBox = false;
             }     
//if ball enters rect, paint it black
  if (ballX +25 > r1x && ballX -25< r1x+80 && 
      ballY +25 > r1y && ballY -25< r1y+80 )
      {value = black;
      hit += 1;
      }
//draw first rect
fill(value);
rect(r1x, r1y ,80 , 80);



// Test if the cursor is over the box2 
if (mouseX > r2x && mouseX < r2x+80 && mouseY > r2y && mouseY < r2y+80 && mousePressed == true) 
      {
       overBox2 = true;  
      }       
if (overBox2) 
             {
              value2 = red;
              overBox2 = false;
             }     
             
//if ball enters rect3, paint it black
  if (ballX +25 > r2x && ballX -25< r2x+80 && 
      ballY +25 > r2y && ballY -25< r2y+80 )
      {value2 = black;

      hit += 1;
      }
//draw second rect
fill(value2);
rect(r2x, r2y ,80 , 80);
println(ballX + "," + ballY);


// Test if the cursor is over the box3 
if (mouseX > r3x && mouseX < r3x + 80 && mouseY > r3y && mouseY < r3y + 80 && mousePressed == true) 
      {
       overBox3 = true;  
      }       
if (overBox3) 
             {
              value3 = red;
              overBox3 = false;
             }     
             
//if ball enters rect2, paint it black
  if (ballX +25 > r3x && ballX -25< r3x +80 && 
      ballY +25 > r3y && ballY -25< r3y + 80 )
      {value3 = black;

      hit += 1;
      }
//draw second rect
fill(value3);
rect(r3x, r3y ,80 , 80);
println(ballX + "," + ballY);



//bounce against walls  
if (ballX  < 0 || ballX  > width) speedX = -speedX ;
if (ballY >height || ballY  <0) speedY = -speedY;
    
//move the ball
  ballX +=speedX; 
  ballY +=speedY;
  
//fill(value);
  fill(black);
  ellipse(ballX, ballY, 50, 50);
  text ("hit:" + hit , 10, 10);
}



