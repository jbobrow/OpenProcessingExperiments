
PFont fontA; //font style
  int diameter = 20;  
  float y = 400.0; //position from which firing takes place
  boolean shoot = false; 
  float bulletSpeed = 25.0;//Bullet speed 
  int bulletDirection = 1;//Makes the Bullet shoot up 
  float bulletX;
  int score;// starting score 
  int screenNumber;//The starting screen number  
  int randx() 
  { 
    return int(random(700)); 
  } 

  int[] enemyX = { randx(), randx(), randx(), randx(), randx(),};//enemy starts in random x postion 
  int[] enemyY = { 0, 0, 0, 0, 0,};//enemy starts at the top 

  void setup() 
  { 
    textSize(50);//size of text
    size(800,480);//size of the screen  
    noCursor();//removes the mouse cursor  
    screenNumber = 1;//The first screen 
  } 

  void draw() 
  { 
    background(0,150,255);//color of the background      
    if(screenNumber == 1)//The first screen  
    {   
    textSize(50);//size of text
    fill(255,255,0);//colour of text
    text("Apocalypse", width/3, height/2.55);//Title of the Game 
    textSize(20);
    fill(255); 
    text("click mouse to start", width/2.6, height/2);//text postion 
    score = 0; 
  } 
   if(screenNumber == 2)//The Second Screen 
 { 

    smooth();
    stroke(255,255,0);//adds yellow stroke
    strokeWeight(3); 

    for (int i=0; i<5; i++) //starts of with 5 enemy fire and keeps brining it back to 5 if any are shot down
    {   
                 fill(255,0,0);//color of fire
     ellipse(enemyX[i], enemyY[i]++,//fire 
              30, 34); 
    
       fill(150,100,50);//color of the enemy 
       ellipse(enemyX[i], enemyY[i]++, 
              diameter, diameter); //shape and size of enemy
  
   
    if(enemyX[i] == width+10) 
    { 
    score = score - 1; 
    } 
    } 
   
    fill(255,255, 0);//color of the bullet
    noStroke();  
    ellipse (bulletX, y, 10, 10);//the bullet 

    textSize(30);
    fill (255);//color of the score text 
    text("Score: " + score, 40,50); 


    fill(255,255,0);//color of explosion
    noStroke();
       
    fill(0,200,0);//color of the earth
    rect(0,430,800,480);//The earth
       
       fill(200,150,0);//tree bark color 1st tree
    rect(50,370,10,60);//tree bark 1st tree
    
       fill(0,100,0);//color of leaves 1st tree
    triangle(55,320,80,390,30,390);//leaves 1st tree
    
           fill(200,150,0);//tree bark color 2nd tree
    rect(650,370,10,60);//tree bark 2nd tree 
    
       fill(0,100,0);//color of leaves 2nd tree
    triangle(655,320,680,390,630,390);//leaves 2nd tree
    
       fill(0,150,0);//color of tank 
    stroke(0);
    strokeWeight(1); 
    triangle(mouseX-18, 415, mouseX+18, 415, mouseX, 405); 
    fill(128);//color of tank wheels 
    ellipse(mouseX,425,50,10);
    fill(0,150,0);//color of tank  
    rect(mouseX-25,415, 50, 8);  
    rect(mouseX-2, 399, 4,6); 
  
    y -= bulletSpeed*bulletDirection; //speed of bullet


     
    if(shoot==true) 
    { 
      enemy(mouseX); 
      shoot = false; 
    } 
 } 


     for (int i=0; i<5; i++) //starts of with 5 enemy fire and keeps bringing it back to 5 if any are shot down
    { 
      if(enemyY[i]==470)//if 1 enemy fire reaches the ground where y is 470 the game is over      
      { 
      fill(color(255,0,0)); 
      screenNumber = 3; 
      } 
    } 


    
if(screenNumber == 3) { 
    textSize(30); //size of text
    fill(255,250,0); //colour of text
    text("Game Over", width/3, height/2);//makes the game say game over 
    text("Score: " + score, width/3, height/1.6);//shows your score 
  }  
} 


  void reset () { 
       for (int i=0; i< 5; i++) { 
enemyY[i] =0;//Makes enemy reappear at the top 
 } 
     setup(); 
  } 


  void mousePressed() 
  { 
    shoot = true; 
    bulletX = mouseX; //makes the bullets fire when mouse pressed
    y = 400; //Makes bullets fire from row where y is 470 and x is where the mouse is


   
    if(screenNumber == 1) 
    { 
      screenNumber = 2;// Makes screen one change to screen 2 when clicked 

    } 
    else if(screenNumber == 3) 
      { 
       screenNumber =1;//resets the game 
        reset (); 
      }    
  } 


   
  void enemy(int shotX) 
  { 
    boolean hit = false; 
    for (int i = 0; i < 5; i++) 
    { 
      if((shotX >= (enemyX[i]-diameter/2)) && 
      
         (shotX <= (enemyX[i]+diameter/2)))
      {      
        hit = true; 
        ellipse(enemyX[i], enemyY[i], 
                diameter+30, diameter+30); 
                
        enemyX[i] = randx();//Tracks the x position of each enemy fire 
        enemyY[i] = 0;//Tracks the y position of each enemy fire 
      score = score + 1; 
      }    
 } 
  }
