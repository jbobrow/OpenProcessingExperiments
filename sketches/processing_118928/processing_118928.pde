
///////////////////////////////
//      Assignment 3         //
//    Put out the fire       //
//          GAME             //
//                           //
//       Karim Kadi          //
//        0065865            //
///////////////////////////////

//global variables
float fc= 0; //frame counter variable 
int rFireXPos = 0; //random position for Fire varibale 
int rFireYPos = 0; 
int rLakeXPos = 0; //random position for Lake variable
int rLakeYPos = 0;
int rLSXPos = 0;//random position for Landing Strip Variable
int rLSYPos = 0;
int planeX = 0; //plane's pos
int planeY = 0; 
int bs1x =20; //bouncy square 1 pos
int bs1y = 20;
int bs2x =20; //bouncy square 2 pos
int bs2y = 460;
int bs3x = 620; //bouncy square 3 pos
int bs3y = 20;
int bs4x =620; //bouncy square 4 pos
int bs4y = 460;
boolean bsIsRt = true; //bouncy square dir rt / lt
boolean bsIsUp = false; //bs dir up/ down
float angSqr = 0; //angle of red bouncy square
float rRotSqr = random(-8, 8);//random amount of rotation for bouncy red square
boolean gameOn = false; //statement used that when the mouse is clicked the game turns on






//begining of code (startup)
//has size and main background
void setup()
{
  size(640, 480); //window size
  background(59, 224, 92); //grass green bg
  smooth(); //draw smooth
  
  
  //generating random position of Lake, Fire & Landing Strip 
  //creates only 1 random position for each element every 
  //time you open the program
  //random pos has contraints making sure it is always on the screen
  //but also never overlapping with the purple enemies
  rFireXPos = int(random(40, width-40));
  rFireYPos = int(random(40, height-40));
  rLakeXPos = int(random(40, width-40));
  rLakeYPos = int(random(40, height-40));
  rLSXPos = int(random(40, width-40));
  rLSYPos = int(random(40, height-40));  

  randPos();
}//end of setup 







void draw()
{ 
  //fc++;
  //background(59, 224, 92); //clear it back to the background every frame
  
  
  
  /*
  plane();//shows the plane at the randomized location
  drawPurpleEnemy1(); //purple enemy functions 
  drawPurpleEnemy2();
  drawPurpleEnemy3();
  drawPurpleEnemy4(); 
  
  if(gameOn && true)
  { 
    pushMatrix();
    //all movement parts of each element goes here
    //planeFollowMouse(); //draws plane that follows mouse, but lags behind it
    purpleEnemy1();
    purpleEnemy2();
    purpleEnemy3();
    purpleEnemy4();
    popMatrix();
    
    randPos(); 
    resetMatrix();  
  }
  */
}//end of draw







void plane()
{
  pushMatrix();  
    
    rotate(atan2(mouseY - planeY, mouseX - planeX)); 
    
    //plane will be an yellow X for now
    //will make it more realistic later
    noStroke();
    fill(255, 252, 0);//yellow colour of the plane
    rectMode(CENTER);
    rect(planeX, planeY, 12, 40);//two lines that intersect to make an X
    rect(planeX, planeY, 40, 12);
    fill(255, 0, 0);
    rect(planeX +17, planeY, 8, 8);
    stroke(0);
    strokeWeight(1); 
   
  popMatrix();
}






//function to code the plane as it will follow the mouse
//but it will not be directly on the mouse
//has to go to the position of where the mouse is
void planeFollowMouse()
{
  pushMatrix();
  
    background(59, 224, 92);
   
    //move horizontal towards mouse
    if(mouseX > planeX)
    {
      planeX += 1.5;//move plane to the right
    }  
    else if(mouseX < planeX)
    {
      planeX -= 1.5;//move plane to the left
    }
    
    //move vertical towards mouse 
    if(mouseY > planeY)
    {
      planeY += 1.5; //move plane down to the mouse
    }
    if(mouseY < planeY)
    {
      planeY -= 1.5; //move plane up to the mouse
    }  
  
    plane();
  
  popMatrix(); 
}//end of planeFollowMouse






