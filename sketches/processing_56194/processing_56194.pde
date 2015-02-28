
public class Enemy{
  
   public double xpos = 0;
   public double ypos = 0;
   public boolean jewelOrEnemy; 
   public boolean playerOverJewel;
   public boolean playerGrabbingJewel;
   public boolean jewelDropped;
   PImage police;
   PImage jewel;
   
 
   Enemy( double x, double y, boolean enemy){
     
     xpos = x;
     ypos = y;
     jewelOrEnemy = enemy;
            
     police = loadImage("police.png");
     jewel = loadImage("jewel.png");
     playerOverJewel = false;
     playerGrabbingJewel = false;
     jewelDropped = false;
   } 
  
   void moveEnemy(int x, int y){
     
     if( xpos + x < 800 && xpos + x > 0)
     xpos += x;
     
     if(ypos + y < 480 && ypos + y > 0)
     ypos += y;
     
   }
   
   void moveTowardsPlayer(double playerX, double playerY){
     
     float tempx = 0;
     float tempy = 0;
     
   
       if( playerX - xpos > 0)  // if the player is to the right of the enemy
           xpos += random ( 0, 1); 
           
       if( playerX - xpos < 0)
           xpos -= random ( 0, 1); 
           
       if( playerY - ypos > 0)
           ypos += random ( 0, 1); 
          
       if( playerY - ypos < 0)
           ypos -= random ( 0, 1); 
     
     
    /* if( !pVisible){
       
         tempx = random( -50, 50);
         tempy = random( -50, 50);
         
         if( xpos + tempx > 25 && xpos + tempx < 775)
         xpos += tempx;
         
         if( ypos + tempy > 25 && ypos + tempy < 455)
         ypos += tempy;
       
     }*/
       
     
   }
   
  
   void drawEnemy(){
     
      fill( 255, 30, 30);
      
      if( !jewelOrEnemy ){
      if( !playerOverJewel )
        fill( 100, 100, 100);
        
      if( playerOverJewel == true)
        fill( 240, 240, 240);
        
        image( jewel, (int)xpos, (int)ypos);
      
      }
      else if(jewelOrEnemy)
        image( police, (int)xpos, (int)ypos);
      
   }

}

