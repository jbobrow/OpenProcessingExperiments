
class Ball {
  
  float x, y, u, v, ballWidth, ballHeight;
  float gravity, speed;
 
  public Ball() {
    
    x = mouseX;
    y = mouseY;

    ballWidth = 5;
    ballHeight = 5;
        
    // Mit Schwerkraft
    
    gravity = 0.1; 
    speed = 2;
    
    // Ohne Schwerkraft
    
    u = random(-2,2);
    v = random(-2,2);

  }

///////////////////////////////////////////////////////////////////////////

  // Kugel mit Schwerkraft zeichnen
  
  void zeichneMitSchwerkraft() {
    
    if (topBorderOn == true && y<20) {}
    
    else {       
      
     if (topBorderOn == true && y <=29) {   

         y=29;
      }
      
      ellipse(x, y, ballWidth, ballHeight);
        
      y -= speed;
      speed -= gravity;
     
      if(x > 25 && x<width-25) {
   
       if (topBorderOn == true) {   
     
        if ( y >= height-54 || y <= 29) {
         
          speed  = -speed;}
        }
   
        else  {       
     
          if ( y >= height-54) {

            speed = -speed;}

          }
      }
    }

  }
  
///////////////////////////////////////////////////////////////////////////

  // Kugel ohne Schwerkraft zeichnen
  
  void zeichneOhneSchwerkraft() {
  
    if (topBorderOn == true && y<20) {}
    
    else {
      
      if (y+v > height-53.5){
   
        y= height-55;
        v =random(-0.99,2);}
               
        ellipse(x+=u, y+=v, ballWidth, ballHeight);
              
        if (topBorderOn == true) {   
      
            if ( y >= height-54 || y <= 29) {

              v = -v;}
             }
   
           else  {      
        
           if ( y >= height-54) {

             v= -v;}
          }

     }
   } 
}