//random placements will be generated for each varible (Fire, Lake, Landing Feild)
//using the while loop so they are not too close together
void randPos()
{
  //grass background to clear the screen 
  //to not show the previous drawings
  drawRandomLake();
    
    while(rFireXPos > 70 + rLakeXPos || rFireXPos < rLakeXPos - 70 && rFireYPos > 50 + rLakeYPos || rFireYPos < rLakeYPos -50) 
    {
      drawRandomFire();
    }
    
    while(rLSXPos > 70 + rFireXPos || rLSXPos < 70 + rFireXPos && rLSXPos > 70 + rLakeXPos || rLSXPos < 70 + rLakeXPos && rLSYPos > 50 + rFireYPos || rLSYPos < 50 + rFireYPos && rLSYPos > 50 + rLakeYPos || rLSYPos < 50 + rLakeYPos)
    {
      drawLandingStrip(); 
    }
}







//fucntion to generate random pos for the fire
//it will never be drawn outside of the screen
//and it will not be in 50 px of the already drawn lake
void drawRandomFire()
{
  fill(255, 69, 19);
  stroke(0);
  strokeWeight(1);
  triangle(rFireXPos, rFireYPos, rFireXPos - 7, rFireYPos + 20, rFireXPos + 7, rFireYPos + 20);
  triangle(rFireXPos-8, rFireYPos, rFireXPos - 15, rFireYPos + 25, rFireXPos + 2, rFireYPos + 25);
}//end of drawRandomFire








//function to generate random pos for the lake
//it will never be drawn outside of the screen
void drawRandomLake()
{
  fill(0, 114, 255);
  stroke(0);
  strokeWeight(1);
  ellipse(rLakeXPos, rLakeYPos, 50, 35);
}//end of drawRandomLake








//function to generate random pos for the lake
//it will never be drawn outside of the screen
void drawLandingStrip()
{
  fill(158, 255, 115);
  noStroke(); 
  ellipse(rLSXPos, rLSYPos, 50, 50);
  stroke(0); 
  strokeWeight(1); 
}//end of drawRandomLake







//function which draws in a purple enemy 
//in the corner of the game.
void drawPurpleEnemy1()
{
 fill(180, 22, 254);//purple fill colour
 rectMode(CENTER);
 rect(bs1x, bs1y, 33, 33);
}


//function which draws in a purple enemy 
//in the corner of the game.
void drawPurpleEnemy2()
{
 fill(180, 22, 254);//purple fill colour
 rectMode(CENTER);
 rect(bs2x, bs2y, 33, 33);
}



//function which draws in a purple enemy 
//in the corner of the game.
void drawPurpleEnemy3()
{
 fill(180, 22, 254);//purple fill colour
 rectMode(CENTER);
 rect(bs3x, bs3y, 33, 33);
}



//function which draws in a purple enemy 
//in the corner of the game.
void drawPurpleEnemy4()
{
 fill(180, 22, 254);//purple fill colour
 rectMode(CENTER);
 rect(bs4x, bs4y, 33, 33);
 rectMode(CORNER);
}







void purpleEnemy1()
{
  pushMatrix();
  
  //if we ever get too far right
  //make it go left
  if (bs1x > width -60)
  {
    bsIsRt = false; //make it go left
    rRotSqr = random(-5, 5); //generate angular velocity
   
  }
  else if(bs1x < 60)
  {
    bsIsRt = true; //make it go right
    rRotSqr = random(-5, 5); //generate angular velocity
  }
  
  //move horz
  if(bsIsRt == true)
  {
    bs1x += 1 + int(random(-4, 4)); //go right
  }
  else
  {
    bs1x -= 1 + int(random(-4, 4)); //go left
  }
  
  if(bs1y > height - 60)
  {
    bsIsUp = true; //make it go up
    rRotSqr = random(-5, 5);//generate new angular velocity
  }
  if(bs1y < 60)
  {
    bsIsUp = false; //make it go down
    rRotSqr = random(-5, 5);//generate new angular velocity
  }
  
  if(bsIsUp == true)
  {
    bs1y -= 1 + int(random(-4, 4)); //go up
  }
  else
 {
  bs1y += 1 + int(random(-4, 4)); //go down
 } 
 
 angSqr += rRotSqr; //rotate the square
 
 //rotate the square
 translate((bs1x+17), bs1y+17);
 rotate(radians(angSqr));//rotate
 translate(-(bs1x+17), -(bs1y+17)); //move it back to the origin
 
 drawPurpleEnemy1();
 
 popMatrix();//done isolating memory
}//end of drawBouncySquare1







