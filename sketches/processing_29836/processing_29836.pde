
PFont fontA;
  int diameter = 20;
  int  c = 250; 
  float y = 400.0;
  boolean shoot = false;
  float bulletSpeed = 25.0;
  int bulletDirection = 1;
  float bulletX;
  int score;
  int screenNumber;
  
  int randx()
  {
    return int(random(700));
  }
  
  int[] enemyX = { randx(), randx(), randx(), randx(), randx() };
  int[] enemyY = { 0, 0, 0, 0, 0 };

 
  void setup()
  {
    size(800,480);
    noCursor();
    screenNumber = 1;
  }

    
  void draw()
  {
    background(1, 1, 49);     
    if(screenNumber == 1) {   
    textSize(32);
    text("Starship Invaders", width/2.88, height/2.55);
    textSize(18);
    text("click the mouse to start", width/2.6, height/2);
    score = 0;
  }

   if(screenNumber == 2)
 {
    smooth();
    stroke(255);
    fill(255, 255, 255, 80);
    for (int i=0; i<5; i++)
    {
      rect(enemyX[i], enemyY[i]++,
              diameter, diameter);
    if(enemyX[i] == width+10)
    {
    score = score - 1;
    }

    }
    fill(c, 89, 8, 80);
    stroke(c, 89, 8, 90);
    triangle(mouseX-8, 435, mouseX+8, 435, mouseX, 405);
    fill(255, 90);
    stroke(255, 255, 50);
    ellipse (bulletX, y, 10, 10);
    fill (255);
    text("Score: " + score, 40,50);
    y -= bulletSpeed*bulletDirection;
  
    if(shoot==true)
    {
      enemy(mouseX);
      shoot = false;
    }
 }
 
     for (int i=0; i< 5; i++)
    {
      if(enemyY[i]==470)      
      {
      fill(color(255,0,0));
      screenNumber = 3;
      }
    }
 
if(screenNumber == 3) {
    textSize(18);
    text("Game Over", width/2.25, height/2);
    text("Score: " + score, width/2.19, height/1.8);
  }  
}


  void reset () {
    
         for (int i=0; i< 5; i++) {
enemyY[i] =0;
         }
     setup(); 
  }

  
  void mousePressed()
  {
    shoot = true;
    bulletX = mouseX;
    y = 400;
    
    if(screenNumber == 1){
      screenNumber = 2;
    }

      else if(screenNumber == 3){
        screenNumber =1;
        reset ();
      }    
  }

  
  void enemy(int shotX)
  {
    boolean hit = false;
    for (int i = 0; i < 5; i++)
    {
      if((shotX >= (enemyX[i]-diameter/1)) && 
         (shotX <= (enemyX[i]+diameter/1)))
      {      
        hit = true;
        ellipse(enemyX[i], enemyY[i],
                diameter+30, diameter+30);
        enemyX[i] = randx();
        enemyY[i] = 0;
      score = score + 1;
      }    
    }
  }
  
  
  
  


