
float      playerX, playerY;
PImage     bg;
PImage     g;
PImage     button;
int        score;
Cirkel     cirkel1;
Cirkel     cirkel2;
Cirkel     cirkel3;


void setup()
{
  size     (800, 600);
  
  playerX  = 300;
  playerY  = 420;
  
  bg       = loadImage("sky.jpg");
  g        = loadImage("grif2.png");
  button   = loadImage("score.png");
  score    =  0;
  
  //maakt nieuwe cirkels aan op de aangegeven punten
  cirkel1  = new Cirkel(700,0,75,1.5);
  cirkel2  = new Cirkel(70,0,50,3);
  cirkel3  = new Cirkel(400,0,20,2);
  
  
  
  
}
void draw()
{
  background   (180);
  background   (bg);
  image        (button,0,0);
  image        (g,playerX, playerY); 
   
  cirkel1.updateCirkel();
  cirkel1.testCirkel();
  cirkel1.tekenCirkel();
  cirkel2.updateCirkel();
  cirkel2.testCirkel();
  cirkel2.tekenCirkel();
  cirkel3.updateCirkel();
  cirkel3.testCirkel();
  cirkel3.tekenCirkel();
  fill(0);
  text(score,62,27);
  
}


 





class Cirkel{
  float      cirkelX;
  float      cirkelY;
  float      hoogte;
  float      snelheid;
  
  

Cirkel(float tempcirkelX,float tempcirkelY,float temphoogte, float tempsnelheid){
         
         cirkelX = tempcirkelX;
         cirkelY   = tempcirkelY;
         hoogte=    temphoogte;
         snelheid=    tempsnelheid;
 
  }
  
void updateCirkel(){
    cirkelY      = cirkelY  +snelheid;
 }
 
void testCirkel(){
  if(cirkelY > height){
     cirkelY=0;
     
     cirkelX= random(100,500);
      int score;
      
  }
   if(cirkelX> playerX && cirkelX < playerX + 180 && cirkelY > playerY-25)
      {
        score = score+1;
        cirkelY= 0;
      }
   if(score >50 ){
     
     score= 0;
     
   }
   

}

      
void tekenCirkel(){
        fill         (175);
        ellipse      (cirkelX,cirkelY,hoogte,hoogte); 
}
   
  
   }



  void keyPressed()
  {
      if (key == 'd'){
        playerX = playerX + 7;
      }
      if  (key == 'a'){
        playerX = playerX - 7;
      }

}



