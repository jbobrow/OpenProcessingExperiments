
//Classes//
//variables for ball//
float ballX = 500;
float ballY = 50;
float speedX = 10;
float speedY = 2;

//scoreboard//
int hit = 0 ; //decleration statements for scoreboard//
int miss = 0 ; 

int moveY, moveX;//background triangle// //decleration statement for integers//





//Setup// //do once//

void setup ()  //do this once and remain same//
{
  size(800,600); //size of window//
  smooth (); //anti aliasing helps with moving objects on screen and continuity//
  frameRate (20);// control speed of game and testing//
} 



//draw, repeated//

void draw () // repeat anything in this section//


{  background(ballY,ballX,50); //background controlled by balls x/y// 
  
  // click to change background colour of objects//
  if(mousePressed) {
    fill(0); 
    
    
  } else {
    fill(255);

 
  }// reset scores and stage size//
  {if(mousePressed){ hit = 0; miss = 0; } //conditional to reset scores when clicked//


  ballX += speedX;  //combine defnition with assignment//
  ballY += speedY;

//paddle//
  float paddle = 1000/ (hit + 5 );//paddle size//
  if(ballX < 0 || ballX > width) speedX = -speedX; //boundaries left and right//
  if(ballY > height -75){   //boundaries up and down// //conditional for decision//
    speedY = -speedY;    //speed//
    float distance = abs (mouseX - ballX); //assign absolute value to distance//
   if(distance < paddle ) hit += 1; //boolean theory// 
  else miss += 1; 
  } else speedY += 1;


  
  







  
  
  
  
  
  //for bottom background triangle//
stroke (0); 
fill(ballX,0,255,50); //colour//
beginShape();//begin drawing//
vertex(0,0);//point 1//
vertex(800,0);//point 2//
vertex(ballX-10,ballY-10);//point 3 controlled by the balls xposition//
 
endShape(); //end drawing stage//
moveY++; //increment x by 1 to create movement//
moveX++; //increment Y by 1 to create movement//


//top background triangle// //same process as before//
stroke (0); 
fill(ballX,255,255,150);
beginShape();
vertex (0,600);
vertex(800,600);
vertex(ballX-10,ballY-10);

endShape();
moveY++;
moveX++;

// last triangle shadow, same process but reduce first two vertex yaxis by 100pixels, transparency at 150 helps blend //
stroke (0); 
fill(ballX,255,255,100);
beginShape();
vertex (0,500);
vertex(800,500);
vertex(ballX-10,ballY-10);

endShape();
moveY++;
moveX++;







  fill (255,80,86); //colour for ball//
  ellipse(ballX, ballY, 50,50); //create ball controlled by class//
  fill (255,0,0);//colour for paddle//
  ellipse(mouseX,height -34, 2*paddle, 10); //used ellipse as decrementing was less noticable//

  
  
fill (0); //adding text onto screen last as its least important//
text("Hit " + hit, 10, 100) ;
text("Miss " + miss, 10, 120) ; 

fill (#294BFF);
text("Attempt to get 100 hits and no misses!!!", 50,30);

fill(0);//black colour for text//

text("Disco Ball!", 675, 100);
textSize(20);
text("By Pete Jones", 675,120);

text("Click to reset scores and paddle!!", 20,590);




}
}

