
/* 
              FINAL PROJECT (Bringing It All Together)
                       DON'T DROP THE BALL!!
                          (By Isaac Groisman)
                          
 For the final project I made a game, basically it's about trying to hit a ball as
many times as you can with a paddle and not leaving it fall, if you hit it 50 times
you win the game, but there's a catch, each time you hit the ball, the paddle gets
smaller and smaller, so if you miss 50 times you lose the game and you'll have to restart.
When you get to the interface of the game you will see in the screen the instructions to start
playing by pressing the mouse, also you'll see the scores set to 0 in the upper left side, 
the game has its music audio made with soundation and made sure has no clips with audacity, 
it demonstrates use of sound concept, matching the theme of the work. when you start the game 
the sound starts playing, also you can mute the sound if you want by pressing 'M' and unmuted with 'U', 
you can pause the game any time you're playing with 'P', so the game and sound will stop, a message will be
displayed to unpause it with 'U'. And also you can take a screenshot of the game by pressing the 's' key.
After one of the scores get to 50, the game stops and pops a message to restart the game. 
I tried to specify with comments in lines of the code so you can understand what the code 
is trying to do. The background was made with photoshop, with a nice landscape image and two kids that 
are going to play ping pong, as you can see that demonstrates the visual concept, matching the 
theme of the work. 
Creative-Commons licensed images as sources, taken from some websites, searched by http://search.creativecommons.org/
(these below images/photo are not created by me, I give credits to the source websites in the assignment page) 
links:
http://commons.wikimedia.org/wiki/File:Landscape.svg
http://www.flickr.com/photos/yuvalh/526341317/
                      
   So will you get more hits than misses? 
    
*/

//Import 'Minim' library file
import ddf.minim.*;


//Declare Variables 
float ballX = 200;                   //Position of the ball X
float ballY = 100;                   //Position of the ball Y
float speedX = 10;                  //How fast is X moving?
float speedY = 2;                   //How fast is Y moving?
int hit = 0;                        // declaring the integer numbers that will be displayed on the screen
int miss = 0;
String info_1 = "Click to start New Game";
String info_2 = "PAUSED";
String info_3 = "Press 'U' to Unpause";
String info_4 = "Press 'P' to Pause Game";
String info_5 = "Press 'S' to screenshot";
String info_6 = "Hit 50 and You win!!";
String info_7 = "Press 'M' to Mute Sound";
String info_8 = "MUTED";
String info_9 = "Press 'U' to Unmute";
PImage background;                           //declaring the image that will be displayed
Minim minim;
AudioPlayer game_sound;                      //declaring sound that you'l hear

//setup()
void setup(){
  size(800, 600);                                  //window size of th sketch
  background = loadImage("background.png");        //load image file from HDD
  minim = new Minim(this);
  game_sound = minim.loadFile("game_sound.mp3");
  noLoop();                                       //this will pause the game from the beginning
  
}

//draw()
void draw(){
                                       
  float paddle = 1000/(hit+10);                      //the value and formula of the paddle to get smaller with every hit
  if(ballX < 0 || ballX > width) speedX = -speedX;   // makes sure the ball "bounces" off of the walls for the x position of the ball(by decreasing it's own speed)
  if(ballY > height){                                // makes sure the ball "bounces" off of the walls for the y position of the ball(by decreasing it's own speed)
    speedY = -speedY;                                
    float distance = abs(mouseX - ballX);            //declaring the distance to determine when tha ball has contact with the paddle(the absolute value "magnitude" of the mouse x position minus the x position of the ball
    if(distance < paddle) hit += 1;                  //this gives 1 hit point each time when you hit the ball with the paddle 
    else miss += 1;                                  // else 1 miss point each time when you miss hitting the ball
  } else speedY += 1;                                //will make tha ball bounce in a different way, not always in the same position. else speed on y position will be increased by 1 (bounce faster)
  
  ballX += speedX;                                   //putting each speed on its ball position(putting speed on the ball)
  ballY += speedY;
  
  image(background, 0, 0);                            //drawing the loaded image for background (made with photoshop)
  fill(#F50707);
  ellipse(ballX, ballY, 50, 50);                       //drawing the ball
  fill(#074CF5);
  rect(mouseX-paddle, height-10, 2*paddle, 10);        //"drawing the paddle" mouseX - paddle: so that the paddle does not exceed to pass on the walls, 
                                                       // height-10: to visualize the height of the paddle, to be just right on it's place and not exceed ,
                                                       //2*paddle: placing the formula and the width of the paddle will be reduced 2 times the formula with every hit 
  fill(0);
  textSize(20);
  text("Hit: " + hit, 10, 20);                         //text for hit score
  text("Miss: " + miss, 10, 40);                    //text for miss score
  
  fill(0);
  textSize(20);
  text(info_4, 550, 20);                     //text for pause game
  text(info_7, 550, 50);                     //text for pause sound
  text(info_9, 550, 80);                      //text for unmute 
  text(info_5, 550, 110);                     //text for screenshot
  
  if((hit == 0) && (miss == 0)){     //when both scores are set to 0 it will display a message to start a new game
    fill(0);
    textSize(50);
    text(info_1, 130, 200);
    textSize(20);
    text(info_6, 300, 250); 
  } 
  
  if(hit == 50){                     //when you hit 50 times the ball, the game stops and will display a message that you've won
    textSize(50);  
    text("YOU WIN!!", 200, 100);
    noLoop();
    text("Click to Restart", 200, 200);
    
  } 
  if(miss == 50){                   //when you miss 50 times the ball, the game stops and will display a message that you´ve lost
    textSize(50);  
    text("YOU LOSE!!", 200, 100);
    noLoop();
    text("Click to Restart", 200, 200);
    
  }
     
}


//keyReleased
void keyReleased(){ 
  
  if(key == 'm' || key == 'M'){          //will mute sound when 'm' is pressed
    fill(0);
    textSize(40);
    text(info_8, 400, 200);
    game_sound.mute();          
  }
  
  if(key == 'p' || key == 'P'){        //by pressing the "p" key will pause the game and show a message that is paused
    fill(0);
    textSize(50);
    text(info_2, 300, 200);
    textSize(25);
    text(info_3, 270, 250);
    game_sound.mute();                 // will mute the sound when game is paused
    noLoop();      
  } 

}

//keyPressed()
void keyPressed(){  
  
  if(key == 'u'|| key == 'U'){         //by pressing the "u" key will unpause the game
    loop();
    game_sound.unmute();               //this will unmute the sound    
  }
  
  if (key == 's' || key == 'S') saveFrame("screenshot.png");    //by pressing the "s" key will take a screenshot of the sketch
}  
  
//mousePressed()  
void mousePressed(){         //when mouse is pressed it will start a new game with the scores set to "0"
  hit = 0;
  miss = 0;
  game_sound.loop();         //this will play from the begining and loop the sound
  loop();
} 




