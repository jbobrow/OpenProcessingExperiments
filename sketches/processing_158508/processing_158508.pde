



 
float x;
float y;
float px;
float py;
float xPosition = 0;
float yPosition;
int speed=1;  
int lives=3; 
int score=0;
int objectSize=20;


  boolean fire = false;
  


   
 
 int gameOver = 0;
 
 
  import ddf.minim.*;
    Minim minim;
    AudioPlayer song;
    
    
 
 int getRandomX()
   
   

  {
    return int(random(600));
  }
   
  int[] objectx = { getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX() };
  int[] objecty = { 0, 0, 0, 0, 0 };
   
   
   
   
   
   
   
 //setup for game  
   
  void setup()
  {
     
    //Size
    size (900, 500);
    smooth ();
    
    
  
  
    minim = new Minim(this);
    song = minim.loadFile("gametheme.mp3");
    song.play(0);


   
  
  
   
  }
   
   
   
   
   
  void draw()
  {
 
   //Game Style
   background ( 0);
   fill(255);
   ellipse(12,10,12,12);
   ellipse(53,439,12,12);
   ellipse(172,350,10,10);
   ellipse(258,224,10,10);
   ellipse(389,183,10,10);
   ellipse(456,82,12,12);
   ellipse(537,467,10,10);
   ellipse(666,357,10,10);
   ellipse(775,279,10,10);
   ellipse(888,186,10,10);
   ellipse(59,95,12,12);
   ellipse(118,430,10,10);
   ellipse(282,388,10,10);
   ellipse(374,273,10,10);
   ellipse(468,194,12,12);
   ellipse(556,45,10,10);
   ellipse(644,472,10,10);
   ellipse(732,388,12,12);
   ellipse(896,293,10,10);
   float targetX = mouseX;

  float targetY = mouseY;
  
  float weight=dist(x,y,px,py);

    fill(255);
    stroke (255);
    ellipse(mouseX,mouseY,20,20);
   
    
    
    
    // display score
    fill(255);
    text("score:"+score, 30,45);
    text("lives = "+lives,width-150,45);  
    textSize(30);
    if(fire)
    {
     
  
      cannon(mouseX);
      fire = false;
      
    }
   {
   
     objectFalling();
     gameFinish(); 
  }
  }
   

  
 
 
  //Play the game
  
  void mousePressed(){
  
  {
    fire = true;
  }
    
}
   
  void objectFalling()
  { 
    stroke(0);
    fill (120,255,150);
     
    for (int i=0; i<5; i++)
    {
      ellipse(objectx[i], objecty[i]++, objectSize, objectSize);
    }

  }
 
    
  void cannon(int shotX)
  {
    boolean strike = false;
    for (int i = 0; i < 5; i++)
    {
      if((shotX >= (objectx[i]-objectSize/2)) && (shotX <= (objectx[i]+objectSize/2))) {
        strike = true;
        line(mouseX, 200, mouseX, objecty[i]);
        ellipse(objectx[i], objecty[i],
                objectSize+25, objectSize+25);
        objectx[i] = getRandomX();
        objecty[i] = 0;
       
 
 
// update score
        score++;
      }   
      
  
    
   
    if(strike == false)
    {
      line(mouseX, mouseY, mouseX, 0);
    } 
   
  }
  }
   
  //GameOver
   
  void gameFinish()
  {
    for (int i=0; i< 5; i++)
    {
      if(objecty[i]==530)
      {
 
     
        fill(color(255));
     fill(255);
    textAlign(CENTER);
    textSize(25);
    text("GAME OVER", width/2, height/2);
    text("You let Earth die! But you killed this many invaders! : "+ score, width/2, height/2 + 50);
       
     noLoop();
      }
      
    
   
    } 
  }



 
   

        


      
      
 
  
  



