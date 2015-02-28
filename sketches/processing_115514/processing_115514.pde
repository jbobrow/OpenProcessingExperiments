
//IMAGES
PImage city1; //background
PImage man; //playable character
PImage cat1; //cat picture 1
PImage dog1; //dog picture 1
PImage cat2; //cat picture 2
PImage dog2; //dog picture 2

//playable character
float XPos; //playable character position

//speed of animals falling
int dx = 1;
int dy = 3;
 
//VARIABLES
// animal locations
float x = 5; //cat1
float y = -20;

float x1 = 5; //dog1 
float y1 = -200;

float x2 = 5; //cat2
float y2 = -300;

float x3 = 5; //dog2
float y3 = -450;

boolean gameover = false; //stops game from closing as soon as opened
  
 
 void setup() {
 
  size(600,600);
  city1 = loadImage("city1.jpg"); //background
  man = loadImage("man.png"); //playable character
  cat1 = loadImage("cat1.png"); //cat picture 1 
  dog1 = loadImage("dog1.png"); //dog picture 1
  cat2 = loadImage("cat2.png"); //cat picture 2
  dog2 = loadImage("dog2.png"); //dog picture 2
   x = random(30,450);
   x1 = random(30,450);
   x2 = random(30,450);
   x3 = random(30,450);
  
}
 

void draw() {

  if (!gameover) { //If gameover variable not false continue game
  background(0);
   image(city1,0,0);
   image(man, XPos, 480);

     y = y + dy;
     y1 = y1 + dy;
     y2 = y2 + dy;
     y3 = y3 + dy;
    
     
     image(cat1, x, y);
     image(dog1,x1,y1);
     image(cat2,x2,y2);
     image(dog2,x3,y3);
    


      
//Use random function on x position to bring characters in from top of screen
     if( y > height) {
       y=-20; x=random(50,600);}
     if(y1 > height) {
         y1=-20; x1=random(50,600);}
      if( y2 > height) {
         y2=-20; x2=random(50,600);}
      if( y3 > height) {
         y3=-20; x3=random(50,600);}
    


        if(key==CODED) {
        if(keyPressed == true) {
            if(keyCode == RIGHT && XPos<500){
                XPos += 7;
            }
   
            else{
                if(keyCode == LEFT && XPos>-0) {
                    XPos -= 7;
                }
       
                else {
                    XPos = XPos;
                }
   
              }
          }
      }
       

// COLLISION
//// x and y variables are tested - if the cat / dog collides with player, display message relevant message but coninue the game


      if (collision(x,y)){
          dy = 3; gameover = false; textSize(49);
                text("MEOW! A CAT GOT YOU!", 10, 100);
                fill(255,255,0);} //yellow text
      
      if (collision1(x1,y1)){
          dy = 3; gameover = false; textSize(49);
                text("WOOF! A DOG GOT YOU! ", 10, 100);
                fill(255,0,0);} //red text
     
      if (collision1(x2,y2)){
          dy = 3; gameover = false; textSize(49);
                text("MEOW! A CAT GOT YOU!", 10, 100);
                fill(0, 137, 255);} //blue text
      
      if (collision1(x3,y3)){
          dy = 3; gameover = false; textSize(49);
                text("WOOF! A DOG GOT YOU!", 10, 100);
                fill(255,255,255);} //white text
           
  }
  }
 
 
 
// Pass the x and y varables into collision functions. 
//// If player maintains man's x position of less than 30 and the y position of more than 450, return true and continue game.
///// If man's x position between 30 and the y position 450, return false, display relevant collision message andand continue game

boolean collision (float x, float y)
{
    if (Math.abs(x-XPos)<30 && y > 450){
        return(true);
    } else{
      return(false);
    }
}
 
 
boolean collision1 (float x1, float y1)
{
   if (Math.abs(x1-XPos)<30 && y1 > 450){
        return(true);
    } else{
      return(false);
    }
}
 
boolean collision2 (float x2, float y2)
{
    if (Math.abs(x2-XPos)<30 && y2 > 450){
        return(true);
    } else{
      return(false);
    }
}

boolean collision3 (float x3, float y3)
{
    if (Math.abs(x3-XPos)<30 && y3 > 450){
        return(true);
    } else{
      return(false);
    }
}




  
  
  
  



