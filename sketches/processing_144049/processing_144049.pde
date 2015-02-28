
int currentPage = 0;
PImage baseIm;
PImage base2Im;
PImage Ship; 
PImage monsters;
PImage InfoIm;
float r;
float leftright = 0;
PImage bullets;
boolean Infobuttonappear = true;
int ypos=511;

//initialise score variable
int score;
int ballSize = 20;
  boolean fire = false;
   
  //Initialise gameOver variable
 int gameOver = 0;
  
 //int startGame;
  int getRandomX()
   
   
 // int score;
  {
    return int(random(600));
  }
   // monsters/balls to fall randomly  
  int[] monstersx = { getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX() }; 
  int[] monstersy = { 0, 0, 0, 0, 0 };
   
  void setup(){
     
    size(900, 611); //background size
     background(0); //background color
     Ship=loadImage("SpaceShip.png"); //space ship picture w/ Khyron's head
     baseIm=loadImage("StartScreen.jpg"); //background image for startscreen
     base2Im=loadImage("StartScreen2.jpg"); //background image for 2nd page
     monsters=loadImage("Monster drawing.png"); //monster picture
     InfoIm=loadImage("infobutton.png"); //info button picture 
     r=random(511); //to make monster/ship start at a different location
     bullets = loadImage("bullets.png"); //bullets image 
    
  }
   
void draw(){
   //Game Style
    
    if(currentPage == 0){ //if then starts at 0  
      image(baseIm, 0,0); //background image on full screen 
       //drawStartButton(); 
    }
    else if(currentPage == 1){ //else if then starts at 1
       drawLevelOne();  //then go to second page 
       image(base2Im, 0,0); //calling 2nd background image on 2nd page
    
      image(Ship,mouseX-leftright,ypos); //ship on page one
      text(score, 20,20); //write score 
    if(fire){   //if mouse clicked then khyron fires
      cannon(mouseX);
      fire = false;
     }
    
    if(Infobuttonappear ==true){ //if info button is true
       drawinfobutton(); //make a drawinfobutton function
    }   
     ballFalling(); //ball falling 
     gameFinish(); //game over      
    }
   
  }
  
 void drawinfobutton(){ //drawinfobutton functions
  image(InfoIm, 780, 580); //make image appear on the screen
}

void drawLevelOne(){ //goes to second page 
   background(0); //2nd background color
   if(Infobuttonappear ==true){ //placed in drawLevelOne to make it appear on second page
      drawinfobutton(); //calling infobutton  
      
   }  
}
  
  
  //Play the game
   
  
  void mousePressed(){
     if(currentPage == 0 && mouseX > 100 && mouseX < 1000 && mouseY > 100 && mouseY < 711){ //first page to click on to start game
      currentPage = 1;  //second page
  }
  else if(currentPage==1){ //else if for firing the bullet 
    
    fire = true; //fire =true
  }
  }
  void ballFalling() 
  { 
    stroke(39, 154, 240); //ball size
    fill (0, 0, 0); //color
     
    for (int i=0; i<5; i++) //how many falls at a time
    {
      ellipse(monstersx[i], monstersy[i]++, ballSize, ballSize); //where it will fall
    }
  }
   
  void cannon(int shotX) //the shooting head
  {
    boolean strike = false; 
    for (int i = 0; i < 5; i++) //can shoot however many times
    {
      //shoot and disappear however many times
      if((shotX >= (monstersx[i]-ballSize/2)) && (shotX <= (monstersx[i]+ballSize/2))) { 
        strike = true;
        line(mouseX, 565, mouseX, monstersy[i]);
        ellipse(monstersx[i], monstersy[i],
                ballSize+25, ballSize+25);
        monstersx[i] = getRandomX();
        monstersy[i] = 0;
 
 
// update score
        score++;
      }   
    }
   
    if(strike == false)
    {
      line(mouseX, 565, mouseX, 0);
    } 
   
  }
   
   
  //GameOver
   
  void gameFinish()
  {
    for (int i=0; i< 5; i++)
    {
      if(monstersy[i]==530)
      {
 
     
        fill(color(255,0,0));
     fill(255, 0, 0);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    text("Well done! Your score was : "+ score, width/2, height/2 + 50);
       
     noLoop();
 
   
       }
      }
    }