void purpleEnemy2()
{
  pushMatrix();
  
  //if we ever get too far right
  //make it go left
  if (bs2x > width -60)
  {
    bsIsRt = false; //make it go left
    rRotSqr = random(-5, 5); //generate angular velocity
  }
  
  else if(bs2x < 60)
  {
    bsIsRt = true; //make it go right
    rRotSqr = random(-5, 5); //generate angular velocity
  }
  
  //move horz
  if(bsIsRt == true)
  {
    bs2x += 1 + int(random(-4, 4)); //go right
  }
  
  else
  {
    bs2x -= 1 + int(random(-4, 4)); //go left
  }
  
  if(bs2y > height - 60)
  {
    bsIsUp = true; //make it go up
    rRotSqr = random(-5, 5);//generate new angular velocity
  }
  
  if(bs2y < 60)
  {
    bsIsUp = false; //make it go down
    rRotSqr = random(-5, 5);//generate new angular velocity
  }
  
  if(bsIsUp == true)
  {
    bs2y -= 1 + int(random(-4, 4)); //go up
  }
  
  else
  {
   bs2y += 1 + int(random(-4, 4)); //go down
  } 
 
 angSqr += rRotSqr; //rotate the square
 
 //rotate the square
 translate((bs2x+17), bs2y+17);
 rotate(radians(angSqr));//rotate
 translate(-(bs2x+17), -(bs2y+17)); //move it back to the origin
 
 drawPurpleEnemy2();
 
 popMatrix();//done isolating memory
}//end of drawBouncySquare2








void purpleEnemy3()
{
  pushMatrix();
  
  //if we ever get too far right
  //make it go left
  if (bs3x > width -60)
  {
    bsIsRt = false; //make it go left
    rRotSqr = random(-5, 5); //generate angular velocity
  }
  
  else if(bs3x < 60)
  {
    bsIsRt = true; //make it go right
    rRotSqr = random(-5, 5); //generate angular velocity
  }
  
  //move horz
  if(bsIsRt == true)
  {
    bs3x += 1 + int(random(-4, 4)); //go right
  }
  
  else
  {
    bs3x -= 1 + int(random(-4, 4)); //go left
  }
  
  if(bs3y > height - 60)
  {
    bsIsUp = true; //make it go up
    rRotSqr = random(-5, 5);//generate new angular velocity
  }
  
  if(bs3y < 60)
  {
    bsIsUp = false; //make it go down
    rRotSqr = random(-5, 5);//generate new angular velocity
  }
  
  if(bsIsUp == true)
  {
    bs3y -= 1 + int(random(-4, 4)); //go up
  }
  
  else
  {
    bs3y += 1 + int(random(-4, 4)); //go down
  } 
 
 angSqr += rRotSqr; //rotate the square
 
 //rotate the square
 translate((bs3x+17), bs3y+17);
 rotate(radians(angSqr));//rotate
 translate(-(bs3x+17), -(bs3y+17)); //move it back to the origin
 
 drawPurpleEnemy3();
 
 popMatrix();//done isolating memory
}//end of drawBouncySquare3







void purpleEnemy4()
{
  pushMatrix();
  
  //if we ever get too far right
  //make it go left
  if (bs4x > width -60)
  {
    bsIsRt = false; //make it go left
    rRotSqr = random(-5, 5); //generate angular velocity
  }
  
  else if(bs4x < 60)
  {
    bsIsRt = true; //make it go right
    rRotSqr = random(-5, 5); //generate angular velocity
  }
  
  //move horz
  if(bsIsRt == true)
  {
    bs4x += 1 + int(random(-4, 4)); //go right
  }
  
  else
  {
    bs4x -= 1 + int(random(-4, 4)); //go left
  }
  
  if(bs4y > height - 60)
  {
    bsIsUp = true; //make it go up
    rRotSqr = random(-5, 5);//generate new angular velocity
  }
  
  if(bs4y < 60)
  {
    bsIsUp = false; //make it go down
    rRotSqr = random(-5, 5);//generate new angular velocity
  }
  
  if(bsIsUp == true)
  {
    bs4y -= 1 + int(random(-4, 4)); //go up
  }
  
  else
  {
    bs4y += 1 + int(random(-4, 4)); //go down
  } 
 
 angSqr += rRotSqr; //rotate the square
 
 //rotate the square
 translate((bs4x+17), bs4y+17);
 rotate(radians(angSqr));//rotate
 translate(-(bs4x+17), -(bs4y+17)); //move it back to the origin
 
 drawPurpleEnemy4();
 
 popMatrix();//done isolating memory
}//end of drawBouncySquare4







void mousePressed()
{
  gameOn = true; 
}

//colour codes
//purple (180, 22, 254)
//red (255, 69, 19)
//yellow (255, 252, 0)
//lighter green (158, 255, 115)
//blue (0, 114, 255)
//lighter blue (115, 237, 255)
